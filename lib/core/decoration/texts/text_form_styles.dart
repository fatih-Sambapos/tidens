import 'package:flutter/material.dart';

import '../../core_shelf.dart';

class TextFormDeco {
  static final TextFormDeco _instance = TextFormDeco();
  static TextFormDeco get instance => _instance;

  InputDecoration loginDeco(
    BuildContext context,
    String hintTextKey,
    IconData? prefixIcon,
    bool isWeb,
  ) {
    return InputDecoration(
      filled: true,
      fillColor: context.accentColor,
      contentPadding: EdgeInsets.symmetric(
        horizontal: context.width * (isWeb ? 1 : 2.6),
        vertical: context.height * (isWeb ? 2.3 : 2.6),
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
              child: Icon(
                prefixIcon,
                color: context.darkGreyColor,
                size: context.height * (isWeb ? 4 : 3.3),
              ),
            ),
    );
  }
}
