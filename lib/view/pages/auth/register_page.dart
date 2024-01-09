import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unity_admin/core/theme/app_color.dart';
import 'package:unity_admin/view_model/login_signup_view_model.dart';
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
    final viewModel = Provider.of<RegisterViewModel>(context);
    return MyScaffold(
      route: '/register',
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Card(
            shadowColor: Colors.grey[0],
            elevation: 20,
            child: Container(
              color: AppColor.greyColor,
              width: 550,
              height: 490,
               padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
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
                            controller: viewModel.userNameController,
                            hinttext: AppString.usernamehint,
                            isUsername: true,
                          ),
                          CustomTextFields(
                            text: AppString.email,
                            controller: viewModel.emailController,
                            hinttext: AppString.emailhint,
                            isEmail: true,
                          ),
                          CustomTextFields(
                            text: AppString.password,
                            controller: viewModel.passController,
                            hinttext: AppString.passwordhint,
                            isPassword: true,
                          ),
                          CustomTextFields(
                            text: AppString.confirmpassword,
                            controller: viewModel.passConfirmController,
                            hinttext: AppString.confirmpasswordhint,
                            isPassword: true,
                            isConfirm: true,
                            confirmPasswordController: viewModel.passController,
                          ),
                          ButtonFields(
                            text: AppString.register,
                            // gradientBtn: AppColor.gradientColor,
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                viewModel.registerUser(context);
                              }
                            },
                            txtColor: AppColor.whiteColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
