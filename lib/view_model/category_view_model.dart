// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:unity_admin/utils/Helper_Funtions/formdata_to_json.dart';

import '../Models/category_model.dart';
import '../core/const/base_url.dart';
import '../core/routes/routes_name.dart';
import '../utils/cloudinary.dart';
import '../utils/custom_notification_bar.dart';
import '../utils/dialog_box.dart';
import '../utils/toast_utils.dart';
import '../view/pages/view_Pages/display.dart';

class CategoryViewModel extends ChangeNotifier {
  final TextEditingController categoryController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final List<Map> details = [];

  List<Uint8List> fileBytesList = [];
  List<String> fileNamesList = [];
  Uint8List? bytesList;
  String? namesList;

  List<Uint8List> fileBytesList2 = [];
  List<String> fileNamesList2 = [];
  Uint8List? bytesList2;
  String? namesList2;

  List<Uint8List> fileBytesList3 = [];
  List<String> fileNamesList3 = [];
  Uint8List? bytesList3;
  String? namesList3;

  bool hovered = false;
  int? hoveredIndex;

  void reset() {
    categoryController.clear();

    fileBytesList = [];
    fileNamesList = [];
    fileBytesList2 = [];
    fileNamesList2 = [];
    fileBytesList3 = [];
    fileNamesList3 = [];
  }

  Future<void> pickFiles(
    BuildContext context,
  ) async {
    FilePickerResult? result = await FilePickerWeb.platform.pickFiles();

    if (result != null) {
      // // // Clear existing files
      fileBytesList.clear();
      fileNamesList.clear();

      // Add the new file
      bytesList = result.files.single.bytes;
      namesList = result.files.single.name;

      fileBytesList.add(bytesList!);
      fileNamesList.add(namesList!);
    }
    notifyListeners();
  }

  Future<void> pickFiles2(
    BuildContext context,
  ) async {
    FilePickerResult? result = await FilePickerWeb.platform.pickFiles();

    if (result != null) {
      // // // Clear existing files
      fileBytesList2.clear();
      fileNamesList2.clear();

      // Add the new file
      bytesList2 = result.files.single.bytes;
      namesList2 = result.files.single.name;

      fileBytesList2.add(bytesList2!);
      fileNamesList2.add(namesList2!);
    }
    notifyListeners();
  }

  Future<void> pickFiles3(
    BuildContext context,
  ) async {
    FilePickerResult? result = await FilePickerWeb.platform.pickFiles();

    if (result != null) {
      // // // Clear existing files
      fileBytesList3.clear();
      fileNamesList3.clear();

      // Add the new file
      bytesList3 = result.files.single.bytes;
      namesList3 = result.files.single.name;

      fileBytesList3.add(bytesList3!);
      fileNamesList3.add(namesList3!);
    }
    notifyListeners();
  }

  Future<void> addCategory(BuildContext context) async {
    try {
      Dio dio = Dio();
      List<String> darkImageUrls = await uploadFilesToCloudinary(fileBytesList);
      List<String> lightImageUrls = await uploadFilesToCloudinary(fileBytesList);
      List<String> primaryImageUrls = await uploadFilesToCloudinary(fileBytesList);

      FormData formData = FormData.fromMap({
        'name': categoryController.text,
        if (fileBytesList.isNotEmpty) 'darkImage': darkImageUrls,
        if (fileBytesList2.isNotEmpty) 'lightImage': lightImageUrls,
        if (fileBytesList3.isNotEmpty) 'primaryImage': primaryImageUrls,
      });

      Map<String, dynamic> jsonData = TextAndImageConversion().formDataToJson(formData);

      // Convert the JSON data to a string for logging or debugging
      String jsonString = jsonEncode(jsonData);
      print('JSON Data: $jsonString');
      Response response = await dio.post(
        '${ApiUrl.baseUrl}category',
        data: jsonData,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Data uploaded successfully');
        CostumNotificationBar.toastMessage("Post added Successfully");
        reset();
      } else {
        print('Failed to upload data. Status code: ${response.statusCode}');
        CostumNotificationBar.toastMessage("Post adding UnSuccessful");
      }
    } catch (e) {
      print('Error occurred during data upload: $e');
    }
  }

  List<CategoryData> fetchedCategories = [];

  Future<List<CategoryData>> fetchCategories() async {
    try {
      Dio dio = Dio();
      Response response = await dio.get('${ApiUrl.baseUrl}category');

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        print(response.data);
        fetchedCategories = data.map((category) => CategoryData.fromJson(category)).toList();
        notifyListeners();
      } else {
        print('Failed to fetch categories. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred during category fetch: $e');
    }
    return fetchedCategories;
  }

  @override
  void dispose() {
    super.dispose();
    categoryController.dispose();
  }
}
