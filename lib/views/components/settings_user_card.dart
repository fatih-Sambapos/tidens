import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/core_shelf.dart';

class SettingsUserCard extends StatelessWidget {
  final Color avatarColor;
  final Color iconColor;
  final Color backgroundColor;
  final Color textColor;
  final String titleText;
  final String subtitleText;
  final bool isWeb;
  final bool linear;

  const SettingsUserCard(
      {Key? key,
      required this.avatarColor,
      required this.backgroundColor,
      required this.iconColor,
      required this.textColor,
      required this.titleText,
      required this.subtitleText,
      this.isWeb = false,
      this.linear = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return linear && isWeb
        ? Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [context.gradientLight, context.gradientDark])),
            child: ListTile(
              contentPadding: listTilePadding(context),
              leading: leading(context),
              title: title(context),
              subtitle: subTitle(context),
            ),
          )
        : ListTile(
            contentPadding: listTilePadding(context),
            tileColor: backgroundColor,
            leading: leading(context),
            title: title(context),
            subtitle: subTitle(context),
          );
  }

  EdgeInsets listTilePadding(BuildContext context) {
    return EdgeInsets.only(
        left: context.width * (isWeb ? 1.5 : 7),
        bottom: context.height * (isWeb ? 2.5 : 4),
        top: context.height * (isWeb ? 2.5 : 4),
        right: context.width * 4);
  }

  CircleAvatar leading(BuildContext context) {
    return CircleAvatar(
        radius: (isWeb ? 50 : 30),
        backgroundColor: avatarColor,
        child: SvgPicture.asset(
          'profile'.toIconSVG,
          color: iconColor,
          height: context.landspace
              ? (isWeb ? context.height * 2.2 : context.width * 2.2)
              : context.height * 2.2,
        ));
  }

  Widget title(BuildContext context) {
    return Transform.translate(
      offset: Offset(isWeb ? -25 : 0, 0),
      child: Padding(
        padding: EdgeInsets.only(bottom: (isWeb ? 0 : context.width)),
        child: Text(
          titleText,
          style: TextStyle(
            fontFamily: 'MontserratSemiBold',
            color: textColor,
            fontSize: (context.width + context.height) / (isWeb ? 1 : .75),
            //fontFamily: 'Montserrat',
          ),
        ),
      ),
    );
  }

  Widget subTitle(BuildContext context) {
    return Transform.translate(
      offset: Offset(isWeb ? -25 : 0, 0),
      child: Text(
        subtitleText.translate,
        style: TextStyle(
          color: textColor.withOpacity(0.95),
          fontSize: (context.width + context.height) / (isWeb ? 1.6 : 1),
          //fontFamily: 'Montserrat',
        ),
      ),
    );
  }
}
