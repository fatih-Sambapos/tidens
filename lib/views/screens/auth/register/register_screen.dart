import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../views_shelf.dart';
import '../../../../core/core_shelf.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String email = '';
  String password = '';
  bool visible = false;
  bool triedExit = false;
  bool _isRemember = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      await Utils.instance.setOrientation(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return getScaffold();
  }

  Widget getScaffold() {
    return Scaffold(
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
                  icon: Icon(Icons.menu_rounded, color: Colors.grey, size: 30)),
            )
          ],
        ),
        backgroundColor: Colors.transparent,
        body: scrollContent());
  }

  Widget scrollContent() {
    return SingleChildScrollView(
      physics: context.viewBottomPad > 0
          ? const BouncingScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: context.height * 97),
        child: getColumn(false),
      ),
    );
  }

  Widget getColumn(bool isWeb) {
    return Align(
        alignment: Alignment.center,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AuthElevatedButton(
                  onPressed: () {},
                  imgUrl: "assets/g.png",
                  btnTxt: "Login with",
                  bgColor: Colors.red[900],
                ),
                AuthElevatedButton(
                  onPressed: () {},
                  imgUrl: "assets/f.png",
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
                  padding: const EdgeInsets.only(top: 20.0),
                  child: AuthElevatedButton(
                    onPressed: () {},
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
                                      LoginScreen()));
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
        ]));
  }
}
          //const Spacer(flex: 1),
          // Expanded(flex: 4, child: mobileLanguage(isWeb)),
          // //const Spacer(flex: 1),
          // Expanded(flex: 4, child: 'logo'.pngImageAsset),
          // const Spacer(flex: 1),
          // Expanded(flex: 2, child: welcomeText(isWeb)),
          // Spacer(
          //   flex: 2,
          // ), //Expanded(flex: 2, child: slogan(isWeb)),
          // const Spacer(flex: 1),
          // Expanded(flex: 4, child: textField('email', isWeb)),
          // Expanded(flex: 4, child: textField('password', isWeb)),
          // const Spacer(flex: 1),
          // Expanded(flex: 3, child: loginButton(isWeb)),
          // //const Spacer(flex: 1),
          // Expanded(flex: 3, child: forgotPassword(isWeb)),
          // const Spacer(flex: 13),


