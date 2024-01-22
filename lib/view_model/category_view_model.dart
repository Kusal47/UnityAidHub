import 'package:flutter/material.dart';

class CategoryViewModel extends ChangeNotifier {
  final TextEditingController categoryController = TextEditingController();



void reset() {
    categoryController.clear();
   
  }
  Future<void> addCategory(BuildContext context) async {
    try {} catch (e) {}

    print('Category Added as ${categoryController.text}');

    categoryController.clear();
  }

  @override
  void dispose() {
    super.dispose();
    categoryController.dispose();
  }
}
