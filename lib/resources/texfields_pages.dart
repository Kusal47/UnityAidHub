import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unity_admin/resources/custom_dropdown.dart';
import 'package:unity_admin/utils/text_design.dart';
import '../core/theme/app_color.dart';
import '../data/lists.dart';

class CustomFields extends StatelessWidget {
  const CustomFields(
      {Key? key,
      required this.controller,
      this.hinttext,
      this.isNumber = false,
      this.isdate = false,
      this.isSmall = false,
      this.isSearch = false,
      this.isDesc = false,
      this.labeltext,
      this.keyboardType,
      this.canbeNull,
      this.onTap,
      this.onPressed,
      this.onClose,
      this.validator,
      this.onChanged,
      this.hinted,
      this.title,
      this.selectedCurrency,
      this.icon,
      this.isAd = false,
      this.post = false,
      this.enable=true,
      this.textInputAction,
      this.hintText, this.onFieldSubmitted, this.searchIcon})
      : super(key: key);

  final String? selectedCurrency;
  final TextEditingController controller;
  final String? hinttext;
  final bool isNumber;
  final bool isdate;
  final String? labeltext;
  final TextInputType? keyboardType;
  final bool? canbeNull;
  final VoidCallback? onTap;
  final VoidCallback? onPressed;
  final VoidCallback? onClose;
  final String? Function(String?)? validator;
  final String? Function(String?)? onFieldSubmitted;
  final void Function(Object?)? onChanged;
  final bool isSmall;
  final bool isSearch;
  final bool isAd;
  final String? hinted;
  final String? title;
  final IconData? icon;
  final IconData? searchIcon;
  final TextInputAction? textInputAction;
  final String? hintText;
  final bool isDesc;
  final bool post;
  final bool enable;
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
    if (isSmall == true) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
           
            onChanged: onChanged,
            onFieldSubmitted: onFieldSubmitted,
            // enabled: searched?false:true,
            cursorColor: AppColor.primaryColor,
            controller: controller,
            keyboardType: TextInputType.text,
            inputFormatters: inputFormatters,
            validator: (value) {
              if (isNumber) {
                if (value == null || value.isEmpty) {
                  return 'Amount field can\'t be Empty.';
                } else if (value.toString() == true) {
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
                contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
                filled: true,
                fillColor: Colors.white38.withOpacity(0.5),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.secondaryColor, width: 2.0),
                    borderRadius: BorderRadius.circular(isSmall ? 10 : 5)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColor.borderColor,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                hintText: hinttext,
                prefixIcon: IconButton(icon: Icon(searchIcon), onPressed: onPressed,),
                suffixIcon: isSearch?IconButton(
                  icon: Icon(icon),
                  onPressed: onClose,
                ):null,
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
                labelText: labeltext ?? ''),
          ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TextDesign(
              text: title!,
              fontweight: FontWeight.w700,
              fontsize: 18,
              color: AppColor.darkColor,
            ),
          ),
          TextFormField(
            maxLines: isDesc
                ? 5
                : post
                    ? 10
                    : null,
            cursorColor: AppColor.primaryColor,
            enabled: enable,
            controller: controller,
            keyboardType: isNumber ? TextInputType.number : TextInputType.text,
            inputFormatters: inputFormatters,
            validator: (value) {
              if (isNumber) {
                if (value == null || value.isEmpty) {
                  return 'Amount field can\'t be Empty.';
                } else if (value.toString() == true) {
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
                contentPadding: isDesc || post
                    ? const EdgeInsets.symmetric(horizontal: 20, vertical: 15)
                    : const EdgeInsets.symmetric(vertical: 3.0, horizontal: 8.0),
                filled: true,
                fillColor: Colors.white38.withOpacity(0.5),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.secondaryColor, width: 2.0),
                    borderRadius: BorderRadius.circular(5)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColor.borderColor,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(5)),
                hintText: hinttext,
                suffixIcon: isAd
                    ? IconButton(
                        hoverColor: AppColor.borderColor,
                        icon: Icon(
                          icon,
                          color: AppColor.primaryColor,
                        ),
                        onPressed: onPressed,
                      )
                    : null,
                prefix: isNumber && selectedCurrency != null
                    ? Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: TextDesign(
                          text: selectedCurrency!,
                          fontsize: 14,
                          fontweight: FontWeight.bold,
                        ),
                      )
                    : null,
                prefixIcon: isNumber
                    ? Padding(
                        padding: const EdgeInsets.all(2),
                        child: SizedBox(
                          width: 100,
                          child: CustomDropdown(
                            currency: true,
                            data: currency,
                            onChanging: onChanged,
                            fontSize: 12,
                            values: currency.first,
                          ),
                        ),
                      )
                    : null,
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
                labelText: labeltext ?? ''),
          ),
        ],
      );
    }
  }
}
