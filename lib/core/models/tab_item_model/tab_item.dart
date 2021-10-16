import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tidens_coin/core/extensions/string/image_path_extensions.dart';
import 'package:tidens_coin/core/extensions/extensions_shelf.dart';

enum TabItem { home, search, reports, profile }

class TabItemData {
  final Widget? selectedPicture;
  final Widget? unselectedPicture;

  TabItemData({this.selectedPicture, this.unselectedPicture});

  static Map<TabItem, TabItemData> allTabs(BuildContext context) => {
        TabItem.home: TabItemData(
            selectedPicture: selected('home'),
            unselectedPicture: unSelected(context, 'home')),
        TabItem.search: TabItemData(
            selectedPicture: selected('search'),
            unselectedPicture: unSelected(context, 'search')),
        TabItem.reports: TabItemData(
            selectedPicture: selected('report'),
            unselectedPicture: unSelected(context, 'report')),
        TabItem.profile: TabItemData(
            selectedPicture: selected('profile'),
            unselectedPicture: unSelected(context, 'profile')),
      };

  static Widget selected(String selected) {
    return SvgPicture.asset(
      selected.toIconSVG,
    );
  }

  static Widget unSelected(BuildContext context, String unselected) {
    return SvgPicture.asset(
      unselected.toIconSVG,
      color: context.darkGreyColor,
    );
  }
}
