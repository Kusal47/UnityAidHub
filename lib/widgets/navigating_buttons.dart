import 'package:flutter/material.dart';

import '../core/theme/app_color.dart';
import '../utils/button_fields.dart';

Widget buildNavigationButtons(
  BuildContext context, {
  required VoidCallback nextPage,
  required VoidCallback previousPage,
  bool isIndexFirst = false,
  bool isIndexLast = false,
}) {
  Size size = MediaQuery.of(context).size;
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: size.width * 0.14,
          child: ButtonFields(
            onTap: previousPage,
            btnColor:
                isIndexFirst ? AppColor.borderColor : AppColor.secondaryColor,
            txtColor: isIndexFirst ? AppColor.darkColor : AppColor.whiteColor,
            text: '',
            isPrev: true,
            fontsize: 12,
            fontweight: FontWeight.w100,
          ),
        ),
        SizedBox(
          width: size.width * 0.14,
          child: ButtonFields(
            onTap: nextPage,
            txtColor: AppColor.whiteColor,
            text: isIndexLast ? 'Submit' : '',
            isNext: isIndexLast ? false : true,
            // isLast: ,
            fontsize: 14,
          ),
        ),
      ],
    ),
  );
}
