// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, use_build_context_synchronously

import 'dart:convert';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:unity_admin/core/theme/app_color.dart';
import 'package:unity_admin/utils/Helper_Funtions/helper_functions.dart';
import '../Models/category_model.dart';
import '../Models/user_model.dart';
import '../authServices/auth_service.dart';
import '../core/const/base_url.dart';
import '../core/routes/routes_name.dart';
import '../utils/Helper_Funtions/formdata_to_json.dart';
import '../utils/cloudinary.dart';
import '../utils/custom_notification_bar.dart';
import '../utils/toast_utils.dart';

class AddPostViewModel extends ChangeNotifier {
  // QuillController quillcontroller = QuillController.basic();
  TextEditingController fundController = TextEditingController();
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController desccontroller = TextEditingController();
  Logger logger = Logger();
  bool isChecked = false;
  bool isNotChecked = false;
  String selectedBenificiary = '';
  String selectedCountry = '';

  var selectedColor = AppColor.borderColor;
  CategoryData? selectedCategory;
  User? userData;
  var selectedCurrency;
  var postType;

  String preCurrency = 'Rs.';
  final List<Map> details = [];
  List<Uint8List> fileBytesList = [];
  List<String> fileNamesList = [];

  List<Uint8List> bytesList = [];
  List<String> namesList = [];
  List<Uint8List> fileBytesList1 = [];
  List<String> fileNamesList1 = [];

  List<Uint8List> bytesList1 = [];
  List<String> namesList1 = [];
  final PageController pageController = PageController();

  final List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  void reset() {
    // quillcontroller.clear();
    titlecontroller.clear();
    desccontroller.clear();
    fundController.clear();
    selectedBenificiary = '';
    selectedCategory = null;
    selectedCountry = '';
    selectedColor == AppColor.borderColor;
    isChecked = false;
    fileBytesList = [];
    fileNamesList = [];
  }

  Future<void> submitPost(BuildContext context, int categoryId) async {
    try {
      String? userId = await AuthService.getUserId();
      if (isChecked == true) {
        String? token = await AuthService.getToken();
        Dio dio = Dio();

        List<String> imageUrls = await uploadFilesToCloudinary(fileBytesList1);

        List<String> documentUrls = await uploadFilesToCloudinary(fileBytesList);

        print(imageUrls);
        print(documentUrls);

        FormData postData = FormData.fromMap({
          "title": titlecontroller.text,
          "description": desccontroller.text,
          "goalAmount": preCurrency + fundController.text,
          "country": selectedCountry,
          "status": "NOTVERIFIED",
          "postType": postType,
          "categoryId": categoryId,
          "userId": userId,
          
          "image": imageUrls,
          "documents": documentUrls,
        });

        Map<String, dynamic> jsonData = TextAndImageConversion().formDataToJson(postData);
        String jsonString = jsonEncode(jsonData);
        print(jsonString);
        Response response = await dio.post(
          '${ApiUrl.baseUrl}posts',
          data: jsonData,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ),
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          print('Data uploaded successfully');
          print('Response: ${response.data}');
          CostumNotificationBar.toastMessage("Post added Successfully");
          Navigator.pushNamed(context, RouteName.dashboard);
        } else {
          print('Failed to upload data. Status code: ${response.statusCode}');
          CostumNotificationBar.toastMessage("Post adding Unsucccessfull");
          Navigator.pushNamed(context, RouteName.postadd);
        }
      }
    } catch (e) {
      print('Error occurred during data upload: $e');
    }
  }

  Future<void> pickFiles(BuildContext context, {bool isImage = false}) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null && isImage == true) {
      bytesList.clear();
      namesList.clear();

      for (var file in result.files) {
        bytesList1.add(file.bytes!);
        namesList1.add(file.name);
      }

      fileBytesList1.addAll(bytesList1);
      fileNamesList1.addAll(namesList1);
    } else if (result != null) {
      bytesList.clear();
      namesList.clear();

      for (var file in result.files) {
        bytesList.add(file.bytes!);
        namesList.add(file.name);
      }

      fileBytesList.addAll(bytesList);
      fileNamesList.addAll(namesList);
    }

    notifyListeners();
  }

  Future<void> categoryAndFunding(BuildContext context, GlobalKey<FormState> formKeys) async {
    try {
      if (formKeys.currentState!.validate() &&
          selectedCategory != null &&
          selectedCountry.isNotEmpty) {
        pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else if (selectedCategory == null) {
        ToastUtils().showCherryToast(context, 'Please select Category ', true);
      } else if (selectedCountry == '') {
        ToastUtils().showCherryToast(context, 'Please select Country ', true);
      } else {
        ToastUtils().showCherryToast(context, 'Please mention target fund ', true);
      }
    } catch (e) {}
  }

  Future<void> beneficiary(BuildContext context) async {
    try {
      if (selectedBenificiary.isNotEmpty) {
        pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        ToastUtils().showCherryToast(context, 'Please select beneficiary ', true);
      }
    } catch (e) {}
  }

  Future<void> documentUpload(BuildContext context, {bool isImage = false}) async {
    if (isImage == true) {
      try {
        if (fileBytesList.isNotEmpty && fileNamesList.isNotEmpty) {
          pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        } else {
          ToastUtils().showCherryToast(context, 'Please upload Images', true);
        }
      } catch (e) {}
    } else {
      try {
        if (fileBytesList.isNotEmpty && fileNamesList.isNotEmpty) {
          pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        } else {
          ToastUtils().showCherryToast(context, 'Please upload documnts', true);
        }
      } catch (e) {}
    }
  }

  Future<void> titleAndDesc(BuildContext context, GlobalKey<FormState> formKeys) async {
    try {
      if (formKeys.currentState!.validate() && desccontroller.text.isNotEmpty) {
        pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else if (desccontroller.text.isEmpty) {
        ToastUtils().showCherryToast(context, 'Please give description about your campaign ', true);
      } else {
        ToastUtils().showCherryToast(context, 'Please give suitable title ', true);
      }
    } catch (e) {}
  }

  Future<void> currencySymbol(BuildContext context) async {
    try {
      switch (selectedCurrency) {
        case 'INR':
          preCurrency = '₹';
        case 'USD':
          preCurrency = '\$';
        case 'EUR':
          preCurrency = '€';
        case 'GBP':
          preCurrency = '£';
        case 'NPR':
          preCurrency = 'Rs.';
        default:
          preCurrency = 'Rs';
      }
    } catch (e) {
      print(e);
    }
  }
}
