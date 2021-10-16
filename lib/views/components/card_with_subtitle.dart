import 'package:flutter/material.dart';
import '../../core/core_shelf.dart';

class CardWithSubtitle extends StatelessWidget {
  final bool isWeb;
  final String title;
  final String subtitle;
  final bool isTralling;

  const CardWithSubtitle(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.isTralling,
      this.isWeb = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      title: Padding(
        padding: EdgeInsets.only(bottom: context.width * 1.5),
        child: titleCard(title, context),
      ),
      subtitle: subtitleCard(subtitle, context),
      tileColor: context.accentColor,
      contentPadding: paddingCard(context),
      trailing: isTralling ? trailingCard(context) : null,
    );
  }

  EdgeInsets paddingCard(BuildContext context) {
    return EdgeInsets.only(
        left: context.width * (isWeb ? 2 : 14),
        right: context.width * (isWeb ? 3 : 6),
        bottom: context.width * (isWeb ? .5 : 2));
  }

  Padding trailingCard(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.width * (isWeb ? 1 : 2)),
      child: TextButton(
          onPressed: () {},
          child: Text(
            'Change',
            style: TextStyle(color: context.primaryColor.withOpacity(.7)),
          )),
    );
  }

  Widget titleCard(String title, BuildContext context) {
    return isWeb
        ? Transform.translate(
            offset: Offset(0, 14),
            child: Text(
              title.translate,
              style: TextStyle(
                color: context.darkGreyColor,
                fontSize: (context.width + context.height) / 1.6,
              ),
            ))
        : Text(
            title.translate,
            style: TextStyle(
                color: context.darkGreyColor,
                fontSize: (context.width + context.height) / .95),
          );
  }

  Text subtitleCard(String subtitle, BuildContext context) {
    return Text(
      subtitle,
      style: TextStyle(
          color: context.primaryLightColor,
          fontSize: isWeb
              ? (context.width + context.height) / 1.6
              : (context.width + context.height) / .85),
    );
  }
}
