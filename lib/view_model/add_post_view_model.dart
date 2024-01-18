import 'dart:typed_data';
import 'package:logger/logger.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:unity_admin/core/theme/app_color.dart';

class AddPostViewModel extends ChangeNotifier {
  QuillController quillcontroller = QuillController.basic();
  TextEditingController fundController = TextEditingController();
  TextEditingController titlecontroller = TextEditingController();
  Logger logger = Logger();
  bool isChecked = false;
  // bool get _isChecked => isChecked;
  String selectedBenificiary = '';
  String selectedCountry = '';
  var selectedColor = AppColor.borderColor;
  // String get _selectedCountry => selectedCountry;
  var selectedCategory;


  Future<void> submitPost(BuildContext context) async {
    try {} catch (e) {}

    // print('Category Added as ${titlecontroller.text}');
    quillcontroller.clear();
    titlecontroller.clear();
    fundController.clear();
  }




  @override
  void dispose() {
    super.dispose();
    quillcontroller.dispose();
    titlecontroller.dispose();
    fundController.dispose();
  }
}
