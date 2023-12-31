import 'package:flutter/material.dart';

class CustomFields extends StatelessWidget {
  const CustomFields(
      {super.key,
      this.controller,
      this.hintText,
      this.keyboardType,
      this.title,
      this.canbeNull,
      this.onTap,
      this.validator,
      this.labelText,
      this.isPassword=false,
      this.icon});
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final TextInputType? keyboardType;
  final String? title;
  final bool? canbeNull;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;
  final IconData? icon;
  final bool isPassword;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title!),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextFormField(
            controller: controller,
            obscureText: isPassword?true:false,
            
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF44F249), width: 2.0),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF44F249),
                  width: 2.0,
                ),
              ),
              labelText: labelText,
              hintText: hintText,
              labelStyle: TextStyle(
                fontSize: 16,
                height: 1,
                fontWeight: FontWeight.w400,
                color: Color(0xFF44F249),
              ),
              hintStyle: TextStyle(
                fontSize: 16,
                height: 1,
                fontWeight: FontWeight.w400,
                color: Color(0xFF44F249),
              ),
              prefixIcon: Icon(
                icon,
                color: Color(0xFF44F249),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
