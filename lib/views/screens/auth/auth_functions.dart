import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/core_shelf.dart';

class AuthFunctions {
  static final AuthFunctions _instance = AuthFunctions();

  static AuthFunctions get instance => _instance;

  Future<void> login(
      String email, String password, BuildContext context) async {
    if (isValidError(email, 'email', context) &&
        isValidError(password, 'password', context)) {
      email = email.trim();
      password = password.trim();
      loginStatus(email, password, context);
    }
  }

  static loginStatus(
    String email,
    String password,
    BuildContext context,
  ) async {
    bool login = await context.read<LoginProvider>().userLogin(email, password);
    // var license = await context.read<LoginProvider>().checkLicense(email);
    log("giriş" + login.toString());
    Navigator.pushNamed(context, NavigationConstants.home);
    await context.read<RabbitmqProvider>().getTableNames();
    // var message = context.read<RabbitmqProvider>().msgTableName;
    if (login == true) {
      // if (message.isEmpty) {
      // DialogBuilder(context).hideOpenDialog();
      // Utils.instance.textDialog(context, 'sambapos_is_closed');
      // } else {
      // }
    } else {
      print(login.toString());
      Navigator.pushNamed(context, NavigationConstants.home);
      //await Navigator.pushNamed(context, NavigationConstants.home);
    }
  }

  static bool checkAll(String name, String email, String firstPass,
      String secondPass, BuildContext context) {
    return isValidError(email, 'email', context) &&
        isValidError(firstPass, 'password', context);
  }

  static bool isValidError(String text, String type, BuildContext context) {
    var isValid = false;
    var errorMessageKey = '';
    if (type == 'email' && !text.isValidEmail) {
      errorMessageKey = 'invalid_email';
    } else if (type == 'password' && text.length < 4) {
      errorMessageKey = 'password_length';
    } else {
      isValid = true;
    }
    if (!isValid) Utils.instance.textDialog(context, errorMessageKey);
    return isValid;
  }
}
