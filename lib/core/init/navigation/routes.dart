import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:metrik_v2/core/core_shelf.dart';
import 'package:metrik_v2/core/init/helpers/helpers_shelf.dart';
import 'package:metrik_v2/views/screens/search/search_screen.dart';
import 'package:metrik_v2/views/screens/settings/example.dart';
import 'package:metrik_v2/views/tab_screen/tab_screen.dart';
import 'package:metrik_v2/views/views_shelf.dart';

import '../../../views/views_shelf.dart';

mixin Routes {
  final Map<String, Widget Function(BuildContext)> routes = {
    NavigationConstants.splash: (_) {
      if (kIsWeb) {
        return SplashScreen();
      } else {
        return LoginScreen();
      }
    },
    NavigationConstants.login: (_) => LoginScreen(),
    NavigationConstants.home: (_) => TabScreen(),
    NavigationConstants.search: (_) => SearchScreen(),
    NavigationConstants.example: (_) => ExampleScreen(),
    NavigationConstants.helpAndFeedback: (_) => HelpAndFeedback(),
    NavigationConstants.buyLicenseScreen: (_) => BuyLicenseScreen(),
    NavigationConstants.myBusinessesDetail: (_) => MyBusinessesDetail(),
    NavigationConstants.myBusinessesScreen: (_) => MyBusinessesScreen(),
    NavigationConstants.notifications: (_) => NotificationScreen(),
    NavigationConstants.notificationsSettings: (_) => NotificationsSettings(),
    NavigationConstants.profileSettings: (_) => ProfileSettings(),
    NavigationConstants.settings: (_) => Settings(),
    NavigationConstants.reportScreen: (_) => ReportScreen(),
    NavigationConstants.reportListScreen: (_) => ReportListScreen(),
  };
}
