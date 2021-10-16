import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/core_shelf.dart';

class LanguageDropDown extends StatefulWidget {
  final isWeb;

  const LanguageDropDown({Key? key, required this.isWeb}) : super(key: key);
  @override
  _LanguageDropDownState createState() => _LanguageDropDownState();
}

class _LanguageDropDownState extends State<LanguageDropDown> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<LanguageProvider>(context).getlang(),
      builder: (context, snapshot) {
        return ButtonTheme(
          alignedDropdown: true,
          child: Material(
            color: Colors.transparent,
            borderRadius: context.mediumCircular,
            child: DropdownButton<String>(
              isExpanded: true,
              underline: SizedBox(),
              borderRadius: context.mediumCircular,
              dropdownColor: context.accentColor,
              icon: SvgPicture.asset(
                  "assets/svg/flags/${snapshot.data.toString()}.svg",
                  height: context.height * (widget.isWeb ? 3 : 2),
                  width: context.width * (widget.isWeb ? 3 : 2)),
              style: context.headline6.copyWith(fontSize: 16),
              items: AppLocalizations.supportedLocalesCode
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeText(value.translate,
                          textAlign: TextAlign.right,
                          minFontSize: 11,
                          style: context.headline6.copyWith(fontSize: 8)),
                      Spacer(),
                      SvgPicture.asset("assets/svg/flags/$value.svg",
                          height: context.height * (widget.isWeb ? 3 : 2),
                          width: context.width * (widget.isWeb ? 3 : 2)),
                    ],
                  ),
                );
              }).toList(),
              hint: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Spacer(),
                  Text(
                    'language'.translate,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: context.darkGreyColor,
                        fontSize: (context.width + context.height) /
                            (widget.isWeb ? 1.4 : .90)),
                  ),
                  SizedBox(width: 5),
                ],
              ),
              onChanged: (value) {
                setState(() {
                  context.read<LanguageProvider>().changeLanguage(value!);
                });
              },
            ),
          ),
        );
      },
    );
  }
}
