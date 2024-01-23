import 'dart:typed_data';
import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:logger/logger.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

import '../core/routes/routes_name.dart';
import '../utils/dialog_box.dart';
import '../utils/toast_utils.dart';

class BlogSectionViewModel extends ChangeNotifier {
  QuillController bsquillcontroller = QuillController.basic();
  TextEditingController bstitlecontroller = TextEditingController();
  TextEditingController authorcontroller = TextEditingController();
  Logger logger = Logger();
  bool isChecked = false;
  var selectedCategory;

  final List<Map> details = [];
  List<Uint8List> fileBytesList = [];
  List<String> fileNamesList = [];

  List<Uint8List> bytesList = [];
  List<String> namesList = [];

  void reset() {
    bsquillcontroller.clear();
    bstitlecontroller.clear();
    authorcontroller.clear();
    selectedCategory = null;
    isChecked = false;
    fileBytesList = [];
    fileNamesList = [];
  }

  final PageController pageController = PageController();

  final List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  Future<void> documentUpload(BuildContext context) async {
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

  Future<void> titleAndDesc(
      BuildContext context, GlobalKey<FormState> formKeys) async {
    try {
      if (formKeys.currentState!.validate() &&
          !bsquillcontroller.document.isEmpty()) {
        pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else if (bsquillcontroller.document.isEmpty()) {
        ToastUtils().showCherryToast(
            context, 'Please give description about your campaign ', true);
      } else {
        ToastUtils()
            .showCherryToast(context, 'Please give suitable title ', true);
      }
    } catch (e) {}
  }

  Future<void> submitPost(
      BuildContext context, GlobalKey<FormState> formKeys) async {
    try {
      if (formKeys.currentState!.validate() && selectedCategory != null) {
        details.add({
          'blogTitle': bstitlecontroller,
          'blogRichText': bsquillcontroller,
          'blogDocument': fileBytesList,
          'blogAuthor': authorcontroller,
        });
        showDialogBox(
          context,
          'Submit information',
          'Are you sure to submit information ',
          () async {
            reset();
            await Navigator.pushNamed(context, RouteName.blogs);
          },
          () {
            Navigator.pop(context);
          },
        );

        reset();
      } else if (selectedCategory == null) {
        ToastUtils().showCherryToast(context, 'Please select Category ', true);
      } else {
        ToastUtils()
            .showCherryToast(context, 'Author field can\t be empty', true);
      }
    } catch (e) {}
  }

  Future<void> pickFiles(
    BuildContext context,
  ) async {
    FilePickerResult? result =
        await FilePickerWeb.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      // // Clear existing files

      // Add the new file
      bytesList = result.files.map((file) => file.bytes!).toList();
      namesList = result.files.map((file) => file.name).toList();

      fileBytesList.addAll(bytesList);
      fileNamesList.addAll(namesList);
    }
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    bsquillcontroller.dispose();
    bstitlecontroller.dispose();
    authorcontroller.dispose();
  }
}
