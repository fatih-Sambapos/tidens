// // import 'package:charts_flutter/flutter.dart' as charts;

// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// import '../../../core/core_shelf.dart';

// class HomeScreenChart extends StatefulWidget {
//   const HomeScreenChart({Key? key}) : super(key: key);

//   @override
//   _HomeScreenChartState createState() => _HomeScreenChartState();
// }

// class _HomeScreenChartState extends State<HomeScreenChart> {
//   TooltipBehavior? _tooltipBehavior;

//   @override
//   void initState() {
//     _tooltipBehavior = TooltipBehavior(enable: true);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<SalesData> salesTable = [
//       SalesData('cash'.translate, 500, context.highlightColor),
//       SalesData('credit_card'.translate, 2400, context.secondaryDarkBlue),
//       SalesData('food_voucher'.translate, 900, context.primaryColor),
//       SalesData('other'.translate, 700, context.highlightColor),
//     ];
//     return SfCartesianChart(
//         primaryXAxis: CategoryAxis(
//           labelIntersectAction: AxisLabelIntersectAction.wrap,
//         ),
//         tooltipBehavior: _tooltipBehavior,
//         series: <ColumnSeries<SalesData, String>>[
//           ColumnSeries<SalesData, String>(
//               animationDuration: 500,
//               dataSource: salesTable,
//               pointColorMapper: (SalesData data, _) => data.color,
//               xValueMapper: (SalesData sales, _) => sales.paymentMethod,
//               yValueMapper: (SalesData sales, _) => sales.paymentAmount,
//               // Enable data label

//               dataLabelSettings: DataLabelSettings(isVisible: true))
//         ]);
//   }
// }

// class SalesData {
//   SalesData(this.paymentMethod, this.paymentAmount, this.color);
//   final String paymentMethod;
//   final double paymentAmount;
//   final Color color;
// }

// class WebHomeScreenChart extends StatefulWidget {
//   const WebHomeScreenChart({Key? key}) : super(key: key);

//   @override
//   _WebHomeScreenChartState createState() => _WebHomeScreenChartState();
// }

// class _WebHomeScreenChartState extends State<WebHomeScreenChart> {
//   TooltipBehavior? _tooltipBehavior;

//   @override
//   void initState() {
//     _tooltipBehavior = TooltipBehavior(enable: true);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<WebSalesData> webSalesTable = [
//       WebSalesData('monday'.translate, 500, context.highlightColor),
//       WebSalesData('tuesday'.translate, 2400, context.secondaryDarkBlue),
//       WebSalesData('wednesday'.translate, 900, context.primaryColor),
//       WebSalesData('thursday'.translate, 700, context.primaryDarkColor),
//       WebSalesData('friday'.translate, 1000, context.primaryLightColor),
//       WebSalesData('saturday'.translate, 100, context.secondaryPink),
//       WebSalesData('sunday'.translate, 300, context.secondaryGreen),
//     ];
//     return Container(
//       height: context.height * 25,
//       child: SfCartesianChart(
//           primaryXAxis: CategoryAxis(
//             labelIntersectAction: AxisLabelIntersectAction.multipleRows,
//           ),
//           tooltipBehavior: _tooltipBehavior,
//           series: <ColumnSeries<WebSalesData, String>>[
//             ColumnSeries<WebSalesData, String>(
//                 animationDuration: 500,
//                 dataSource: webSalesTable,
//                 pointColorMapper: (WebSalesData data, _) => data.color,
//                 xValueMapper: (WebSalesData sales, _) => sales.days,
//                 yValueMapper: (WebSalesData sales, _) => sales.paymentAmount,
//                 dataLabelSettings: DataLabelSettings(isVisible: true))
//           ]),
//     );
//   }
// }

// class WebSalesData {
//   WebSalesData(this.days, this.paymentAmount, this.color);
//   final String days;
//   final double paymentAmount;
//   final Color color;
// }
