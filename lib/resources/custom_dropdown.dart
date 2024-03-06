import 'package:flutter/material.dart';

import '../Models/category_model.dart';
import '../core/theme/app_color.dart';

class CustomDropdown extends StatelessWidget {
  final CategoryData? value;
  final List<CategoryData>? items;
  final ValueChanged<CategoryData?>? onChanged;
  final String? values;
  final List<String>? data;
  final ValueChanged<String?>? onChanging;
  final double? fontSize;
  final String? hintText;
  final IconData? icon;
  final bool number;
  final bool currency;
  final bool category;
  final bool roledropdown;
  const CustomDropdown({
    super.key,
    this.value,
    this.items,
    this.onChanged,
    this.fontSize,
    this.hintText,
    this.data,
    this.values,
    this.icon,
    this.number = false,
    this.currency = false,
    this.category = false,
    this.roledropdown = false,
    this.onChanging,
  });

  @override
  Widget build(BuildContext context) {
    return category
        ? DropdownButtonFormField<CategoryData>(
            itemHeight: 50,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white38.withOpacity(0.5),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              hintText: hintText ?? 'Select Categories',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.secondaryColor, width: 2.0),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: currency ? AppColor.whiteColor : AppColor.borderColor,
                  width: 2.0,
                ),
              ),
              focusColor: AppColor.primaryColor,
            ),
            borderRadius: BorderRadius.circular(10),
            value: value,
            dropdownColor: Colors.white,
            onChanged: onChanged,
            items: items!.map((category) {
              return DropdownMenuItem<CategoryData>(
                value: category,
                child: Text(
                  category.name,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              );
            }).toList(),
          )
        : roledropdown
            ? DropdownButtonFormField<String>(
                itemHeight: 50,
                borderRadius: BorderRadius.circular(10),
                value: values,
                dropdownColor: Colors.white,
                items: data!
                    .map((e) => DropdownMenuItem<String>(
                          value: e,
                          child: Text(
                            e,
                            style: TextStyle(
                              fontSize: fontSize ?? 16,
                            ),
                            overflow: TextOverflow.visible,
                          ),
                        ))
                    .toList(),
                onChanged: onChanging,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white38.withOpacity(0.5),
                  contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                  hintText: hintText ?? 'Select Role',
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
              )
            : DropdownButtonFormField<String>(
                itemHeight: 50,
                borderRadius: BorderRadius.circular(10),
                value: number ? data!.first : values,
                dropdownColor: Colors.white,
                items: data!
                    .map((e) => DropdownMenuItem<String>(
                          value: e,
                          child: Text(
                            e,
                            style: TextStyle(
                              fontSize: number ? fontSize : 16,
                            ),
                            overflow: TextOverflow.visible,
                          ),
                        ))
                    .toList(),
                onChanged: onChanging,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white38.withOpacity(0.5),
                  contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                  hintText: hintText ?? 'Select Items',
                  focusedBorder: currency
                      ? null
                      : OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.secondaryColor, width: 2.0),
                        ),
                  border: currency
                      ? InputBorder.none
                      : OutlineInputBorder(
                          borderSide: BorderSide(
                            color: currency ? AppColor.whiteColor : AppColor.borderColor,
                            width: 2.0,
                          ),
                        ),
                  focusColor: currency ? null : AppColor.primaryColor,
                ),
              );
  }
}
