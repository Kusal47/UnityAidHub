// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:unity_admin/core/routes/routes_name.dart';
import '../utils/custom_notification_bar.dart';
import '../utils/dialogs.dart';

class LoginViewModel extends ChangeNotifier {
  bool isLoading = false;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  Future<void> loginUser(BuildContext context) async {
    isLoading = true;

    (isLoading) ? showLoadingDialog(context) : const SizedBox();
    notifyListeners();
    try {
      if (passController.text == ('A@bcd123')) {
        await Future.delayed(const Duration(seconds: 3));
        CostumNotificationBar.toastMessage("Admin Login Successfull");
        print("Sucessfull login");
        isLoading = false;
        notifyListeners();
        Navigator.of(context).pushReplacementNamed(RouteName.dashboard);
      } else {
        await Future.delayed(const Duration(seconds: 3));
        CostumNotificationBar.toastMessage('Admin Login Unsuccessfull');
        isLoading = false;
        notifyListeners();
        Navigator.of(context).pushReplacementNamed(RouteName.login);
      }
    } catch (e) {
      await Future.delayed(const Duration(seconds: 3));
      CostumNotificationBar.toastMessage('Admin Login Unsuccessfull');
      isLoading = false;
      notifyListeners();
      Navigator.of(context).pushReplacementNamed(RouteName.login);
    }
    usernameController.clear();
    passController.clear();
  }

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passController.dispose();
  }
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
                content: const Text(
                    'Email already exist. Please use different EmailAddress.'),
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
      CostumNotificationBar.toastMessage('Admin LogOut Successfull');
      isLoading = false;
      notifyListeners();
      Navigator.pushNamed(context, RouteName.login);
    } catch (e) {
      CostumNotificationBar.toastMessage('Admin LogOut Unsuccessfull');
      isLoading = false;
      notifyListeners();
      Navigator.of(context).pushReplacementNamed(RouteName.login);
    }
  }
}
