import 'dart:typed_data';

import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../utils/toast_utils.dart';

class CategoryViewModel extends ChangeNotifier {
  final TextEditingController categoryController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<String> categoryList = [];
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
      if (formKey.currentState!.validate()) {
        categoryList.add(categoryController.text);
        details.add({
          'newCategory': categoryController,
          'imagw1': fileBytesList,
          'imagw2': fileBytesList2,
          'imagw3': fileBytesList3,
        });
      } else {
        ToastUtils()
            .showCherryToast(context, 'Please enter category name', true);
      }
    } catch (e) {}

    print('Category Added as ${categoryController.text}');

    categoryController.clear();
  }

  @override
  void dispose() {
    super.dispose();
    categoryController.dispose();
  }
}
