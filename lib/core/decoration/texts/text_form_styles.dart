import 'package:flutter/material.dart';

import '../../core_shelf.dart';

class TextFormDeco {
  static final TextFormDeco _instance = TextFormDeco();
  static TextFormDeco get instance => _instance;

  InputDecoration loginDeco(BuildContext context, String hintTextKey,
      Widget? prefixIcon, bool isWeb, bool enabled) {
    return InputDecoration(
      enabled: enabled,
      filled: true,
      fillColor: context.accentColor,
      contentPadding: EdgeInsets.symmetric(
        horizontal: context.width * 2,
        vertical: context.height * 1.8,
      ),

      labelText: hintTextKey.translate,
      labelStyle: context.headline5.copyWith(
        color: context.highlightColor,
        fontSize: isWeb
            ? (context.width + context.height) / 1.6
            : context.width * 4.3,
      ),
      //hintText: hintTextKey.translate,
      hintStyle: context.headline5.copyWith(
        color: context.highlightColor,
        fontSize: isWeb
            ? (context.width + context.height) / 1.5
            : context.width * 4.3,
      ),

      disabledBorder: OutlineInputBorder(
        borderRadius: isWeb ? BorderRadius.circular(5) : context.lowCircular,
        borderSide: BorderSide(width: 1, color: context.darkGreyColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: isWeb ? BorderRadius.circular(5) : context.lowCircular,
        borderSide: BorderSide(width: 1, color: context.darkGreyColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: isWeb ? BorderRadius.circular(5) : context.lowCircular,
        borderSide: BorderSide(width: 1, color: context.darkGreyColor),
      ),
      prefixIcon: prefixIcon == null
          ? SizedBox()
          : Padding(
              padding: EdgeInsets.only(
                left: context.width * 2,
                right: context.width * (isWeb ? 1 : 1.5),
              ),
              child: prefixIcon
              // Icon(
              //   prefixIcon,
              //   color: context.darkGreyColor,
              //   size: context.height * (isWeb ? 4 : 3.3),
              // ),
              ),
    );
  }
}
