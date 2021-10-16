import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/core_shelf.dart';

class SettingsItemCard extends StatelessWidget {
  final bool isReport;
  final bool isWeb;
  final Widget? rightWidget;
  final String icon;
  final Color? iconColor;
  final String title;
  final Color? trailingIconColor;
  final void Function()? onTap;
  const SettingsItemCard({
    Key? key,
    this.rightWidget,
    required this.icon,
    required this.title,
    this.onTap,
    this.iconColor,
    this.isWeb = false,
    this.trailingIconColor,
    this.isReport = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: -4,
      tileColor: context.accentColor,
      contentPadding: EdgeInsets.only(
        left: context.width * (isWeb ? 3 : (isReport ? 10 : 14)),
        right: context.width * (isWeb ? 3 : 6),
        top: isWeb ? context.height * .5 : 0,
        bottom: isWeb ? context.height * .5 : 0,
      ),
      leading: SvgPicture.asset(
        icon.toIconSVG,
        color: iconColor ?? context.darkGreyColor,
      ),
      title: Text(
        title.translate,
        style: TextStyle(
            fontSize: (context.width + context.height) / (isWeb ? 1.6 : .90)),
      ),
      trailing: rightWidget ??
          Icon(
            Icons.arrow_forward_ios,
            color: trailingIconColor ?? context.primaryLightColor,
          ),
      onTap: onTap,
      hoverColor: context.accentColor,
    );
  }
}
