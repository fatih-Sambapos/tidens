import 'package:flutter/material.dart';
import 'package:metrik_v2/core/core_shelf.dart';

class NavBarController extends ChangeNotifier {
  NavBarController(this.context);
  final BuildContext context;

  TabItem? _currentTabItem;

  TabItem get currentTabItem => _currentTabItem ?? TabItem.home;

  void onSelectedTab(TabItem value) {
    if (value == _currentTabItem) {
      Utils.instance.navigatorKeys[value]?.currentState
          ?.popUntil((route) => route.isFirst);
    }
    _currentTabItem = value;
    notifyListeners();
  }
}
