import 'package:flutter/material.dart';
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
      this.isFeature = false,
      this.isDownload = false});
  final LinearGradient? gradientBtn;
  final Color? btnColor;
  final String text;
  final double? fontsize;
  final FontWeight? fontweight;
  final Color txtColor;
  final VoidCallback? onTap;
  final bool isFeature;
  final bool isDownload;
  @override
  Widget build(BuildContext context) {
    double containerheight = MediaQuery.of(context).size.height / 15.8;
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
                  height: 50,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xFF44F249)
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       
                        TextDesign(
                          text: text,
                          fontsize: 20,
                          fontweight: FontWeight.bold,
                          color: txtColor,
                        ),
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
