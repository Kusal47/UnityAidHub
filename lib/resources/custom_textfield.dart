import 'package:flutter/material.dart';
import '../core/const/app_string.dart';
import '../core/theme/app_color.dart';
import '../utils/Helper_Funtions/helper_functions.dart';
import '../utils/text_design.dart';

class CustomTextFields extends StatefulWidget {
  const CustomTextFields({
    Key? key,
    required this.controller,
    this.hinttext,
    this.isEmail = false,
    this.isPassword = false,
    this.isUsername = false,
    this.isConfirm = false,
    this.isNumber = false,
    this.isotp = false,
    this.confirmPasswordController,
    this.text,
    this.isdate = false,
    this.labeltext,
    this.keyboardType,
    this.title,
    this.canbeNull,
    this.onTap,
    this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final TextEditingController? confirmPasswordController;
  final String? text;
  final String? hinttext;
  final bool isEmail;
  final bool isUsername;
  final bool isPassword;
  final bool isConfirm;
  final bool isotp;
  final bool isNumber;
  final bool isdate;
  final String? labeltext;
  final TextInputType? keyboardType;
  final String? title;
  final bool? canbeNull;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;

  void dispose() {
    controller.dispose();
  }

  @override
  State<CustomTextFields> createState() => _CustomTextFieldsState();
}

class _CustomTextFieldsState extends State<CustomTextFields> {
  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextDesign(
                text: widget.text!,
                fontweight: FontWeight.w600,
                fontsize: 14,
              ),
            )
          ],
        ),
        widget.isConfirm
            ? TextFormField(
                cursorColor: AppColor.primaryColor,
                style: const TextStyle(),
                obscureText: widget.isConfirm ? isHidden : false,
                controller: widget.controller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppString.required_ConfirmPass;
                  }
                  if (value != widget.confirmPasswordController!.text) {
                    return AppString.validate_ConfirmPass;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  fillColor: Colors.white.withOpacity(0.079999998211860699),
                  hintStyle: TextStyle(
                    color: AppColor.darkColor,
                  ),
                  contentPadding: const EdgeInsets.all(8),
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
                  hintText: widget.hinttext,
                  prefixIcon: widget.isPassword || widget.isConfirm
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              isHidden = !isHidden;
                            });
                          },
                          icon: isHidden
                              ? const Icon(Icons.remove_red_eye_outlined,
                                  color: Color(0xFF44F249))
                              : const Icon(Icons.visibility_off,
                                  color: Color(0xFF44F249)))
                      : null,
                ),
              )
            : TextFormField(
                cursorColor: AppColor.primaryColor,
                readOnly: widget.isdate ? true : false,
                obscureText: widget.isPassword ? isHidden : false,
                controller: widget.controller,
                keyboardType: widget.isEmail
                    ? TextInputType.emailAddress
                    : widget.isNumber || widget.isotp
                        ? TextInputType.number
                        : TextInputType.text,
                validator: (value) {
                  if (widget.isUsername) {
                    if (value == null || value.isEmpty) {
                      return AppString.required_userName;
                    }
                    return null;
                  }
                  if (widget.isEmail) {
                    if (value == null || value.isEmpty) {
                      return AppString.required_email;
                    } else if (!RegExp(AppString.regExp).hasMatch(value)) {
                      return AppString.validate_email;
                    }
                    return null;
                  }
                  if (widget.isNumber) {
                    if (value == null || value.isEmpty) {
                      return 'Phone Number field can\'t be Empty.';
                    } else if (value.length != 10) {
                      return 'Enter a valid 10-digit Phone Number';
                    }
                    return null;
                  }

                  if (widget.isPassword) {
                    if (value == null || value.isEmpty) {
                      return AppString.required_Password;
                    } else if (!HelperFunctions().hasUppercaseLetter(value)) {
                      return AppString.validate_Password_Uppercase;
                    } else if (!HelperFunctions().hasLowercaseLetter(value)) {
                      return AppString.validate_Password_Lowercase;
                    } else if (!HelperFunctions().hasDigit(value)) {
                      return AppString.validate_Password_Number;
                    } else if (!HelperFunctions().hasSpecialCharacter(value)) {
                      return AppString.validate_Password_SpecialCharacter;
                    } else if (!HelperFunctions().hasValidLength(value)) {
                      return AppString.validate_Password_Length;
                    }
                    return null;
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
                    hintText: widget.hinttext,
                    // prefix: widget.isNumber ? const Text('+977') : null,
                    prefixIcon: widget.isPassword || widget.isConfirm
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                isHidden = !isHidden;
                              });
                            },
                            icon: isHidden
                                ? const Icon(Icons.remove_red_eye_outlined,
                                    color: Color(0xFF44F249))
                                : const Icon(Icons.visibility_off,
                                    color: Color(0xFF44F249)))
                        : widget.isEmail
                            ? const Icon(Icons.email, color: Color(0xFF44F249))
                            : widget.isUsername
                                ? const Icon(Icons.person,
                                    color: Color(0xFF44F249))
                                : null,
                    labelStyle: const TextStyle(
                      fontSize: 14,
                      height: 1,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF44F249),
                    ),
                    hintStyle: TextStyle(
                      fontSize: 14,
                      height: 1,
                      fontWeight: FontWeight.w400,
                      color: AppColor.darkColor,
                    ),
                    labelText: widget.labeltext),
              ),
        const SizedBox(height: 10),
      ],
    );
  }
}




// import 'package:flutter/material.dart';

// class CustomFields extends StatelessWidget {
//   const CustomFields(
//       {super.key,
//       this.controller,
//       this.hintText,
//       this.keyboardType,
//       this.title,
//       this.canbeNull,
//       this.onTap,
//       this.validator,
//       this.labelText,
//       this.isPassword=false,
//       this.icon});
//   final TextEditingController? controller;
//   final String? hintText;
//   final String? labelText;
//   final TextInputType? keyboardType;
//   final String? title;
//   final bool? canbeNull;
//   final VoidCallback? onTap;
//   final String? Function(String?)? validator;
//   final IconData? icon;
//   final bool isPassword;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(title!),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: TextFormField(
//             controller: controller,
//             obscureText: isPassword?true:false,
            
//             decoration: InputDecoration(
//               focusedBorder: const OutlineInputBorder(
//                 borderSide: BorderSide(color: Color(0xFF44F249), width: 2.0),
//               ),
//               border: const OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: Color(0xFF44F249),
//                   width: 2.0,
//                 ),
//               ),
//               labelText: labelText,
//               hintText: hintText,
//               labelStyle: const TextStyle(
//                 fontSize: 16,
//                 height: 1,
//                 fontWeight: FontWeight.w400,
//                 color: Color(0xFF44F249),
//               ),
//               hintStyle: const TextStyle(
//                 fontSize: 16,
//                 height: 1,
//                 fontWeight: FontWeight.w400,
//                 color: Color(0xFF44F249),
//               ),
//               prefixIcon: Icon(
//                 icon,
//                 color: const Color(0xFF44F249),
//               ),
//             ),
//           ),
//         ),
        
//       ],
//     );
//   }
// }
