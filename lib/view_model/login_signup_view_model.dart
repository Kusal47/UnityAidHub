// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:unity_admin/core/const/base_url.dart';
import 'package:unity_admin/core/routes/routes_name.dart';
import 'package:unity_admin/utils/toast_utils.dart';
import '../Models/user_model.dart';
import '../authServices/auth_service.dart';
import '../utils/Helper_Funtions/formdata_to_json.dart';
import '../utils/custom_notification_bar.dart';
import '../utils/dialogs.dart';

class LoginViewModel extends ChangeNotifier {
  Dio dio = Dio();
  bool isLoading = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  List<User> userDetail = [];
  User? findUserByEmail(List<dynamic> userData, String email) {
    return userData.map((user) => User.fromJson(user)).firstWhere((user) => user.email == email);
  }

  Future<void> loginUser(BuildContext context) async {
    isLoading = true;

    (isLoading) ? showLoadingDialog(context) : const SizedBox();
    notifyListeners();
    try {
      if (passController.text.isNotEmpty) {
        FormData formData = FormData.fromMap({
          'email': emailController.text,
          'password': passController.text,
        });
        Map<String, dynamic> jsonData = TextAndImageConversion().formDataToJson(formData);
        print('JSON Data: $jsonData');

        Response response = await dio.post(
          '${ApiUrl.baseUrl}auth/login',
          data: jsonData,
          options: Options(headers: {
            'Content-Type': 'application/json',
          }),
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          print('Data posted successfully');
          print('Response: ${response.data}');
          await AuthService.storeToken(response.data['accessToken']);
          String? token = await AuthService.getToken();
          Response userResponse = await dio.get(
            '${ApiUrl.baseUrl}user/all',
            options: Options(
              headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer $token',
              },
            ),
          );

          List<dynamic> userData = userResponse.data;
          User? currentUser = findUserByEmail(userData, emailController.text);
          String userId = currentUser!.id.toString(); // Assuming currentUser has the ID
          await AuthService.storeUserId(userId);
          if (currentUser != null) {
            if (currentUser.role.contains('ADMIN')) {
              userDetail.add(currentUser);
              print('User Details is $userDetail');
              print('Admin user found');

              await Future.delayed(const Duration(seconds: 3));
              CostumNotificationBar.toastMessage("Admin Login Successfull");
              print("Successful login");
              isLoading = false;
              notifyListeners();
              Navigator.of(context).pushReplacementNamed(RouteName.dashboard);
            } else {
              print('User is not an admin');
            }
          } else {
            print('User not found');
          }
        } else {
          print('Failed to upload data. Status code: ${response.statusCode}');
          Navigator.pushNamed(context, RouteName.postadd);
        }
      } else {
        await Future.delayed(const Duration(seconds: 3));
        CostumNotificationBar.toastMessage('Admin Login Unsuccessful');
        isLoading = false;
        notifyListeners();
        Navigator.of(context).pushReplacementNamed(RouteName.login);
      }
    } catch (e) {
      await Future.delayed(const Duration(seconds: 3));
      ToastUtils().showCherryToast(context, 'Admin Login Unsuccessful', true);
      isLoading = false;
      notifyListeners();
      Navigator.of(context).pushReplacementNamed(RouteName.login);
    }
    emailController.clear();
    passController.clear();
  }

  // Future<void> loginUser(BuildContext context) async {
  //   isLoading = true;

  //   (isLoading) ? showLoadingDialog(context) : const SizedBox();
  //   notifyListeners();
  //   try {
  //     if (passController.text.isNotEmpty) {
  //       FormData formData = FormData.fromMap({
  //         'email': emailController.text,
  //         'password': passController.text,
  //       });
  //       Map<String, dynamic> jsonData = TextAndImageConversion().formDataToJson(formData);
  //       print('JSON Data: $jsonData');

  //       Response response = await dio.post(
  //         '${ApiUrl.baseUrl}auth/login',
  //         data: jsonData,
  //         options: Options(headers: {
  //           'Content-Type': 'application/json',
  //         }),
  //       );

  //       if (response.statusCode == 200 || response.statusCode == 201) {
  //         print('Data posted successfully');
  //         print('Response: ${response.data}');

  //         // Check user role
  //         String accessToken = response.data['accessToken'];
  //         Response userResponse = await dio.get(
  //           '${ApiUrl.baseUrl}user/all',
  //           options: Options(
  //             headers: {
  //               'Content-Type': 'application/json',
  //               'Authorization': 'Bearer $accessToken',
  //             },
  //           ),
  //         );

  //         List<dynamic> userData = userResponse.data;

  //         // // Filter users based on role 'ADMIN'
  //         // List<User> adminUsers = userData
  //         //     .where((user) => user['roles'] == 'ADMIN')
  //         //     .map((user) => User.fromJson(user))
  //         //     .toList();

  //          User adminUser =
  //              userData.where((user) => user['email'] == emailController.text);

  //         // List<dynamic> userUsers = userData.where((user) => user['roles'] == 'USER').toList();
  //         // print('Admin users: $adminUsers');
  //         print('Admin users: $adminUser');

  //         if (adminUser['roles']=='ADMIN') {
  //           User user = User.fromJson(adminUser.first);
  //           userDetail.add(user);
  //           print('User Details is $userDetail');
  //           print('Admin users found');
  //           await AuthService.storeToken(accessToken);
  //           await Future.delayed(const Duration(seconds: 3));
  //           CostumNotificationBar.toastMessage("Admin Login Successfull");
  //           print("Sucessfull login");
  //           isLoading = false;
  //           notifyListeners();
  //           Navigator.of(context).pushReplacementNamed(RouteName.dashboard);
  //         }
  //       } else {
  //         print('Failed to upload data. Status code: ${response.statusCode}');
  //         Navigator.pushNamed(context, RouteName.postadd);
  //       }
  //     } else {
  //       await Future.delayed(const Duration(seconds: 3));
  //       CostumNotificationBar.toastMessage('Admin Login Unsuccessfull');
  //       isLoading = false;
  //       notifyListeners();
  //       Navigator.of(context).pushReplacementNamed(RouteName.login);
  //     }
  //   } catch (e) {
  //     await Future.delayed(const Duration(seconds: 3));
  //     ToastUtils().showCherryToast(context, 'Admin Login UnSuccessfull', true);
  //     isLoading = false;
  //     notifyListeners();
  //     Navigator.of(context).pushReplacementNamed(RouteName.login);
  //   }
  //   emailController.clear();
  //   passController.clear();
  // }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passController.dispose();
  }

  // Future<Map<String, dynamic>?> getUserData() async {
  //   final token = await AuthService.getToken();
  //   if (token == null) {
  //     return null;
  //   }

  //   try {
  //     final response = await dio.get(
  //       '${ApiUrl.baseUrl}auth/user',
  //       options: Options(
  //         headers: {
  //           'Authorization': 'Bearer $token',
  //         },
  //       ),
  //     );

  //     if (response.statusCode == 200) {
  //       return response.data as Map<String, dynamic>;
  //     } else {
  //       print('Failed to fetch user data. Status code: ${response.statusCode}');
  //       return null;
  //     }
  //   } catch (e) {
  //     print('Error fetching user data: $e');
  //     return null;
  //   }
  // }
}

class RegisterViewModel extends ChangeNotifier {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController passConfirmController = TextEditingController();
  bool isLoading = false;
  Future<void> registerUser(BuildContext context) async {
    isLoading = true;

    (isLoading) ? showLoadingDialog(context) : const SizedBox();
    notifyListeners();
    try {
      await Future.delayed(const Duration(seconds: 3));
      CostumNotificationBar.toastMessage('Admin Registration Successfull');
      isLoading = false;
      notifyListeners();
      Navigator.pushNamed(context, RouteName.login);

      // await AuthService().Register(
      //   emailController.text.trim(),
      //   passController.text.trim(),
      // );

      // await FirebaseFirestore.instance.collection('users').add({
      //   'username': userNameController.text.trim(),
      //   'email': emailController.text.trim(),
      //   'password': passController.text.trim(),
      // });
    } catch (e) {
      if (e.toString().contains("email address is already in use")) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: const Text("Registration Error"),
                content: const Text('Email already exist. Please use different EmailAddress.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RouteName.register);
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            });
      } else {
        await Future.delayed(const Duration(seconds: 3));
        CostumNotificationBar.toastMessage('Admin Registration Unsuccessfull');
        isLoading = false;
        notifyListeners();
        Navigator.of(context).pushReplacementNamed(RouteName.login);
      }
    }
    userNameController.clear();
    emailController.clear();
    passController.clear();
    passConfirmController.clear();
  }

  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    emailController.dispose();
    passController.dispose();
    passConfirmController.dispose();
  }
}

class LogOutViewModel extends ChangeNotifier {
  bool isLoading = false;
  Future<void> logoutUser(BuildContext context) async {
    isLoading = true;

    (isLoading) ? showLoadingDialog(context) : const SizedBox();
    notifyListeners();
    try {
      await AuthService.removeToken();
      CostumNotificationBar.toastMessage('Admin Logout Successfull');
      isLoading = false;
      notifyListeners();
      Navigator.pushNamed(context, RouteName.login);
    } catch (e) {
      CostumNotificationBar.toastMessage('Admin Logout Unsuccessfull');
      isLoading = false;
      notifyListeners();
      Navigator.of(context).pushReplacementNamed(RouteName.login);
    }
  }
}
