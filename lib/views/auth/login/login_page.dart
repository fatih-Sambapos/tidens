import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tidens_coin/controller/login_controller.dart';
import 'package:tidens_coin/views/auth/forgot_password.dart';
import 'package:tidens_coin/views/auth/register/register_page.dart';
import 'package:tidens_coin/views/auth/widgets.dart/auth_elevated_button.dart';
import 'package:tidens_coin/views/auth/widgets.dart/auth_text_formfield.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "LOGIN",
          style: TextStyle(color: Colors.grey),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.menu_rounded, color: Colors.grey, size: 30)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AuthElevatedButton(
                isLoading: false,
                imgUrl:
                    "assets/g.png",
                btnTxt: "Login with",
                bgColor: Colors.red[900],
              ),
              AuthElevatedButton(
                isLoading: false,
                imgUrl:
                    "assets/f.png",
                btnTxt: "Login with",
                bgColor: Color(0xFF3A5999),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text("OR", style: TextStyle(color: Colors.grey)),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 30.0, right: 30, bottom: 20),
                child: Divider(
                  color: Colors.black,
                ),
              ),
              AuthTextFormField(
                controller: controller.usernameController,
                hint: "Username or E-mail",
                prefixIcon: Icons.email,
                obscureText: false,
              ),
              AuthTextFormField(
                controller:controller.passwordController,
                hint: "Password",
                prefixIcon: Icons.lock,
                obscureText: true,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ForgotPassword()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Text("Forgot Password?",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
              GetX<LoginController>(
                init:LoginController(),
                builder:(a)=>
                 AuthElevatedButton(
                   isLoading: a.isLoading.value,
                   onPressed: (){
                     (a).Login();
                   },
                  bgColor: Color(0xFF2EB18D),
                  btnTxt: "Login",
                  imgUrl: null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't you have an account yet? ",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 17,
                        )),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    RegisterPage()));
                      },
                      child: Text("Sign Up",
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
        ),
      ),
    ));
    // );
  }
}
