import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:tidens_coin/core/consts.dart';
import 'package:tidens_coin/views/dashboard/dashboard.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController _usernameController;
  TextEditingController _passwordController;
  GlobalKey<FormState> _formKey;
  var src = 1;

  TextEditingController get usernameController => _usernameController;
  TextEditingController get passwordController => _passwordController;
  GlobalKey<FormState> get formKey => _formKey;
  bool get isFormValid => _formKey.currentState.validate();

  @override
  void onInit() {
    // kSocket = null;
    _formKey = GlobalKey<FormState>();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    // called after the widget is rendered on screen
    //showIntroDialog();
    super.onReady();
  }

  @override
  void onClose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.onClose();
  }

  Map veri = {};
  void Login() async {
    var dio = Dio();
    await Future.delayed(Duration(microseconds: 400));
    isLoading:
    true.obs;
    try {
      await dio.post("$API/auth/login", data: {
        "src": 2,
        "usr_name": _usernameController.text,
        "usr_pass": _passwordController.text
      }).then((value) {
        veri = value.data is String ? jsonDecode(value.data) : value.data;
        if (veri['s'] == 1) {
          Get.rawSnackbar(title: "Başarılı", message: veri['m']);
          Get.offAll(Dashboard());
        } else {
          Get.rawSnackbar(title: "Hata!", message: veri["m"]);
        }
      });
    } catch (e, s) {
      print(s);
      print(e.toString());

      // hasError = true;
    }
    isLoading = false.obs;
  }
}
