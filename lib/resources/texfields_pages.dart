import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/theme/app_color.dart';

class CustomFields extends StatelessWidget {
  const CustomFields({
    Key? key,
    required this.controller,
    this.hinttext,
    this.isNumber = false,
    this.isdate = false,
    this.isSmall = false,
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
  final bool isSmall;

  void dispose() {
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
     List<TextInputFormatter> inputFormatters = [];

    // Add FilteringTextInputFormatter.digitsOnly only if isNumber is true
    if (isNumber) {
      inputFormatters.add(FilteringTextInputFormatter.digitsOnly);
    }
    return Column(
      children: [
        TextFormField(
          cursorColor: AppColor.primaryColor,
          // readOnly: widget.isdate ? true : false,
          controller: controller,
          keyboardType: isNumber ? TextInputType.number : TextInputType.text,
          inputFormatters:inputFormatters,
          validator: (value) {
            if (isNumber) {
              if (value == null || value.isEmpty) {
                return 'Amount field can\'t be Empty.';
              } else if (value.toString()==true) {
                return 'Enter a valid Number';
              }
              return null;
            }
            if (controller.text.isEmpty) {
              return '$labeltext can\'t be Empty.';
            }
            return null;
          },
          decoration: InputDecoration(
              contentPadding: isSmall
                  ? const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0)
                  : null,
            filled: true,
        fillColor: Colors.white38.withOpacity(0.5),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColor.secondaryColor, width: 2.0),
                  borderRadius: isSmall
                      ? BorderRadius.circular(10)
                      : BorderRadius.circular(0)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColor.borderColor,
                    width: 2.0,
                  ),
                  borderRadius: isSmall
                      ? BorderRadius.circular(10)
                      : BorderRadius.circular(0)),
              hintText: hinttext,
              labelStyle: const TextStyle(
                fontSize: 14,
                height: 1,
                fontWeight: FontWeight.w400,
              ),
              hintStyle: TextStyle(
                fontSize: 14,
                height: 1,
                fontWeight: FontWeight.w400,
                color: AppColor.darkColor,
              ),
              labelText: labeltext??''),
        ),
      ],
    );
  }
}
