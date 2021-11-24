import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tidens_coin/views/views_shelf.dart';
import '../../../core/core_shelf.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool visible = false;
  bool triedExit = false;
  String email = '';
  String password = '';
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      await Utils.instance.setOrientation(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return getScaffold();
  }

  Widget getScaffold() {
    return Scaffold(
      backgroundColor: Color(0xF9FAFB),
      appBar: appbar(),
      body: scrollContent(),
    );
  }

  AppBar appbar() {
    return AppBar(
      iconTheme: IconThemeData(color: context.secondaryDarkBlue),
      elevation: 0,
      backgroundColor: context.accentColor,
      centerTitle: true,
      title: Text("profile".translate.toUpperCase(), style: context.headline6),
      actions: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Icon(
            Icons.notifications_active_outlined,
          ),
        ),
      ],
    );
  }

  Widget scrollContent() {
    return SingleChildScrollView(
      physics: context.viewBottomPad > 0
          ? const NeverScrollableScrollPhysics()
          : const BouncingScrollPhysics(),
      child: getColumn(),
    );
  }

  Widget getColumn() {
    return SingleChildScrollView(
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Stack(
              children: [
                dashboardTop(),
                avatar(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    username(),
                    location(),
                  ],
                )
              ],
            ),
            profileCard(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  AutoSizeText("Edit Profile",
                      style: context.headline6.copyWith(
                          color: context.highlightColor,
                          fontWeight: FontWeight.w900,
                          fontSize: 20)),
                ],
              ),
            ),
            textField('email', Icon(Icons.mail_outline), true),
            textField('username', Icon(Icons.person_outline), true),
            textField('password', Icon(Icons.lock_outline), true),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: context.width * 4, vertical: context.height / 2),
              child: Container(
                  height: context.height * 5.5,
                  decoration: BoxDecoration(
                      color: context.accentColor,
                      borderRadius: context.lowCircular,
                      border: Border.all(color: context.darkGreyColor)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          right: 20,
                        ),
                        child: LanguageDropDown(isWeb: false),
                      ),
                    ],
                  )),
            ),
            saveButton('save')
            // textField('email', Icon(Icons.mail_outline), true),
          ],
        ),
      ),
    );
  }

  Widget saveButton(String btnTextKey) {
    var btnColor = context.primaryDarkColor;
    if (email == '' || password == '') {
      btnColor = context.secondaryGreen;
    } else {
      btnColor = context.secondaryGreen;
    }
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.width * 4, vertical: context.height),
      child: RoundedButton(
          buttonTextKey: btnTextKey,
          action: () {},
          borderRadius:
              context.lowCircular, // BorderRadius.circular(isWeb ? 55 : 40),
          backgroundColor: btnColor,
          borderColor: btnColor,
          borderWidth: 1,
          textStyle: context.headline2
              .copyWith(fontSize: context.height * 2, color: Colors.white)),
    );
  }

  Widget textField(String type, Widget prefixIcon, bool enabled) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.width * 4, vertical: context.height / 2),
      child: RoundedTextButton(
        onChanged: type == 'username' ? _changeEmail : _changePass,
        visibility: type == 'username' ? true : visible,
        changeVisibility: _changeVisibility,
        hintTextKey: type,
        prefixIcon: prefixIcon,
        // isWeb: false,
        enabled: enabled,
      ),
    );
  }

  Padding profileCard() {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Container(
        width: context.width * 95,
        decoration: BoxDecoration(
            borderRadius: context.lowCircular,
            color: context.accentColor,
            border: Border.all(width: 0.2)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            profileCardItem('324', 'transactions'),
            profileCardItem('\$70.504', 'received'),
            profileCardItem('\$10.283', 'exchanged'),
          ],
        ),
      ),
    );
  }

  Widget profileCardItem(String count, String tag) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AutoSizeText(count,
                style: context.headline6.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: Colors.blue.shade400)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AutoSizeText(tag.translate,
                style: context.headline6.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: context.highlightColor)),
          ),
        ],
      ),
    );
  }

  Padding avatar() {
    return Padding(
      padding: EdgeInsets.only(top: context.height * 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(
            child: Material(
                // borderRadius: BorderRadius.circular(10),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ClipOval(
                      // borderRadius: BorderRadius.circular(10),
                      child: Image(
                          width: 130,
                          image: NetworkImage(
                              "https://thispersondoesnotexist.com/image?"))),
                )),
          )
        ],
      ),
    );
  }

  Padding location() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: AutoSizeText(
        'Mersin, TR',
        style: context.headline6
            .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }

  Padding username() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: AutoSizeText(
        'Tidens User',
        style: context.headline6
            .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget dashboardTop() {
    return Stack(
      children: [
        Container(
          height: context.height * 15,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xFF3C6FDD),
              Color(0xFF023386),
              Color(0xFF000A91),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
        ),
        // SizedBox(height: context.height / 2),
      ],
    );
  }

  Text topBalanceText(String text) {
    return Text(
      text,
      style:
          context.headline6.copyWith(color: context.accentColor, fontSize: 20),
    );
  }

  Container dashboardBottom() {
    return Container(
      margin: EdgeInsets.only(top: 65),
      child: Material(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 25),
                child: Text(
                  "Son 5 İşleminiz",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600]),
                ),
              ),
              SizedBox(height: context.height / 2),
              dashBottomCard(
                Icons.north_east,
                context.errorColor,
                "TRY",
                "08-24  8:04PM",
                "+0.94853",
                "1250 ₺",
              ),
              dashBottomCard(
                Icons.south_west,
                Colors.green.shade700,
                "TRY",
                "08-24  8:04PM",
                "+0.94853",
                "5.900 ₺",
              ),
              dashBottomCard(
                Icons.all_inclusive,
                Colors.yellow.shade800,
                "ACRO",
                "08-24  8:04PM",
                "+0.94853",
                "10.000",
              ),
              dashBottomCard(
                Icons.repeat,
                Colors.blueGrey.shade500,
                "ACRO > TRY",
                "08-24  8:04PM",
                "+0.94853",
                "2,748.94",
              ),
              SizedBox(height: context.height * 2)
            ],
          ),
        ),
      ),
    );
  }

  Padding dashBottomCard(IconData icon, Color iconColor, String coin,
      String date, String profit, String balance) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 5),
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            color: context.accentColor,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.all(12),
          child: Row(
            children: [
              Icon(icon, size: 40, color: iconColor),
              // Image(height: 70, image: NetworkImage(imgUrl)),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 4, left: 8),
                          child: Text(
                            coin,
                            style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey[700]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 8),
                          child: Text(
                            date,
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey[500]),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 4, right: 8),
                          child: Text(
                            profit,
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.normal,
                                color: Colors.green[700]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, right: 8),
                          child: Text(
                            balance,
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey[700]),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _changeEmail(String newEmail) {
    setState(() {
      email = newEmail;
    });
  }

  void _changePass(String newPass) {
    setState(() {
      password = newPass;
    });
  }

  void _changeVisibility() {
    setState(() {
      visible = !visible;
    });
  }
}
