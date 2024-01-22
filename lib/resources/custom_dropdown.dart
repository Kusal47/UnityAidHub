import 'package:flutter/material.dart';

import '../core/theme/app_color.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({
    super.key,
    this.fontSize,
    this.values,
    this.hintText,
    required this.data,
    this.onChanged,
    this.icon,
    this.number = false,
  });
  final double? fontSize;
  final String? hintText;
  final List data;
  final void Function(Object?)? onChanged;
  final String? values;
  final IconData? icon;
  final bool number;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      itemHeight: 50,
      borderRadius: BorderRadius.circular(10),
      value: number ? data.first : values,
      dropdownColor: Colors.white,
      items: data
          .map((e) => DropdownMenuItem<String>(
                value: e,
                child: Text(
                  e,
                  style: TextStyle(
                    fontSize:number? fontSize:16,
                  ),
                  overflow: TextOverflow.visible,
                ),
              ))
          .toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white38.withOpacity(0.5),
        contentPadding: const EdgeInsets.symmetric(vertical: 2,horizontal: 12),
        hintText: hintText ?? 'Select Items',
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.secondaryColor, width: 2.0),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.borderColor,
            width: 2.0,
          ),
        ),
        focusColor: AppColor.primaryColor,
      ),
    );
  }
}
