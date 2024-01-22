import 'package:flutter/material.dart';
import '../core/theme/app_color.dart';

void showDialogBox(
    BuildContext context, String title, String message, Function()? onPressed,Function()? onPressedNo) {
  showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
          elevation: 10,
          title: Text(
            title,
            // style: TextStyle(color: AppColor.textColor),
          ),
          content: Text(
            message,

            // style: TextStyle(color: AppColor.textColor),
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
