import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unity_admin/view_model/login_signup_view_model.dart';
import '../../../core/const/export.dart';
import '../../../core/theme/app_color.dart';
import '../../../resources/custom_textfield.dart';
import '../../../utils/button_fields.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    double screenWidth = MediaQuery.of(context).size.width;
    final viewModel = Provider.of<LoginViewModel>(context);
    viewModel.usernameController.text = "admin" ;
    viewModel.passController.text =  "A@bcd123";

    return Scaffold(
        // backgroundColor: const Color(0xff262e38),
        body: Center(
      child: Card(
        shadowColor: AppColor.greyColor,
        elevation: 20,
        child: Container(
          color: AppColor.greyColor,
          width: 450,
          height: 500,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                screenWidth <= 600
                    ? Container(
                        height: 100,
                        width: 200,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  AssetsPath.portraitdarklogo,
                                ),
                                filterQuality: FilterQuality.high)))
                    : Container(
                        height: 100,
                        width: 200,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  AssetsPath.landscapedarklogo,
                                ),
                                filterQuality: FilterQuality.high))),

                 Text(
                  "Log Into Unity Aid Hub ",
                  style: TextStyle(
                    color: AppColor.darkColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Enter your Login Details Below",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomTextFields(
                        controller: viewModel.usernameController,
                        text: "Admin Login",
                        isUsername: true,
                        hinttext: "Enter Username",
                        labeltext: "Username",
                      ),
                      CustomTextFields(
                        controller: viewModel.passController,
                        isPassword: true,
                        text: "Password",
                        hinttext: "Enter Password",
                        labeltext: "Password",
                      ),

                      // submit button decorated
                      ButtonFields(
                        text: AppString.login,
                        // gradientBtn: AppColor.gradientColor,
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            await viewModel.loginUser(context);
                          }
                        },
                        txtColor: AppColor.whiteColor,
                      ),
                    ],
                  ),
                ),

                // ElevatedButton(
                //   onPressed: () {
                //     Navigator.pushNamed(context, RouteName.shell);
                //   },
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: const Color(0xFF44F249),
                //     padding: const EdgeInsets.symmetric(
                //         horizontal: 50, vertical: 20),
                //   ),
                //   child: const Text(
                //     "Login",
                //     style: TextStyle(
                //         fontSize: 20,
                //         fontWeight: FontWeight.bold,
                //         color: Colors.white),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
