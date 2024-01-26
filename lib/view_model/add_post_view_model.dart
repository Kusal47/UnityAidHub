import 'dart:typed_data';
import 'package:logger/logger.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:unity_admin/core/theme/app_color.dart';
import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:unity_admin/utils/dialog_box.dart';
import '../core/routes/routes_name.dart';
import '../utils/toast_utils.dart';

class AddPostViewModel extends ChangeNotifier {
  QuillController quillcontroller = QuillController.basic();
  TextEditingController fundController = TextEditingController();
  TextEditingController titlecontroller = TextEditingController();
  Logger logger = Logger();
  bool isChecked = false;
  bool isNotChecked = false;
  String selectedBenificiary = '';
  String selectedCountry = '';

  var selectedColor = AppColor.borderColor;
  var selectedCategory;
  var selectedCurrency;
  var postType;

  String preCurrency = 'Rs.';
  final List<Map> details = [];
  List<Uint8List> fileBytesList = [];
  List<String> fileNamesList = [];

  List<Uint8List> bytesList = [];
  List<String> namesList = [];
  final PageController pageController = PageController();

  final List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];
  void reset() {
    quillcontroller.clear();
    titlecontroller.clear();
    fundController.clear();
    selectedBenificiary = '';
    selectedCategory = null;
    selectedCountry = '';
    selectedColor == AppColor.borderColor;
    isChecked = false;
    fileBytesList = [];
    fileNamesList = [];
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

  Future<void> categoryAndFunding(
      BuildContext context, GlobalKey<FormState> formKeys) async {
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
        ToastUtils()
            .showCherryToast(context, 'Please mention target fund ', true);
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
        ToastUtils()
            .showCherryToast(context, 'Please select beneficiary ', true);
      }
    } catch (e) {}
  }

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
          !quillcontroller.document.isEmpty()) {
        pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else if (quillcontroller.document.isEmpty()) {
        ToastUtils().showCherryToast(
            context, 'Please give description about your campaign ', true);
      } else {
        ToastUtils()
            .showCherryToast(context, 'Please give suitable title ', true);
      }
    } catch (e) {}
  }

  Future<void> submitPost(BuildContext context) async {
    try {
      if (isChecked == true) {
        details.add({
          'postcategory': selectedCategory,
          'postcountry': selectedCountry,
          'posttargetFund': preCurrency + fundController.text,
          'postbeneficiary': selectedBenificiary,
          'postTitle': titlecontroller,
          'postRichText': quillcontroller,
          'postDocument': fileBytesList,
          'isChecked': isChecked,
        });
        showDialogBox(
          context,
          'Submit information',
          'Are you sure to submit information ',
          () async {
            reset();
            await Navigator.pushNamed(context, RouteName.postadd);
          },
          () {
            Navigator.pop(context);
          },
        );
        // print('Category Added as ${titlecontroller.text}');
      } else {
        ToastUtils()
            .showCherryToast(context, 'Please agree Terms & Conditions', true);
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
    } catch (e) {}
  }
}
