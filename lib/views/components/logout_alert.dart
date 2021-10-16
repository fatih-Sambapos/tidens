import 'dart:io';

import 'package:flutter/material.dart';
import '../../core/core_shelf.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class LogoutDialog {
  final String text;
  final String leftButtonTextKey;
  final String rightButtonTextKey;

  LogoutDialog(
      {required this.text,
      required this.leftButtonTextKey,
      required this.rightButtonTextKey});

  late NavigationService navigation;

  void alertDialog(BuildContext context) {
    CustomDialog(
      content: Container(
        // padding: EdgeInsets.symmetric(horizontal: 200),
        width: dialogWidth(context),
        child: Text(
          text.translate,
          textAlign: TextAlign.center,
          style: context.headline5.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: (context.width + context.height) / (kIsWeb ? 1.6 : .76),
          ),
        ),
      ),
      leftButtonTextKey: leftButtonTextKey,
      rightButtonTextKey: rightButtonTextKey,
      action: () {
        navigation.navigateToPage(path: NavigationConstants.login);
      },
    ).show(context);
  }
}

dialogWidth(BuildContext context) {
  if (kIsWeb) {
    return 400;
  } else if (Platform.isIOS) {
    return null;
  } else {
    return MediaQuery.of(context).size.width;
  }
}
