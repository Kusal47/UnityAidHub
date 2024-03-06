import 'package:flutter/material.dart';
import 'package:unity_admin/utils/text_design.dart';

void showDialogBox(
    BuildContext context, String title, String message, Function()? onPressed,Function()? onPressedNo) {
  showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
          elevation: 10,
          title: TextDesign(text:
            title,
          ),
          content: TextDesign(text:
            message,
          ),
          actions: [
            InkWell(
                onTap: onPressedNo,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                      ),
                      child: const Text('No')),
                )),
            InkWell(
                onTap: onPressed,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                      ),
                      child: const Text('Yes')),
                )),
          ],
        );
      });
}
