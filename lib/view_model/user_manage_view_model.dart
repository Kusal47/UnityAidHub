import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:unity_admin/utils/toast_utils.dart';
import '../Models/user_model.dart';
import '../authServices/auth_service.dart';
import '../core/const/base_url.dart';
import '../utils/Helper_Funtions/formdata_to_json.dart';

class UserViewModel extends ChangeNotifier {
  var selectedValue;
  String? selectRole;
  TextEditingController searchC = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController userId = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phoneNo = TextEditingController();
  TextEditingController role = TextEditingController();
  TextEditingController status = TextEditingController();
  TextEditingController createdDate = TextEditingController();
  List<AppUser> searchResult = [];
  String details = '';
  Dio dio = Dio();

  void searchUser(String query) async {
    List<AppUser> userList = await fetchUserFromApi();
    if (query.isEmpty) {
      searchResult = List.from(userList);
    } else {
      searchResult = userList.where((user) {
        return user.username.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }

  Future<List<AppUser>> fetchUserFromApi() async {
    try {
      String? token = await AuthService.getToken();
      if (token != null) {
        Response response = await dio.get(
          '${ApiUrl.baseUrl}user/all',
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          }),
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          List<dynamic> userData = response.data;

          // print('User data: $userData');

          List<AppUser> users = userData.map((data) => AppUser.fromJson(data)).toList();
          details = users.length.toString();

          return users;
        } else {
          print(
              'Error fetching users - Status code: ${response.statusCode}, Body: ${response.data}');
          throw Exception('Failed to fetch users');
        }
      } else {
        throw Exception('Token is null');
      }
    } catch (e) {
      print('Error fetching users: $e');
      throw Exception('Failed to fetch users');
    }
  }

  Future<void> updateUser(String userId, BuildContext context) async {
    try {
      String? token = await AuthService.getToken();
      FormData formData = FormData.fromMap({
        "name": userName.text,
        "phoneNumber": phoneNo.text,
        "email": email.text,
        "address": address.text,
        "profilePictureUrl": "string",
        "roles": selectRole,
        "activity": "ACTIVE",
      });
      
      Map<String, dynamic> jsonData = TextAndImageConversion().formDataToJson(formData);
      // String jsonString = jsonEncode(jsonData);
      Response response = await dio.patch(
        '${ApiUrl.baseUrl}user/$userId',
        data: jsonData,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        print('User updated successfully');
      } else {
        ToastUtils().showCherryToast(context, 'Unable to Update', true);
        print(
            'Failed to delete user - Status code: ${response.statusCode}, Body: ${response.data}');
        throw Exception('Failed to update user');
      }
    } catch (e) {
      print('Error updating user: $e');
      throw Exception('Failed to update user');
    }
  }

  Future<void> deleteUser(String userId, BuildContext context) async {
    try {
      String? token = await AuthService.getToken();
      Response response = await dio.delete(
        '${ApiUrl.baseUrl}user/$userId',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Cache-Control': 'no-cache',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        print('User deleted successfully');
      } else {
        ToastUtils().showCherryToast(context, 'Unable to Delete', true);
        print(
            'Failed to delete user - Status code: ${response.statusCode}, Body: ${response.data}');
        throw Exception('Failed to delete user');
      }
    } catch (e) {
      print('Error deleting user: $e');
      throw Exception('Failed to delete user');
    }
  }
}
