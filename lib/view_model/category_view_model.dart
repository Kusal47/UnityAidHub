import 'package:flutter/material.dart';
import 'package:unity_admin/core/routes/routes_name.dart';
import '../utils/custom_notification_bar.dart';
import '../utils/dialogs.dart';

class CategoryViewModel extends ChangeNotifier {
  final TextEditingController categoryController = TextEditingController();

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
