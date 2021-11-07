import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tidens_coin/views/components/home_screen_drawer.dart';
import '../../../core/core_shelf.dart';

class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({Key? key}) : super(key: key);

  @override
  _TransactionHistoryScreenState createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
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
    return getScaffold();
  }

  Widget getScaffold() {
    return Scaffold(
      backgroundColor: Color(0xF9FAFB),
      appBar: appbar(),
      drawer: HomeScreenDrawer(),
      body: scrollContent(),
    );
  }

  AppBar appbar() {
    return AppBar(
      iconTheme: IconThemeData(color: context.secondaryDarkBlue),
      backgroundColor: context.accentColor,
      centerTitle: true,
      title: Text("transactions_history".translate.toUpperCase(),
          style: context.headline6),
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
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: context.height,
            ),
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
              Icons.south_west,
              Colors.green.shade700,
              "TRY",
              "08-24  8:04PM",
              "+0.94853",
              "5.900 ₺",
            ),
            dashBottomCard(
              Icons.repeat,
              Colors.blueGrey.shade500,
              "ACRO > TRY",
              "08-24  8:04PM",
              "+0.94853",
              "2,748.94",
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
              Icons.north_east,
              context.errorColor,
              "TRY",
              "08-24  8:04PM",
              "+0.94853",
              "1250 ₺",
            ),
            dashBottomCard(
              Icons.all_inclusive,
              Colors.yellow.shade800,
              "ACRO",
              "08-24  8:04PM",
              "+0.94853",
              "10.000",
            ),
          ],
        ),
      ),
    );
  }

  Widget dashBottomCard(IconData icon, Color iconColor, String coin,
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
}
