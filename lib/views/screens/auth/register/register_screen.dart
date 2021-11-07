import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../views_shelf.dart';
import '../../../../core/core_shelf.dart';
import '../auth_functions.dart';

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
            'SIGN UP',
            style: TextStyle(color: Colors.grey),
          ),
        ),
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
        alignment: Alignment.topCenter,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Spacer(flex: 2),
          loginMethod(
              'assets/g.png', Colors.red.shade900, 'signup_with'.translate),
          loginMethod(
              'assets/f.png', Color(0xFF3A5999), 'signup_with'.translate),
          authDivider(),
          textField(
              'full_name',
              Icon(
                Icons.lock,
                color: context.darkGreyColor,
                size: context.height * 3.3,
              ),
              true),
          textField(
              'email',
              Icon(
                Icons.lock,
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
          authButton('signup'),
          routeLogin(),
          Spacer(flex: 5)
        ]));
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

  Widget routeLogin() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('already_have_an_account'.translate,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 17,
              )),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => LoginScreen()));
            },
            child: Text('login'.translate,
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

  Widget textField(String type, Widget prefixIcon, bool enabled) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.width * 5, vertical: context.height),
      child: RoundedTextButton(
          onChanged: type == 'email' ? _changeEmail : _changePass,
          visibility: type == 'email' ? true : visible,
          changeVisibility: _changeVisibility,
          hintTextKey: type,
          prefixIcon: prefixIcon,
          isWeb: false,
          enabled: enabled),
    );
  }

  Widget authButton(String buttonTextKey) {
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
          buttonTextKey: buttonTextKey,
          action: () {
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
