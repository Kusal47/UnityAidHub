import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../core/theme/app_color.dart';

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Center(
        child: SpinKitWanderingCubes(
          color: AppColor.primaryColor,
          size: 40.0,
          // itemCount: 7,
        ),
      );
    },
  );
}

//  showFetchingDialog(BuildContext context) {
//   showDialog(
//     context: context,
//     barrierDismissible: false,
//     builder: (context) {
//       return Center(
//         child: SpinKitWaveSpinner(
//           color: AppColor.primaryColor,
//           size: 40.0,
//         ),
//       );
//     },
//   );
// }

void showDialogonerror(
    BuildContext context, String errorTitle, String errorMessage, Function()? onPressed) {
  showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(
            errorTitle,
            style: const TextStyle(color: Colors.black87),
          ),
          content: Text(
            errorMessage,
            style: const TextStyle(color: Colors.red),
          ),
          actions: [
            InkWell(
                onTap: onPressed,
                child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                    ),
                    child: const Text('OK'))),
          ],
        );
      });
  Navigator.of(context).pop();
}
