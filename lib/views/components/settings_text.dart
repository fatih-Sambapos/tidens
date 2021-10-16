import 'package:flutter/material.dart';
import '../../core/core_shelf.dart';

class TitleText extends StatelessWidget {
  final bool isWeb;
  final String text;
  final Alignment align;
  final void Function()? onTap;
  const TitleText(
      {Key? key,
      required this.text,
      required this.align,
      this.onTap,
      this.isWeb = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: align,
      child: align == Alignment.center
          ? TextButton(onPressed: onTap, child: buildText(context, text, align))
          : Column(
              children: [
                topPadding(context),
                Padding(
                    padding: EdgeInsets.only(
                      left: context.width * (isWeb ? 0 : 10),
                    ),
                    child: buildText(context, text, align)),
                bottomPadding(context),
              ],
            ),
    );
  }

  Widget buildText(BuildContext context, String text, Alignment align) {
    return Text(
      text.translate,
      style: context.headline5.copyWith(
          color: context.primaryColor,
          fontFamily:
              align == Alignment.center ? 'Montserrat' : 'MontserratSemiBold',
          fontSize: align == Alignment.center
              ? 18
              : (context.width + context.height) / (isWeb ? 1.3 : .90)),
    );
  }

  SizedBox bottomPadding(BuildContext context) {
    return SizedBox(
      height: context.height * (context.landspace ? 3 : 1),
    );
  }

  SizedBox topPadding(BuildContext context) {
    return SizedBox(
      height: context.height * (context.landspace ? (isWeb ? 4 : 6) : 2),
    );
  }
}
