import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/core_shelf.dart';

class WebDelete extends StatelessWidget {
  final bool isWeb;
  final String text;
  final VoidCallback? onTap;
  const WebDelete(
      {Key? key, required this.isWeb, required this.text, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isWeb,
      child: InkWell(
        hoverColor: Colors.transparent,
        onTap: onTap,
        child: Row(
          children: [
            Text(
              text,
              style: TextStyle(color: context.primaryColor),
            ),
            SizedBox(
              width: context.width,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: context.accentColor),
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset('delete'.toIconSVG),
            )
          ],
        ),
      ),
    );
  }
}
