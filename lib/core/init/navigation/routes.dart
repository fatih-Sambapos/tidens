import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:tidens_coin/core/core_shelf.dart';
import 'package:tidens_coin/core/init/helpers/helpers_shelf.dart';
import 'package:tidens_coin/views/tab_screen/tab_screen.dart';
import 'package:tidens_coin/views/views_shelf.dart';

import '../../../views/views_shelf.dart';

mixin Routes {
  final Map<String, Widget Function(BuildContext)> routes = {
    NavigationConstants.login: (_) => LoginScreen(),
    NavigationConstants.home: (_) => TabScreen(),
    NavigationConstants.swap: (_) => SwapScreen(),
    NavigationConstants.stake: (_) => StakeScreen(),
    NavigationConstants.bankAccounts: (_) => BankAccounts(),
    NavigationConstants.transactionHistory: (_) => TransactionHistoryScreen(),
    NavigationConstants.settings: (_) => SettingsScreen(),
    NavigationConstants.profile: (_) => ProfileScreen(),
  };
}
