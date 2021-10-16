import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tidens_coin/core/core_shelf.dart';
import 'package:tidens_coin/views/views_shelf.dart';

class TabScreen extends StatelessWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isWeb = Utils.instance.getGeneralType(context);
    return ChangeNotifierProvider(
      create: (_) => NavBarController(context),
      child: isWeb == DeviceType.web || isWeb == DeviceType.tablet
          ? HomeScreen()
          : Consumer<NavBarController>(
              builder: (_, controller, __) => CustomBottomNavBar(
                currentTab: controller.currentTabItem,
                pageBuilder: Utils.instance.allPages(),
                navigatorKeys: Utils.instance.navigatorKeys,
                onSelectedTab: controller.onSelectedTab,
              ),
            ),
    );
  }
}
