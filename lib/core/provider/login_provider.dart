import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import '../core_shelf.dart';

class LoginProvider extends ChangeNotifier {
  Future<bool> userLogin(String username, String password) async {
    try {
      var header = {'Content-Type': 'application/json'};
      var data = {'src': 1, 'usr_name': '$username', 'usr_pass': '$password'};
      var body = await NetworkManager.instance.postRequest(
        bodyFields: false,
        url: userLoginApi,
        json: data,
        contentType: header,
      );

      var loginJson = jsonEncode(body);
      var loginModel = LoginModel.fromJson(jsonDecode(loginJson));
      if (loginModel.s == 1) {
        log(loginModel.m!);
        return true;
      } else {
        log(loginModel.m!);
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }
}
