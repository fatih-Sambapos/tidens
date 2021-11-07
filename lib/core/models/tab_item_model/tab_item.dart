import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tidens_coin/core/extensions/string/image_path_extensions.dart';
import 'package:tidens_coin/core/extensions/extensions_shelf.dart';

enum TabItem { home, stake, transactionHistory, swap }

class TabItemData {
  final Widget? selectedPicture;
  final Widget? unselectedPicture;

  TabItemData({this.selectedPicture, this.unselectedPicture});

  static Map<TabItem, TabItemData> allTabs(BuildContext context) => {
        TabItem.home: TabItemData(
            selectedPicture: selected(Icons.home_outlined),
            unselectedPicture: unSelected(context, Icons.home_outlined)),
        TabItem.stake: TabItemData(
            selectedPicture: selected(Icons.all_inclusive), // stake
            unselectedPicture: unSelected(context, Icons.all_inclusive)),
        TabItem.transactionHistory: TabItemData(
            selectedPicture: selected(Icons.history_rounded), //   işlem geçmişi
            unselectedPicture: unSelected(context, Icons.history_rounded)),
        TabItem.swap: TabItemData(
            selectedPicture: selected(Icons.repeat), // gönder al
            unselectedPicture: unSelected(context, Icons.repeat)),
      };

  static Widget selected(IconData selected) {
    return Icon(selected, color: Color(0xFFC5B38B));

    ///TODO icon main color add
    // SvgPicture.asset(
    //   selected.toIconSVG,
    // );
  }

  static Widget unSelected(BuildContext context, IconData unselected) {
    return Icon(unselected, color: context.darkGreyColor);
  }
}

///TODO: gönder al sayfası:
///
