import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../core/core_shelf.dart';
import '../../../views_shelf.dart';
import '../auth_functions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
    return WillPopScope(
      onWillPop: customOnWillPop,
      child: getScaffold(),
    );
  }

  Widget getScaffold() {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: LayoutBuilder(builder: (context, constraints) {
        return scrollContent();
      }),
    );
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
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
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AuthElevatedButton(
                  onPressed: () {},
                  isLoading: false,
                  imgUrl: "assets/g.png",
                  btnTxt: "Login with",
                  bgColor: Colors.red[900],
                ),
                AuthElevatedButton(
                  onPressed: () {},
                  isLoading: false,
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
                  // controller: controller.usernameController,
                  hint: "Username or E-mail",
                  prefixIcon: Icons.email,
                  obscureText: false,
                ),
                AuthTextFormField(
                  // controller: controller.passwordController,
                  hint: "Password",
                  prefixIcon: Icons.lock,
                  obscureText: true,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (BuildContext context) =>
                    //             ForgotPassword()));
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
                                      RegisterScreen()));
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
        ],
      ),
    );
  }

  Widget loginButton(bool isWeb) {
    var btnColor = context.primaryDarkColor;
    if (email == '' || password == '') {
      btnColor = context.darkGreyColor;
    } else {
      btnColor = context.primaryColor;
    }
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: context.width * (isWeb ? 43 : 7)),
      child: RoundedButton(
        buttonTextKey: 'login', //.translate,
        action: () {
          AuthFunctions.instance.login(email, password, context);
        },
        borderRadius: isWeb
            ? BorderRadius.circular(5)
            : context.lowCircular, // BorderRadius.circular(isWeb ? 55 : 40),
        backgroundColor: btnColor,
        borderColor: btnColor,
        borderWidth: 1,
        textStyle: isWeb
            ? context.headline2
                .copyWith(fontSize: context.height * 2, color: Colors.white)
            : context.headline3
                .copyWith(fontSize: context.width * 6, color: Colors.white),
      ),
    );
  }

  void _changeEmail(String newEmail) {
    setState(() {
      email = newEmail;
    });
  }

  void _changePass(String newPass) {
    setState(() {
      password = newPass;
    });
  }

  void _changeVisibility() {
    setState(() {
      visible = !visible;
    });
  }

  Future<bool> customOnWillPop() async {
    triedExit = !triedExit;
    if (!triedExit) return true;
    return false;
  }
}
