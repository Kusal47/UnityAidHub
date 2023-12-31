import 'package:flutter/material.dart';

import '../../../core/routes/routes_name.dart';
import '../../../resources/custom_textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _userNameController = TextEditingController();
    _userNameController.text = "admin";
    _passwordController.text = "abcd123";
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
                CustomFields(
                  controller: _userNameController,
                  title: "Admin Login",
                  icon: Icons.person,
                  hintText: "Enter Username",
                  labelText: "Username",
                ),
                CustomFields(
                  controller: _passwordController,
                  isPassword:true,
                  title: "Password",
                  icon: Icons.person,
                  hintText: "Enter Password",
                  labelText: "Password",
                ),

                // submit button decorated
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RouteName.shell);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF44F249),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
