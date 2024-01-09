

import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CostumNotificationBar{
  
 static toastMessage(String message){
Fluttertoast.showToast(msg: message,

);
  }

  static  flushBarErrorMessage(String message, BuildContext context){

    return showFlushbar(context: context, 
    flushbar: Flushbar(
      forwardAnimationCurve: Curves.decelerate,
      message: message,
      messageColor: Colors.blue,
      duration: const Duration(seconds: 1),
    )..show(context));

  }

  static snackBar(String message,BuildContext context){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        animation: CurvedAnimation(parent: kAlwaysDismissedAnimation, curve: Curves.bounceIn),
        content: Text(message))
    );
  }
}