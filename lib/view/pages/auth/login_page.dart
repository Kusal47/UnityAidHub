
import 'package:flutter/material.dart';

import '../../../core/routes/routes_name.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _userNameController = TextEditingController();
    _userNameController.text = "admin";
    _passwordController.text = "abcd123";
    return Scaffold(
        backgroundColor: const Color(0xff262e38),
        body: Row(
              children: [
                const Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    
                      Text(
                        " Unity Aid Hub",
                        // textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "\"Web-based Crowdfunding Platform\"",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                      ),
                     
                    ],
                  ),
                ),
                Expanded(
                    // flex: 2,
                    child: Container(
                  color: Colors.white,
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
                        const Text(
                          "Enter your Login Details Below",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        const Row(
                          children: [
                            Text(" Admin Login"),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            controller: _userNameController,
                            decoration: const InputDecoration(
                              labelText: "Username",
                              hintText: "Enter Username",
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.person),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Row(
                          children: [
                            Text(" Password"),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            controller: _passwordController,
                            //  adda a prefix icon

                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: "Password",
                              hintText: "Enter Password",
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.lock),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        // submit button decorated
                        ElevatedButton(
                          onPressed: () {
                              Navigator.pushNamed(context, RouteName.shell);
                          
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 14, 220, 155),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 20),
                          ),
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
              ],
            )
         );
  }
}
