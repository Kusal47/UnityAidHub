import 'dart:typed_data';

import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

import '../core/routes/routes_name.dart';
import '../utils/dialog_box.dart';
import '../utils/toast_utils.dart';

class PageSectionViewModel extends ChangeNotifier {
  QuillController psquillcontroller = QuillController.basic();
  TextEditingController pstitlecontroller = TextEditingController();
  Logger logger = Logger();
  bool isChecked = false;
  List<Uint8List> fileBytesList = [];
  List<String> fileNamesList = [];

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

  final GlobalKey<FormState> formKeys = 
    GlobalKey<FormState>()
  ;


  Future<void> titleAndDesc(
      BuildContext context, GlobalKey<FormState> formKeys) async {
    try {
      if (formKeys.currentState!.validate() &&
          !psquillcontroller.document.isEmpty()) {
        pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else if (psquillcontroller.document.isEmpty()) {
        ToastUtils().showCherryToast(
            context, 'Please give description about your campaign ', true);
      } else {
        ToastUtils()
            .showCherryToast(context, 'Please give suitable title ', true);
      }
    } catch (e) {}
  }

  Future<void> submitPost(
      BuildContext context) async {
    try {
      if (fileBytesList.isNotEmpty && fileNamesList.isNotEmpty) {
        details.add({
          'pageTitle': pstitlecontroller,
          'richText': psquillcontroller,
          'document': fileBytesList,
        });

        showDialogBox(
          context,
          'Submit information',
          'Are you sure to submit information ',
          () async {
            reset();
            await Navigator.pushNamed(context, RouteName.pagesection);
          },
          () {
            Navigator.pop(context);
          },
        );
      } else {
        ToastUtils().showCherryToast(context, 'Please upload documnts', true);
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
    psquillcontroller.dispose();
    pstitlecontroller.dispose();
  }
}
