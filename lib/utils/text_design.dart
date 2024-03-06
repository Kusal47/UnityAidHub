import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextDesign extends StatelessWidget {
  const TextDesign(
      {super.key,
      required this.text,
      this.fontsize,
      this.fontweight,
      this.color,
      this.textAlign,
      this.maxLines,
      this.overflow,
      this.fontStyle});
  final String text;
  final double? fontsize;
  final FontWeight? fontweight;
  final FontStyle? fontStyle;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.raleway(
        fontSize: fontsize,
        fontWeight: fontweight,
        fontStyle: fontStyle,
        color: color,
      ),
      
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
