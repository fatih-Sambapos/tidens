import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tidens_coin/controller/login_controller.dart';
import 'package:tidens_coin/views/auth/login/login_page.dart';
import 'package:tidens_coin/views/auth/register/register_page.dart';
import 'package:tidens_coin/views/dashboard/dashboard.dart';

import 'views/auth/login/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
