import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:tidens_coin/core/core_shelf.dart' as core;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await core.LocalManager.prefrencesInit();
  final languageProvider = core.LanguageProvider();
  await languageProvider.fetchLocale();
  final themeProvider = core.ThemeProvider.instance;
  await themeProvider.fetchLocale();
  core.Utils.instance.setSystemUi(!core.ThemeProvider.instance.isDark());
  runApp(
    core.MultiProvider(
      providers: [...?core.ApplicationProvider.instance?.dependItems],
      child: DevicePreview(
        //device previewde build etmek için false yerine yorum satırındakini kullanın
        enabled: false, //!kReleaseMode,
        builder: (context) => MyApp(
            languageProvider: languageProvider, themeProvider: themeProvider),
      ),
    ),
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
}

class MyApp extends StatefulWidget with core.Routes {
  final core.LanguageProvider languageProvider;
  final core.ThemeProvider themeProvider;
  MyApp({required this.languageProvider, required this.themeProvider, Key? key})
      : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: const MediaQueryData(),
      child: core.Consumer2<core.LanguageProvider, core.ThemeProvider>(
        builder: (context, langModel, themeModel, child) => MaterialApp(
          title: 'Metrik',
          debugShowCheckedModeBanner: false,
          theme: widget.themeProvider.theme,
          localizationsDelegates: [...core.AppLocalizations.localDelegates],
          locale: langModel.appLocal ?? widget.languageProvider.appLocal,
          supportedLocales: [...core.AppLocalizations.locales],
          routes: widget.routes,
          builder: DevicePreview.appBuilder,
          navigatorKey: core.NavigationService.instance.navigatorKey,
        ),
      ),
    );
  }
}
