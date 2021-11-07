import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tidens_coin/core/init/init_shelf.dart';

import '../../core_shelf.dart';

class CustomBottomNavBar extends StatefulWidget with Routes {
  CustomBottomNavBar(
      {Key? key,
      required this.currentTab,
      required this.onSelectedTab,
      required this.pageBuilder,
      required this.navigatorKeys})
      : super(key: key);

  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectedTab;
  final Map<TabItem, Widget> pageBuilder;
  final Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys;

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color(0xFF000000).withAlpha(60),
          blurRadius: 6.0,
          spreadRadius: 0.0,
          offset: Offset(
            0.0,
            3.0,
          ),
        ),
      ]),
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          iconSize: 30,
          backgroundColor: context.accentColor,
          items: [
            _createNavItem(TabItem.home),
            _createNavItem(TabItem.stake),
            _createNavItem(TabItem.transactionHistory),
            _createNavItem(TabItem.swap),
          ],
          onTap: (index) => widget.onSelectedTab(TabItem.values[index]),
        ),
        tabBuilder: (context, index) {
          final showItem = TabItem.values[index];
          return CupertinoTabView(
              // ignore: missing_return
              // onGenerateRoute: NavigationRoute.instance.generateRoute,
              routes: widget.routes,
              navigatorKey: widget.navigatorKeys[showItem],
              builder: (context) => widget.pageBuilder[showItem]!);
        },
      ),
    );
  }

  BottomNavigationBarItem _createNavItem(TabItem tabItem) {
    var allTab = TabItemData.allTabs(context);
    final tabToCreate = allTab[tabItem];
    return BottomNavigationBarItem(
        activeIcon: tabToCreate!.selectedPicture,
        icon: tabToCreate.unselectedPicture!);
  }
}
