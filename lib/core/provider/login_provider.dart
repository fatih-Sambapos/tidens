import 'dart:developer';

import 'package:flutter/material.dart';

import '../core_shelf.dart';

class LoginProvider extends ChangeNotifier {
  Future<bool> userLogin(String email, String password) async {
    try {
      var header = {'Content-Type': 'application/x-www-form-urlencoded'};
      var data = {'email': '$email', 'password': '$password'};
      var body = await NetworkManager.instance.postRequest(
        bodyFields: true,
        url: userLoginApi,
        json: data,
        contentType: header,
      );
      String status = await NetworkManager.instance.status;
      if (NetworkManager.instance.status == "200") {
        status = '200';
        log("giriş");
        notifyListeners();
        return true;
      } else {
        log("giremeyiş");
        notifyListeners();
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> checkLicense(String email) async {
    String expirationDate;
    bool haveLicense;
    String url =
        'http://cpapi.sambapos.com/customer-licenses/?license_email=$email&license_key=repx';
    try {
      var response = NetworkManager.instance.getRequest(url: url);
      log(response.toString());
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
