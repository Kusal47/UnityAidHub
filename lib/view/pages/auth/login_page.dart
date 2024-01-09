import 'package:flutter/material.dart';
import '../../../core/const/export.dart';
import '../../../core/routes/routes_name.dart';
import '../../../resources/custom_textfield.dart';
import '../../../utils/button_fields.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _userNameController = TextEditingController();
    _userNameController.text = "admin";
    _passwordController.text = "abcd123";
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        // backgroundColor: const Color(0xff262e38),
        body: Center(
      child: Card(
        child: Container(
          color: Colors.white,
          width: 500,
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

                const Text(
                  "Log Into Unity Aid Hub ",
                  style: TextStyle(
                    color: Colors.black,
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
                  height: 50,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomTextFields(
                        controller: _userNameController,
                        text: "Admin Login",
                        isEmail: true,
                        hinttext: "Enter Username",
                        labeltext: "Username",
                      ),
                      CustomTextFields(
                        controller: _passwordController,
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
                          // if (formKey.currentState!.validate()) {}
                          Navigator.pushNamed(context, RouteName.dashboard);
                        },
                        txtColor: Colors.white,
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
