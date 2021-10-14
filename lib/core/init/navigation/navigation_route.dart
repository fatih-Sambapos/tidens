import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:metrik_v2/views/screens/search/search_screen.dart';
import 'package:metrik_v2/views/screens/settings/example.dart';
import 'package:metrik_v2/views/tab_screen/tab_screen.dart';

import '../../core_shelf.dart';
import '../../../views/views_shelf.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.splash:
        return normalNavigate(SplashScreen());
      case NavigationConstants.login:
        return normalNavigate(LoginScreen());
      case NavigationConstants.profileSettings:
        return normalNavigate(ProfileSettings());
      case NavigationConstants.helpAndFeedback:
        return normalNavigate(HelpAndFeedback());
      case NavigationConstants.notificationsSettings:
        return normalNavigate(NotificationsSettings());
      case NavigationConstants.notifications:
        return normalNavigate(NotificationScreen());
      case NavigationConstants.home:
        return normalNavigate(TabScreen());
      case NavigationConstants.settings:
        return normalNavigate(Settings());
      case NavigationConstants.example:
        return normalNavigate(ExampleScreen());
      case NavigationConstants.myBusinessesScreen:
        return normalNavigate(MyBusinessesScreen());
      case NavigationConstants.myBusinessesDetail:
        return normalNavigate(MyBusinessesDetail());
      case NavigationConstants.buyLicenseScreen:
        return normalNavigate(BuyLicenseScreen());
      case NavigationConstants.reportScreen:
        return normalNavigate(ReportScreen());
      case NavigationConstants.reportListScreen:
        return normalNavigate(ReportListScreen());
      case NavigationConstants.search:
        return normalNavigate(SearchScreen());
      default:
        return normalNavigate(SplashScreen());
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
