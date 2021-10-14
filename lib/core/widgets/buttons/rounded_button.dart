import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../core_shelf.dart';

class RoundedButton extends StatelessWidget {
  final String buttonTextKey;
  final Function() action;
  final Color? backgroundColor;
  final Color? borderColor;
  final String iconPath;
  final BorderRadius? borderRadius;
  final double borderWidth;
  final TextStyle? textStyle;
  final double? height;
  const RoundedButton({
    required this.buttonTextKey,
    required this.action,
    this.backgroundColor,
    this.borderColor,
    this.iconPath = '',
    this.borderRadius,
    this.borderWidth = 2.0,
    Key? key,
    this.textStyle,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyles.instance.roundedStyle(
        context,
        height: height,
        borderWidth: borderWidth,
        backgroundColor: backgroundColor,
        borderColor: borderColor,
        borderRadius: borderRadius,
      ),
      onPressed: action,
      child: Row(
        children: [
          //iconPath == '' ? Expanded(child: Container()) : preImage(context),
          Spacer(),
          Expanded(
            flex: 7,
            child: AutoSizeText(buttonTextKey.translate,
                textAlign: TextAlign.center,
                maxLines: 1,
                style: textStyle ?? context.headline4.copyWith(fontSize: 23)),
          ),
          Spacer(),
          //Expanded(child: Container()),
        ],
      ),
    );
  }

  Widget preImage(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: context.lowMedEdgeInsets,
          child: iconPath.pngLogoAsset,
        ),
      ),
    );
  }
}
