import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core_shelf.dart';

class RoundedTextButton extends StatelessWidget {
  final Function(String) onChanged;
  final String hintTextKey;
  // final IconData prefixIcon;
  final bool visibility;
  final bool isWeb;
  final Function()? changeVisibility;
  const RoundedTextButton({
    required this.onChanged,
    this.hintTextKey = '',
    this.visibility = false,
    this.changeVisibility,
    this.isWeb = false,
    Key? key,
    // this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
          fontSize: isWeb ? context.width * 1.2 : context.width * 4.3),
      decoration: hintTextKey.contains('password')
          ? passDeco(context)
          : TextFormDeco.instance.loginDeco(
              context,
              hintTextKey,
              // prefixIcon,
              isWeb,
            ),
      onChanged: onChanged,
      obscureText:
          hintTextKey.contains('password') && !visibility ? true : false,
    );
  }

  InputDecoration passDeco(BuildContext context) {
    return TextFormDeco.instance
        .loginDeco(
          context,
          hintTextKey,
          // prefixIcon,
          isWeb,
        )
        .copyWith(
          suffixIcon: Padding(
              padding: isWeb ? context.rightLow : context.rightMedium,
              child: IconButton(
                splashRadius: 20,
                icon: SvgPicture.asset(
                  'login_password_visible'.toIconSVG,
                  color:
                      visibility ? context.primaryColor : context.darkGreyColor,
                  height: context.height * (isWeb ? 1.3 : 1.5),
                ),
                onPressed: changeVisibility ?? () {},
              )),
        );
  }
}
