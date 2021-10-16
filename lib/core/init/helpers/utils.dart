import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tidens_coin/views/views_shelf.dart';

import '../../core_shelf.dart';

class Utils {
  static final Utils _instance = Utils();
  static Utils get instance => _instance;

  void textDialog(BuildContext context, String textKey, {String? text}) {
    final isWeb = getDeviceType(context, null) == DeviceType.web;
    CustomDialog(
      content: Padding(
        padding: isWeb
            ? context.lowEdgeInsets.copyWith(top: context.height * 2)
            : const EdgeInsets.all(0),
        child: Text(
          text ?? textKey.translate,
          textAlign: TextAlign.center,
          style: context.headline5.copyWith(
            fontSize: (context.width + context.height) / (isWeb ? 1.1 : .76),
          ),
        ),
      ),
    ).show(context);
  }

  DeviceType getDeviceType(BuildContext context, BoxConstraints? constraints) {
    final orientation = MediaQuery.of(context).orientation;
    var maxWidth = MediaQuery.of(context).size.width;
    var maxHeight = MediaQuery.of(context).size.height;
    if (constraints != null) {
      maxWidth = constraints.maxWidth;
      maxHeight = constraints.maxHeight;
    }
    if ((orientation == Orientation.portrait && maxWidth < 900) ||
        (orientation == Orientation.landscape && maxHeight < 600 && !kIsWeb)) {
      return DeviceType.mobile;
    } else {
      return DeviceType.web;
    }
  }

  DeviceType getGeneralType(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final maxHeight = MediaQuery.of(context).size.height;
    final devicePixelRatio = ui.window.devicePixelRatio;
    final orientation = MediaQuery.of(context).orientation;
    if (devicePixelRatio < 2 && (maxWidth >= 1000 || maxHeight >= 1000) ||
        devicePixelRatio == 2 && (maxWidth >= 1920 || maxHeight >= 1920)) {
      return DeviceType.web;
    } else {
      if ((orientation == Orientation.portrait && maxWidth < 900) ||
          (orientation == Orientation.landscape &&
              maxHeight < 600 &&
              !kIsWeb)) {
        return DeviceType.mobile;
      } else {
        return DeviceType.web;
      }
    }
  }

  void setSystemUi(bool isDark) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Color(isDark ? 0xffffff : 0xff121212),
        statusBarColor: Color(isDark ? 0xff3280c0 : 0xff616161),
        systemNavigationBarIconBrightness:
            isDark ? Brightness.dark : Brightness.light,
      ),
    );
  }

  Future<void> onThemeChanged(bool isDark, ThemeProvider themeNotifier) async {
    Utils.instance.setSystemUi(themeNotifier.isDark());
    (isDark)
        ? themeNotifier.theme = getDarkTheme()
        : themeNotifier.theme = getLightTheme();
    await LocalManager.instance.setBoolValue(LocalManagerKeys.darkMode, isDark);
  }

  Future<void> changeLanguage(BuildContext context) async {
    var lang = Localizations.localeOf(context).languageCode;
    await context
        .read<LanguageProvider>()
        .changeLanguage(lang == 'tr' ? 'en' : 'tr');
  }

  AppBar getAppBar(BuildContext context, String title, {bool? isAction}) {
    return AppBar(
      backgroundColor: context.accentColor,
      foregroundColor: context.primaryColor,
      elevation: 0,
      centerTitle: true,
      title: Text(
        title,
        style: context.headline6.copyWith(fontSize: 18),
      ),
      actions: [
        isAction ?? true
            ? Padding(
                padding: EdgeInsets.only(right: context.width * 3),
                child: IconButton(
                  onPressed: () => {}, // Navigator.pushNamed(
                  // context, NavigationConstants.notifications),
                  icon: Icon(
                    CupertinoIcons.bell,
                  ),
                ),
              )
            : SizedBox()
      ],
    );
  }

  AppBar getHomeAppBar(BuildContext context, String title, {bool? isAction}) {
    return AppBar(
      backgroundColor: context.accentColor,
      foregroundColor: context.primaryColor,
      centerTitle: true,
      title: HomeShopChooser(selectedShop: 'Beyoğlu'),
      actions: [
        isAction ?? true
            ? Padding(
                padding: EdgeInsets.only(right: context.width * 3),
                child: IconButton(
                  onPressed: () => {}, // Navigator.pushNamed(
                  // context, NavigationConstants.notifications),
                  icon: Icon(
                    CupertinoIcons.bell,
                  ),
                ),
              )
            : SizedBox()
      ],
    );
  }

  AppBar getWebAppBar(BuildContext context, {bool? isAction}) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: context.primaryColor,
      foregroundColor: context.accentColor,
      toolbarHeight: context.height * 10,
      elevation: .7,
      title: headerLeft(context),
      actions: [headerRight(context)],
    );
  }

  Padding headerRight(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: context.width * 7,
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AutoSizeText(
                  "Admin",
                  style: context.headline6.copyWith(color: context.canvasColor),
                ),
                SizedBox(
                  height: context.width / 2,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: SvgPicture.asset(
                        'store_white'.toIconSVG,
                        color: context.canvasColor,
                        width: 15,
                        // height: 200,
                      ),
                    ),
                    AutoSizeText(
                      "Beyoğlu",
                      style: context.headline6
                          .copyWith(color: context.canvasColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () => {}, // Navigator.pushNamed(
            // context, NavigationConstants.notifications),
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: ClipOval(
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: context.canvasColor,
                ),
                child: SvgPicture.asset(
                  'profile'.toIconSVG,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding headerLeft(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: context.width * 4,
      ),
      child: Row(
        children: [
          Container(
              padding: EdgeInsets.only(right: context.width),
              width: context.width * 13,
              child: 'logoWhite'.pngImageAsset),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => {}, // Navigator.pushNamed(
              // context, NavigationConstants.notifications),
              child: Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: SvgPicture.asset(
                  'notifications_white'.toIconSVG,
                  width: 19,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItem.home: GlobalKey<NavigatorState>(),
    TabItem.search: GlobalKey<NavigatorState>(),
    TabItem.reports: GlobalKey<NavigatorState>(),
    TabItem.profile: GlobalKey<NavigatorState>()
  };

  Map<TabItem, Widget> allPages() {
    return {
      TabItem.home: HomeScreen(),
      TabItem.search: HomeScreen(),
      TabItem.reports: HomeScreen(),
      TabItem.profile: HomeScreen()
    };
  }

  Future<void> setOrientation(BuildContext context) async {
    if (Utils.instance.getGeneralType(context) == DeviceType.tablet) {
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    } else {
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
      ]);
    }
  }
}

class HomeShopChooser extends StatefulWidget {
  final selectedShop;

  const HomeShopChooser({Key? key, this.selectedShop}) : super(key: key);

  @override
  _HomeShopChooserState createState() => _HomeShopChooserState();
}

List shops = [
  "Beyoğlu",
  "Beyoğlu",
  "Beyoğlu",
  "Beyoğlu",
];

class _HomeShopChooserState extends State<HomeShopChooser> {
  @override
  Widget build(BuildContext context) {
    var _selectedShop = widget.selectedShop;
    return Row(
      children: [
        Spacer(),
        SvgPicture.asset(
          'store'.toIconSVG,
          width: 20,
        ),
        SizedBox(width: 5),
        DropdownButton<String>(
          underline: SizedBox(),
          icon: SizedBox(),
          items: shops.map<DropdownMenuItem<String>>((dynamic value) {
            return DropdownMenuItem<String>(
              value: _selectedShop,
              child: AutoSizeText(value),
            );
          }).toList(),
          hint: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeText(
                "Beyoğlu",
                style: TextStyle(color: context.primaryLightColor),
              ),
            ],
          ),
          onChanged: (v) {
            setState(() {
              _selectedShop = v!;
            });
          },
        ),
        SizedBox(width: 5),
        Icon(
          Icons.keyboard_arrow_down,
          color: context.primaryColor,
          size: 20,
        ),
        Spacer(),
      ],
    );
  }
}
