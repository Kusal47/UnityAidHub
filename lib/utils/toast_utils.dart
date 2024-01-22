import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:cherry_toast/cherry_toast.dart';

class ToastUtils {
  void toastSuccess(BuildContext context, String message) {
    CherryToast.success(
            displayCloseButton: false,
            autoDismiss: true,
            title: Text(
              "$message",
              textAlign: TextAlign.center,
            ),
            toastDuration: const Duration(milliseconds: 200),
            toastPosition: Position.bottom,
            animationCurve: Curves.easeInCirc,
            animationType: AnimationType.fromRight)
        .show(context);
  }

  void showCherryToast(BuildContext context, String message, bool error) {
    CherryToast(
      themeColor: Colors.red,
      title: Text(message, style: const TextStyle(color: Colors.black)),
      actionHandler: () {
        print("Action button pressed");
      },
      icon: error ? Icons.error_outline : Icons.check,
      toastPosition: Position.top,
      animationCurve: Curves.fastLinearToSlowEaseIn,
      // animationType: AnimationType.fromTop,
      
      animationDuration: Duration(milliseconds: 200),
    ).show(context);
  }

  // void showSnackBar(BuildContext context, String message) {
  //   Size size = MediaQuery.of(context).size;
  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //     duration: const Duration(seconds: 3),
  //     content: Text(message),
  //     //  backgroundColor:color,
  //     showCloseIcon: true,
  //     behavior: SnackBarBehavior.floating,
  //   ));
  // }
}
