import 'package:flutter/material.dart';
import 'package:unity_admin/core/theme/app_color.dart';
import 'text_design.dart';

class ButtonFields extends StatelessWidget {
  const ButtonFields(
      {super.key,
      this.btnColor,
      required this.text,
      this.fontsize,
      this.fontweight,
      required this.txtColor,
      this.onTap,
      this.gradientBtn,
      this.isPrev = false,
      this.isNext = false,
      this.isLast = false
      });
  final LinearGradient? gradientBtn;
  final Color? btnColor;
  final String text;
  final double? fontsize;
  final FontWeight? fontweight;
  final Color txtColor;
  final VoidCallback? onTap;
  final bool isPrev;
  final bool isNext;
  final bool isLast;
  @override
  Widget build(BuildContext context) {
    double containerheight = MediaQuery.of(context).size.height / 15;
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SizedBox(
        height: containerheight,
        child: InkWell(
          onTap: onTap,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: btnColor ?? AppColor.primaryColor),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        isPrev
                            ? const Icon(Icons.arrow_circle_left_outlined)
                            : isNext
                                ? const Icon(Icons.arrow_circle_right_outlined)
                                : Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextDesign(
                                      text: text,
                                      fontsize: fontsize??20,
                                      fontweight: FontWeight.bold,
                                      color: txtColor,
                                    ),
                                  )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
