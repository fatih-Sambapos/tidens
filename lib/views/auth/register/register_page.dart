import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:provider/provider.dart';
import 'package:tidens_coin/controller/register_provider.dart';
import 'package:tidens_coin/views/auth/login/login_page.dart';
import 'package:tidens_coin/views/auth/widgets.dart/auth_elevated_button.dart';
import 'package:tidens_coin/views/auth/widgets.dart/auth_text_formfield.dart';


class RegisterPage extends GetView{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              "SIGN UP",
              style: TextStyle(color: Colors.grey),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: IconButton(
                    onPressed: () {},
                    icon:
                        Icon(Icons.menu_rounded, color: Colors.grey, size: 30)),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.only(top:50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AuthElevatedButton(
                      imgUrl:
                          "assets/g.png",
                      btnTxt: "Login with",
                      bgColor: Colors.red[900],
                    ),
                    AuthElevatedButton(
                      imgUrl:
                          "assets/f.png",
                      btnTxt: "Login with",
                      bgColor: Color(0xFF3A5999),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:20),
                      child: Text("OR", style: TextStyle(color: Colors.grey)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 30,bottom:20),
                      child: Divider(
                        color: Colors.black,
                      ),
                    ),
                    AuthTextFormField(
                      hint: "Full name",
                      prefixIcon: Icons.person,
                      obscureText: false,
                    ),
                    AuthTextFormField(
                      hint: "E-mail",
                      prefixIcon: Icons.email,
                      obscureText: false,
                    ),
                    AuthTextFormField(
                      hint: "Password",
                      prefixIcon: Icons.lock,
                      obscureText: true,
                    ),
                    // GestureDetector(
                    //   onTap: () {
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (BuildContext context) =>
                    //                 ForgotPassword()));
                    //   },
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(25.0),
                    //     child: Text("Forgot Password?",
                    //         style: TextStyle(
                    //           color: Colors.black87,
                    //           fontSize: 17,
                    //           fontWeight: FontWeight.bold,
                    //         )),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(top:20.0),
                      child: AuthElevatedButton(
                        bgColor: Color(0xFF2EB18D),
                        btnTxt: "Sign Up",
                        imgUrl: null,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account? ",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 17,
                              )),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          LoginPage()));
                            },
                            child: Text("Login",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            
          )),
    );
  }
}
