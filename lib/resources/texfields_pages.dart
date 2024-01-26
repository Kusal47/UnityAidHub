import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unity_admin/resources/custom_dropdown.dart';
import 'package:unity_admin/utils/text_design.dart';
import '../core/theme/app_color.dart';
import '../data/lists.dart';

class CustomFields extends StatelessWidget {
  

  const CustomFields({
    Key? key,
    required this.controller,
    this.hinttext,
    this.isNumber = false,
    this.isdate = false,
    this.isSmall = false,
    this.isNotEmpty = false,
    this.labeltext,
    this.keyboardType,
    this.canbeNull,
    this.onTap,
    this.onPressed,
    this.onClose,
    this.validator,
    this.onChanged,
    this.hinted, this.selectedCurrency
  }) : super(key: key);


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
  final void Function(Object?)? onChanged;
  final bool isSmall;
  final bool isNotEmpty;
   final String? hinted;
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
              contentPadding: EdgeInsets.symmetric(
                  vertical: isSmall ? 5.0 : 3.0, horizontal: 8.0),
              filled: true,
              fillColor: Colors.white38.withOpacity(0.5),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColor.secondaryColor, width: 2.0),
                  borderRadius: BorderRadius.circular(isSmall ? 10 : 5)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColor.borderColor,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(isSmall ? 10 : 5)),
              hintText: hinttext,
              suffixIcon: isSmall
                  ? IconButton(
                      icon: isNotEmpty
                          ? const Icon(Icons.close)
                          : const Icon(Icons.search),
                      onPressed: isNotEmpty ? onClose : onPressed,
                    )
                  : null,
            prefix: isNumber && selectedCurrency != null
                ? Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: TextDesign(text:selectedCurrency!,fontsize: 14,fontweight: FontWeight.bold,),
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
                          onChanged: onChanged,
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
