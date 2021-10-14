// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:tidens_coin/core/consts.dart';
// import 'package:tidens_coin/views/dashboard/dashboard.dart';
// import '../core/base/base_provider.dart';

// class RegisterProvider extends BaseProvider {
//   var data;
//   Map veri = {};
//   Future<void> Login(String usr_name, String usr_pass) async {
//     await Future.delayed(Duration(microseconds: 400));
//     setLoading = true;
//     hasError = false;
//     try {
//       await http.post("${API}+/auth/login", body: {
//         "src": 1,
//         "usr_name": usr_name,
//         "usr_pass": usr_pass
//       }).then((value) {
//         veri = jsonDecode(value.body);
//         if(veri['s']==1){
//           SnackBar(content: Text("Giriş başarılı"));
//         }
//         else{
//            SnackBar(content: Text(veri['m']) );
//           //  Navigator.push(context,
//           //   MaterialPageRoute(builder: (BuildContext context) => Dashboard()));
//         }
//         notifyListeners();
//       });
//     } catch (e) {
//       hasError = true;
//     }
//     setLoading = false;
//   }
// }
