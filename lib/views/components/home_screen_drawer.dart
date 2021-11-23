import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tidens_coin/core/provider/rabbitmq_provider.dart';
import 'package:tidens_coin/views/tab_screen/tab_screen.dart';

import '../../../core/core_shelf.dart';

class HomeScreenDrawer extends StatefulWidget {
  const HomeScreenDrawer({Key? key}) : super(key: key);

  @override
  _HomeScreenDrawerState createState() => _HomeScreenDrawerState();
}

class _HomeScreenDrawerState extends State<HomeScreenDrawer> {
  bool visible = false;
  bool triedExit = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      await Utils.instance.setOrientation(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [drawerBackgroundImage(), drawerWidgets()],
      ),
    );
  }

  Widget drawerWidgets() {
    return SingleChildScrollView(
      child: Column(
        children: [
          sizedBox(),
          drawetTop(),
          drawerDivider(),
          drawerBody(),
          // drawerDivider(),
          // Spacer(flex: 10),
          SizedBox(height: context.height * 45), sizedBox()
        ],
      ),
    );
  }

  Widget drawerFooter() {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        // Navigator.pushNamed(context, NavigationConstants.helpAndFeedback);
      },
      child: Row(
        children: [
          Spacer(flex: context.landspace ? 5 : 3),
          Icon(Icons.help, color: context.accentColor, size: 30),
          Spacer(),
          Text(
            'help'.translate,
            style: context.headline6
                .copyWith(color: context.accentColor, fontSize: 18),
          ),
          Spacer(
            flex: 25,
          )
        ],
      ),
    );
  }

  SizedBox sizedBox() {
    return SizedBox(
      height: context.height * 4,
    );
  }

  List<String> drawerItems = ['Banka İşleri', 'Referanslar'];

  List<String> drawerItemsIcon = ['chart', 'report', 'store'];

  //List<bool> _isOpen = [false, false];
  Widget drawerBody() {
    return Column(children: [
      drawerListItem(drawerItems[0], [SizedBox()], drawerItemsIcon[0], false,
          NavigationConstants.bankAccounts),
      drawerListItem(drawerItems[1], [SizedBox()], drawerItemsIcon[1], false,
          NavigationConstants.home),
      // drawerListItem(
      //   drawerItems[1],
      //   [drawerSubListItem("e.name")],
      //   drawerItemsIcon[1],
      //   true,
      //   NavigationConstants.home,
      // ),
      // drawerListItem(
      //   drawerItems[1],
      //   [SizedBox()],
      //   drawerItemsIcon[2],
      //   false,
      //   NavigationConstants.home,
      // ),
    ]);
  }

  // ignore: unused_field
  bool _onChanged = false;
  Widget drawerListItem(String headerItem, List<Widget>? subListItem,
      String icon, bool isExpasionTile, String? route) {
    return Column(
      children: [
        Theme(
          data: ThemeData(dividerColor: Colors.transparent),
          child: isExpasionTile
              ? ExpansionTile(

                  // maintainState: true,
                  onExpansionChanged: (bool onChanged) {
                    _onChanged = onChanged;
                  },
                  expandedAlignment: Alignment.centerLeft,
                  controlAffinity: ListTileControlAffinity.leading,
                  iconColor: context.primaryColor,
                  collapsedIconColor: context.accentColor,
                  collapsedBackgroundColor:
                      Colors.transparent, // context.primaryColor,
                  textColor: context.accentColor,
                  collapsedTextColor: context.accentColor,
                  tilePadding: EdgeInsets.zero,
                  childrenPadding: EdgeInsets.all(0),
                  leading: SizedBox(),
                  title: Transform.translate(
                    offset: Offset(-25, 0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            icon.toIconSVG,
                            color: context.accentColor,
                          ),
                          SizedBox(width: 15),
                          AutoSizeText(
                            headerItem,
                            minFontSize: 18,
                            style: TextStyle(color: context.accentColor),
                          ),
                        ]),
                  ),
                  children: subListItem!)
              : TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    route == '/home'
                        ? MaterialPageRoute(
                            builder: (BuildContext context) => TabScreen())
                        : Navigator.pushNamed(context, route!);
                  },
                  child: (Row(
                    children: [
                      SizedBox(width: 20),
                      SvgPicture.asset(
                        icon.toIconSVG,
                        color: context.accentColor,
                      ),
                      SizedBox(width: 15),
                      AutoSizeText(
                        headerItem,
                        minFontSize: 18,
                        style: TextStyle(color: context.accentColor),
                      ),
                      Spacer()
                    ],
                  )),
                ),
        ),
        drawerDivider()
      ],
    );
  }

  Container drawerSubListItem(String listItem) {
    return Container(
      decoration: new BoxDecoration(color: Colors.transparent),
      child: Row(
        children: [
          Spacer(flex: 2),
          Expanded(
            flex: 10,
            child: ListTile(
              title: Text(
                '• $listItem',
                style: context.headline6.copyWith(color: context.accentColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Divider drawerDivider() {
    return Divider(
      color: Color(0xFFCE331Dffffff),
      thickness: 1.5,
    );
  }

  Widget drawetTop() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Spacer(flex: 1),
        drawerTopUsername(),
        Spacer(flex: 10),
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.clear, color: context.accentColor),
        )
      ],
    );
  }

  Widget drawerTopUsername() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, NavigationConstants.profile);
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: AutoSizeText(
          'Ivan Barayev',
          style: context.headline5.copyWith(
              color: context.accentColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  ClipOval drawerTopAvatar() {
    return ClipOval(
      child: Container(
        color: context.canvasColor,
        width: 40,
        height: 40,
      ),
    );
  }

  Widget drawerBackgroundImage() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment
              .bottomCenter, // 10% of the width, so there are ten blinds.
          colors: <Color>[
            context.gradientLight,
            context.gradientDark
          ], // red to yellow
          tileMode: TileMode.repeated, // repeats the gradient over the canvas
        ),
      ),
    );
  }
}
