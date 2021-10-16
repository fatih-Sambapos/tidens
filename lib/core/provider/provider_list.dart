import 'package:tidens_coin/core/provider/login_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../core_shelf.dart';

class ApplicationProvider {
  static ApplicationProvider? _instance;
  static ApplicationProvider? get instance {
    _instance ??= ApplicationProvider._init();
    return _instance;
  }

  ApplicationProvider._init();

  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider(
      create: (context) => LanguageProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => RabbitmqProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => LoginProvider(),
    ),
    Provider.value(value: NavigationService.instance)
  ];
}
