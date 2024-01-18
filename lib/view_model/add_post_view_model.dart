import 'dart:io';
import 'dart:typed_data';
import 'package:logger/logger.dart';
import 'package:path/path.dart' as path;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:path_provider/path_provider.dart';
import 'package:unity_admin/core/theme/app_color.dart';

class AddPostViewModel extends ChangeNotifier {
  QuillController controller = QuillController.basic();
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController titlecontroller1 = TextEditingController();
  Logger logger = Logger();
  bool isChecked = false;
  // bool get _isChecked => isChecked;
  String selectedBenificiary = '';
  String selectedCountry = '';
  var selectedColor = AppColor.borderColor;
  // String get _selectedCountry => selectedCountry;
  var selectedCategory;
 List<Uint8List> fileBytesList = [];
 List<Uint8List> get _fileBytesList =>fileBytesList;
  List<String> fileNamesList = [];
  List<String> get _fileNamesList =>fileNamesList;
  Future<void> addpost(BuildContext context) async {
    try {} catch (e) {}

    print('Category Added as ${titlecontroller.text}');
    controller.clear();
    titlecontroller.clear();
    titlecontroller1.clear();
  }


  Future<void> pickFiles() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      List<Uint8List> bytesList =
          result.files.map((file) => file.bytes!).toList();
      List<String> namesList = result.files.map((file) => file.name).toList();

      
        _fileBytesList.addAll(bytesList);
        _fileNamesList.addAll(namesList);
     
    }
  }
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    titlecontroller.dispose();
    titlecontroller1.dispose();
  }
}
