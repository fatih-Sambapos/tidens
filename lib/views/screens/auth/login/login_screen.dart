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
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "LOGIN",
          style: TextStyle(color: Colors.grey),
        ),
      ),
      // backgroundColor: Colors.transparent,
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
        constraints: BoxConstraints(maxHeight: context.height * 100),
        child: getColumn(),
      ),
    );
  }

  Widget getColumn() {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Spacer(flex: 2),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: 'tidensLogo'.pngImageAsset,
          ),
          Spacer(),
          textField(
              'username',
              Icon(
                Icons.email,
                color: context.darkGreyColor,
                size: context.height * 3.3,
              ),
              true),
          textField(
              'password',
              Icon(
                Icons.lock,
                color: context.darkGreyColor,
                size: context.height * 3.3,
              ),
              true),
          forgotPassword(),
          loginButton('login'),
          routeRegister(),
          Spacer(flex: 5),
        ],
      ),
    );
  }

  Padding routeRegister() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("dont_you_have_an_account_yet".translate,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 17,
              )),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => RegisterScreen()));
            },
            child: Text("signup".translate,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ],
      ),
    );
  }

  GestureDetector forgotPassword() {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (BuildContext context) =>
        //             ForgotPassword()));
      },
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Text('forgot_password'.translate,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }

  AuthElevatedButton loginMethod(String icon, Color color, String btnText) {
    return AuthElevatedButton(
      onPressed: () {},
      isLoading: false,
      imgUrl: icon,
      btnTxt: btnText,
      bgColor: color,
    );
  }

  Widget authDivider() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.height * 2),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30),
              child: Divider(
                color: Colors.black,
              ),
            ),
          ),
          Text("or".translate, style: TextStyle(color: Colors.grey)),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30),
              child: Divider(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget textField(String type, Widget prefixIcon, bool enabled) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.width * 5, vertical: context.height),
      child: RoundedTextButton(
        onChanged: type == 'username' ? _changeEmail : _changePass,
        visibility: type == 'username' ? true : visible,
        changeVisibility: _changeVisibility,
        hintTextKey: type,
        prefixIcon: prefixIcon,
        isWeb: false,
        enabled: enabled,
      ),
    );
  }

  Widget loginButton(String btnTextKey) {
    var btnColor = context.primaryDarkColor;
    if (email == '' || password == '') {
      btnColor = context.secondaryGreen;
    } else {
      btnColor = context.secondaryGreen;
    }
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.width * 5, vertical: context.height),
      child: RoundedButton(
          buttonTextKey: btnTextKey,
          action: () {
            // Navigator.pushNamed(context, NavigationConstants.home);
            AuthFunctions.instance.login(email, password, context);
          },
          borderRadius:
              context.lowCircular, // BorderRadius.circular(isWeb ? 55 : 40),
          backgroundColor: btnColor,
          borderColor: btnColor,
          borderWidth: 1,
          textStyle: context.headline2
              .copyWith(fontSize: context.height * 2, color: Colors.white)),
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
