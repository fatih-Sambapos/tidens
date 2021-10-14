import 'dart:io';

import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

import '../../../core_shelf.dart';
import 'platform_sensitive_dialog.dart';

class CustomDialog extends PlatformSensitiveWidget {
  final Widget content;
  final Widget? title;
  final String rightButtonTextKey;
  final String leftButtonTextKey;
  final Function action;
  final Function()? leftButtonAction;
  // ignore: prefer_typing_uninitialized_variables
  final provider;
  static void defaultFunc() {}
  final Color? leftButtonTextColor;
  final Color? rightButtonTextColor;
  final Color? rightButtonColor;
  final Color? leftButtonColor;
  final bool willPop;

  const CustomDialog({
    required this.content,
    this.title,
    this.rightButtonTextKey = 'OK',
    this.action = defaultFunc,
    this.provider = '',
    this.leftButtonTextKey = '',
    this.leftButtonAction,
    this.rightButtonTextColor,
    this.leftButtonTextColor,
    this.rightButtonColor,
    this.leftButtonColor,
    this.willPop = true,
    Key? key,
  }) : super(key: key);

  Future<void> show(BuildContext context) async {
    if (kIsWeb) {
      await showDialog(context: context, builder: (context) => this);
    } else {
      await showModal(
        configuration: FadeScaleTransitionConfiguration(
          transitionDuration: context.fast,
        ),
        context: context,
        builder: (context) => this,
      );
    }
  }

  @override
  Widget buildAndroidWidget(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWeb = Utils.instance.getDeviceType(context, constraints) ==
            DeviceType.web;
        return AlertDialog(
          contentPadding: EdgeInsets.fromLTRB(context.width * 10,
              context.height * 2, context.width * 10, context.height),
          insetPadding: EdgeInsets.all(context.width * 5),
          shape: RoundedRectangleBorder(borderRadius: context.lowCircular),
          elevation: 0,
          backgroundColor: context.canvasColor,
          title: title ?? null,
          content: content,
          actions: Platform.isIOS
              ? _setDialogButton(context, isWeb)
              : actions(context, isWeb),
        );
      },
    );
  }

  @override
  Widget buildIOSWidget(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // ignore: unused_local_variable
        final isWeb = Utils.instance.getDeviceType(context, constraints) ==
            DeviceType.web;
        return Theme(
          data: ThemeData(backgroundColor: context.canvasColor),
          child: CupertinoAlertDialog(
            title: title ?? null,
            content: content,
            actions: _setDialogButton(context, isWeb),
          ),
        );
      },
    );
  }

  @override
  Widget buildMainWidget(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWeb = Utils.instance.getDeviceType(context, constraints) ==
            DeviceType.web;
        return AlertDialog(
          contentPadding: EdgeInsets.fromLTRB(
              context.width * (isWeb ? 3 : 10),
              context.height * (isWeb ? 3 : 2),
              context.width * (isWeb ? 3 : 10),
              context.height),
          insetPadding: EdgeInsets.all(context.width * 5),
          shape: RoundedRectangleBorder(borderRadius: context.lowCircular),
          elevation: 0,
          backgroundColor: context.canvasColor,
          title: title ?? null,
          content: content,
          actions: actions(context, isWeb),
        );
      },
    );
  }

  List<Widget> actions(BuildContext context, bool isWeb) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _setDialogButton(context, isWeb),
      )
    ];
  }

  List<Widget> _setDialogButton(BuildContext context, bool isWeb) {
    final allButtons = <Widget>[];
    if (kIsWeb) {
      addButton(allButtons, context, isWeb);
    } else if (Platform.isIOS) {
      addCupertino(allButtons, context, isWeb);
    } else {
      addButton(allButtons, context, isWeb);
    }
    return allButtons;
  }

  void addButton(allButtons, BuildContext context, bool isWeb) {
    if (leftButtonTextKey != '') {
      allButtons.add(
        Padding(
          padding: getLeftButtonPadding(context, isWeb),
          child: TextButton(
            style: defaultButtonStyle(
                context, leftButtonColor ?? Colors.transparent, isWeb),
            onPressed: leftButtonAction ?? () => Navigator.of(context).pop(),
            child: Text(
              leftButtonTextKey.translate,
              style: context.headline4.copyWith(
                  color: leftButtonTextColor ?? context.primaryColor,
                  fontSize:
                      (context.width + context.height) / (isWeb ? 1.3 : .80)),
            ),
          ),
        ),
      );
    }
    allButtons.add(
      Padding(
        padding: getButtonPadding(context),
        child: TextButton(
          style: defaultButtonStyle(
              context, rightButtonColor ?? context.primaryColor, isWeb),
          onPressed: () async {
            if (willPop) Navigator.of(context).pop();
            if (provider != '') {}
            await action();
            if (provider != '') {
              errorDialogHelper(provider, context);
            }
          },
          child: Text(
            rightButtonTextKey.translate,
            style: context.headline4.copyWith(
                color: rightButtonTextColor ?? context.accentColor,
                fontSize:
                    (context.width + context.height) / (isWeb ? 1.3 : .80)),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  void addCupertino(allButtons, BuildContext context, bool isWeb) {
    if (leftButtonTextKey != '') {
      allButtons.add(
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: leftButtonAction ?? () => Navigator.of(context).pop(),
          child: Text(
            leftButtonTextKey.translate,
            style: context.headline4.copyWith(
                color: leftButtonColor ?? context.primaryDarkColor,
                fontSize: (context.width + context.height) / .80),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
    allButtons.add(
      CupertinoDialogAction(
        onPressed: () {
          if (willPop) Navigator.of(context).pop();
          action();
        },
        isDefaultAction: false,
        child: Text(
          rightButtonTextKey.translate,
          style: context.headline4.copyWith(
              color: rightButtonColor ?? context.primaryColor,
              fontSize: (context.width + context.height) / .80),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  EdgeInsets getButtonPadding(BuildContext context) {
    return EdgeInsets.only(
        right: context.width * 2, bottom: context.width * 1.4);
  }

  EdgeInsets getLeftButtonPadding(BuildContext context, bool isWeb) {
    return EdgeInsets.only(
      bottom: context.height * 2,
      right: context.width * (isWeb ? 2 : 4),
    );
  }

  ButtonStyle defaultButtonStyle(
      BuildContext context, Color color, bool isWeb) {
    return TextButton.styleFrom(
      backgroundColor: color,
      padding: EdgeInsets.symmetric(
          horizontal: context.width * (isWeb ? 1 : 7),
          vertical: context.height * 1.1),
    );
  }
}
