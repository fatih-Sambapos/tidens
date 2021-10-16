import 'package:flutter/material.dart';
import '../../../core/core_shelf.dart';

class BusinessesButton extends StatelessWidget {
  final bool isWeb;
  final String text;
  final VoidCallback? onTap;
  const BusinessesButton(
      {Key? key, required this.text, this.onTap, this.isWeb = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal:
              context.width * (context.landspace ? (isWeb ? 27 : 35) : 16)),
      child: RoundedButton(
        buttonTextKey: text,
        action: onTap ?? () {},
        height: context.height * (context.landspace ? (isWeb ? 5 : 12) : 6),
        borderRadius: context.lowCircular,
        backgroundColor: context.primaryColor,
        borderColor: context.primaryColor,
        borderWidth: 1,
        textStyle: context.headline3.copyWith(
            fontSize: (context.width + context.height) / (isWeb ? 1.5 : .70),
            color: Colors.white),
      ),
    );
  }
}
