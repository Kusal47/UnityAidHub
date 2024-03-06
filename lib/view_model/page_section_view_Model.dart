// ignore_for_file: avoid_print, use_build_context_synchronously

import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import '../core/const/base_url.dart';
import '../core/routes/routes_name.dart';
import '../utils/Helper_Funtions/helper_functions.dart';
import '../utils/cloudinary.dart';
import '../utils/custom_notification_bar.dart';
import '../utils/toast_utils.dart';

class PageSectionViewModel extends ChangeNotifier {
  QuillController psquillcontroller = QuillController.basic();
  TextEditingController pstitlecontroller = TextEditingController();
  Logger logger = Logger();
  bool isChecked = false;
  List<Uint8List> fileBytesList = [];
  List<String> fileNamesList = [];
  List<String> filePathsList = [];
  List<Uint8List> bytesList = [];
  List<String> namesList = [];

  final List<Map> details = [];

  void reset() {
    psquillcontroller.clear();
    pstitlecontroller.clear();
    isChecked = false;
    fileBytesList = [];
    fileNamesList = [];
  }

  final PageController pageController = PageController();

  final GlobalKey<FormState> formKeys = GlobalKey<FormState>();

  Future<void> titleAndDesc(BuildContext context, GlobalKey<FormState> formKeys) async {
    try {
      if (formKeys.currentState!.validate() && !psquillcontroller.document.isEmpty()) {
        pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        print(psquillcontroller.document.toDelta().toJson());
      } else if (psquillcontroller.document.isEmpty()) {
        ToastUtils().showCherryToast(context, 'Please give description about your campaign ', true);
      } else {
        ToastUtils().showCherryToast(context, 'Please give suitable title ', true);
      }
    } catch (e) {
      return;
    }
  }

  Map<String, dynamic> formDataToJson(FormData formData) {
    Map<String, dynamic> jsonObject = {};
    for (MapEntry<String, dynamic> entry in formData.fields) {
      jsonObject[entry.key] = entry.value;
    }
    return jsonObject;
  }

  Future<void> submitPost(BuildContext context) async {
    try {
      Dio dio = Dio();
      List<String> imageUrls = await uploadFilesToCloudinary(fileBytesList);
      FormData formData = FormData.fromMap({
        'title': pstitlecontroller.text,
        'slug': HelperFunctions().slugify(pstitlecontroller.text),
        'imageUrl': imageUrls,
        'content': psquillcontroller.document.toDelta().toJson(),
      });
      Map<String, dynamic> jsonData = formDataToJson(formData);
      print('JSON Data: $jsonData');

      Response response = await dio.post(
        '${ApiUrl.baseUrl}pages',
        data: jsonData,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Data uploaded successfully');
        print('Response: ${response.data}');
        CostumNotificationBar.toastMessage("Post add Successfully");
        reset();
        Navigator.pushNamed(context, RouteName.dashboard);
      } else {
        print('Failed to upload data. Status code: ${response.statusCode}');
        CostumNotificationBar.toastMessage("Post adding Unsuccessfull");
reset();
        Navigator.pushNamed(context, RouteName.category);
      }
    } catch (e) {
      print('Error occurred during data upload: $e');
    }
  }

  Future<void> pickFiles(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      bytesList.clear();
      namesList.clear();
      for (var file in result.files) {
        bytesList.add(file.bytes!);
        namesList.add(file.name);
      }

      fileBytesList.addAll(bytesList);
      fileNamesList.addAll(namesList);
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

  @override
  void dispose() {
    super.dispose();
    psquillcontroller.dispose();
    pstitlecontroller.dispose();
  }
}
