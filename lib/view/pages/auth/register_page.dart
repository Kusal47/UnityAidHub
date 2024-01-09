import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import '../../../core/const/export.dart';
import '../../../resources/custom_textfield.dart';
import '../../../utils/button_fields.dart';
import '../../../utils/text_design.dart';
import '../AdminScaffold/admin_scaffold_page.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key, Key? keys});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController userNameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passController = TextEditingController();
    final TextEditingController passConfirmController = TextEditingController();
    return MyScaffold(
      route: '/register',
      body: Center(
        child: Padding(
       padding: const EdgeInsets.only( top: 40),
          child: Card(
            child: Container(
              color: Colors.white,
              width: 700,
              height: 700,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          const TextDesign(
                            text: AppString.registerText,
                            fontsize: 24,
                            fontweight: FontWeight.bold,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextFields(
                            text: AppString.username,
                            controller: userNameController,
                            hinttext: AppString.usernamehint,
                            isUsername: true,
                          ),
                          CustomTextFields(
                            text: AppString.email,
                            controller: emailController,
                            hinttext: AppString.emailhint,
                            isEmail: true,
                          ),
                          CustomTextFields(
                            text: AppString.password,
                            controller: passController,
                            hinttext: AppString.passwordhint,
                            isPassword: true,
                          ),
                          CustomTextFields(
                            text: AppString.confirmpassword,
                            controller: passConfirmController,
                            hinttext: AppString.confirmpasswordhint,
                            isPassword: true,
                            isConfirm: true,
                            confirmPasswordController: passController,
                          ),
                          ButtonFields(
                            text: AppString.register,
                            // gradientBtn: AppColor.gradientColor,
                            onTap: () async {
                              if (formKey.currentState!.validate()) {}
                            },
                            txtColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
