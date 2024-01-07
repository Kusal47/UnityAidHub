import 'package:flutter/material.dart';

class TextDesign extends StatelessWidget {
  const TextDesign(
      {super.key,
      required this.text,
      this.fontsize,
      this.fontweight,
      this.color,
      this.textAlign,
      this.maxLines,
      this.overflow});
  final String text;
  final double? fontsize;
  final FontWeight? fontweight;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        fontWeight: fontweight,
        color: color,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      );
    
  }
}
