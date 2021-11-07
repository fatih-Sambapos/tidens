import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tidens_coin/views/components/home_screen_drawer.dart';
import '../../../core/core_shelf.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      title: Text("home".translate.toUpperCase(), style: context.headline6),
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
            Stack(
              children: [
                dashboardTop(),
                dashboardBottom(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container dashboardTop() {
    return Container(
      height: context.height * 20,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xFF3C6FDD),
          Color(0xFF023386),
          Color(0xFF000A91),
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: context.height / 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  topBalanceText('2,589.50'),
                  topBalanceText('ACRO'),
                ],
              ),
              Container(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  topBalanceText('2,589.50'),
                  topBalanceText('TRY'),
                ],
              ),
              // Material(
              //   borderRadius: BorderRadius.circular(10),
              //   elevation: 5,
              //   child: Padding(
              //     padding: const EdgeInsets.all(1.0),
              //     child: ClipRRect(
              //         borderRadius: BorderRadius.circular(10),
              //         child: Image(
              //             width: 50,
              //             image: NetworkImage(
              //                 "https://thispersondoesnotexist.com/image?"))),
              //   ),
              // )
            ],
          ),
        ],
      ),
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
              Container(
                // padding: EdgeInsets.only(top: 20, bottom: 20),
                height: 35,
                width: double.infinity,
                color: Colors.black,
                child: Text(
                  "datadata",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SfCartesianChart(
                    backgroundColor: context.canvasColor,
                    primaryXAxis: DateTimeAxis(
                        visibleMinimum: DateTime(2016, 01, 8),
                        visibleMaximum: DateTime(2016, 2, 28),
                        edgeLabelPlacement: EdgeLabelPlacement.shift,
                        intervalType: DateTimeIntervalType.days,
                        majorGridLines: MajorGridLines(width: 0)),
                    primaryYAxis: NumericAxis(interval: 5),
                    series: <ChartSeries<ChartSampleData, DateTime>>[
                      CandleSeries<ChartSampleData, DateTime>(
                        dataSource: chartData,
                        xValueMapper: (ChartSampleData sales, _) => sales.x,
                        lowValueMapper: (ChartSampleData sales, _) => sales.low,
                        highValueMapper: (ChartSampleData sales, _) =>
                            sales.high,
                        openValueMapper: (ChartSampleData sales, _) =>
                            sales.open,
                        closeValueMapper: (ChartSampleData sales, _) =>
                            sales.close,
                        name: 'Sales',
                      )
                    ]),
              ),
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
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [],
      ),
    );
  }
}

class ChartSampleData {
  ChartSampleData({this.x, this.open, this.high, this.low, this.close});

  final DateTime? x;
  final double? open;
  final double? high;
  final double? low;
  final double? close;
}

List<ChartSampleData> chartData = [
  ChartSampleData(
      x: DateTime(2016, 12, 5),
      open: 98.97,
      high: 101.19,
      low: 95.36,
      close: 97.13),
  ChartSampleData(
      x: DateTime(2016, 01, 18),
      open: 98.41,
      high: 101.46,
      low: 93.42,
      close: 101.42),
  ChartSampleData(
      x: DateTime(2016, 01, 25),
      open: 101.52,
      high: 101.53,
      low: 92.39,
      close: 97.34),
  ChartSampleData(
      x: DateTime(2016, 02, 01),
      open: 96.47,
      high: 97.33,
      low: 93.69,
      close: 94.02),
  ChartSampleData(
      x: DateTime(2016, 02, 08),
      open: 93.13,
      high: 96.35,
      low: 92.59,
      close: 93.99),
  ChartSampleData(
      x: DateTime(2016, 02, 15),
      open: 95.02,
      high: 98.89,
      low: 94.61,
      close: 96.04),
  ChartSampleData(
      x: DateTime(2016, 02, 22),
      open: 96.31,
      high: 98.0237,
      low: 93.32,
      close: 96.91),
  ChartSampleData(
      x: DateTime(2016, 02, 29),
      open: 96.86,
      high: 103.75,
      low: 96.65,
      close: 103.01),
  // ChartSampleData(
  //     x: DateTime(2016, 03, 07),
  //     open: 102.39,
  //     high: 102.83,
  //     low: 100.15,
  //     close: 102.26),
  // ChartSampleData(
  //     x: DateTime(2016, 03, 16),
  //     open: 106.5,
  //     high: 106.5,
  //     low: 106.5,
  //     close: 106.5),
];
// class DashBoardImageButton extends StatelessWidget {
//   final imageUrl;
//   final buttonName;

//   const DashBoardImageButton({Key? key, this.imageUrl, this.buttonName})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Material(
//           borderRadius: BorderRadius.circular(10),
//           elevation: 5,
//           child: Padding(
//             padding: const EdgeInsets.all(1.0),
//             child: ClipRRect(
//                 borderRadius: BorderRadius.circular(10),
//                 child: Image(width: 55, image: NetworkImage(imageUrl))),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(buttonName,
//               style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.w300,
//                   fontSize: 18)),
//         )
//       ],
//     );
//   }
// }
