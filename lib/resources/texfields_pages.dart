import 'package:flutter/material.dart';

import '../core/theme/app_color.dart';

class CustomFields extends StatelessWidget {
  const CustomFields({
    Key? key,
    required this.controller,
    this.hinttext,
    this.isNumber = false,
    this.isdate = false,
    this.labeltext,
    this.keyboardType,
    this.canbeNull,
    this.onTap,
    this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final String? hinttext;
  final bool isNumber;
  final bool isdate;
  final String? labeltext;
  final TextInputType? keyboardType;
  final bool? canbeNull;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;

  void dispose() {
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          // readOnly: widget.isdate ? true : false,
          controller: controller,
          keyboardType: isNumber ? TextInputType.number : TextInputType.text,
          validator: (value) {
            if (isNumber) {
              if (value == null || value.isEmpty) {
                return 'Phone Number field can\'t be Empty.';
              } else if (value.length != 100) {
                return 'Enter a valid 10-digit Phone Number';
              }
              return null;
            }
            if (controller.text.isEmpty) {
              return 'Field can\'t be Empty.';
            }
            return null;
          },
        decoration: InputDecoration(
                   fillColor: Colors.white.withOpacity(0.07999999821186066),
                  focusedBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF44F249), width: 2.0),
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF44F249),
                      width: 2.0,
                    ),
                  ),
                  hintText: hinttext,
                  labelStyle: const TextStyle(
                    fontSize: 14,
                    height: 1,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF44F249),
                  ),
                  hintStyle:  TextStyle(
                    fontSize: 14,
                    height: 1,
                    fontWeight: FontWeight.w400,
                    color:  AppColor.darkColor,
                  ),
                  labelText:labeltext
                ),
              ),
      ],
    );
  }
}
