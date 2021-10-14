import 'dart:convert';
import 'dart:developer';

import 'package:dart_amqp/dart_amqp.dart' as amqp;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:metrik_v2/core/constants/api/json_constants.dart';
import 'package:metrik_v2/core/init/network/network_manager.dart';

import '../models/custom_report_names/custom_report_names_model.dart';
import '../models/item_sales_model/item_sales_model.dart';

class RabbitmqProvider extends ChangeNotifier {
  CustomReportNamesModel? customReportNamesModel;
  ItemSalesModel? itemSalesModel;
  var getTableNamesMessage = {"type": "GetCustomReportNames"};
  Map<dynamic, dynamic> msgTableName = {};
  Map<dynamic, dynamic> msgTableData = {};
  var requestQueue = "pda@sambapos.org_req";
  var responseQueue = "pda@sambapos.org_res";
  amqp.ConnectionSettings settings = amqp.ConnectionSettings(
      virtualHost: "/",
      port: 5669,
      host: "yemeksepeti.sambapos.com",
      authProvider: const amqp.PlainAuthenticator("guest", "guest"));

  var rabbitmqBackend = "http://mmq.sambapos.com:4000";

  var header = {'Content-Type': 'application/json'};

  Future<void> getTableNames() async {
    var clientTableName = amqp.Client(settings: settings);
    var webGetTableNames = {
      "host": "amqp://yemeksepeti.sambapos.com:5669",
      "request_queue": "$requestQueue",
      "response_queue": "$responseQueue",
      "request_message": getTableNamesMessage
    };
    if (kIsWeb) {
      try {
        var req = await NetworkManager.instance.postRequest(
            bodyFields: false,
            url: rabbitmqBackend,
            json: webGetTableNames,
            contentType: header);
        var reqJson = req;
        log(req.toString());
        log(reqJson.toString());
        customReportNamesModel =
            CustomReportNamesModel.fromJson(jsonDecode(jsonEncode(reqJson)));
        notifyListeners();
      } catch (e) {
        rethrow;
      }
    } else {
      try {
        var channelTableName = await clientTableName.channel();
        var queueReq =
            await channelTableName.queue(requestQueue, durable: true);
        queueReq.publish(getTableNamesMessage);
        var queueRes =
            await channelTableName.queue(responseQueue, durable: true);
        var consumerTableName = await queueRes.consume();
        consumerTableName.listen((message) async {
          msgTableName = message.payloadAsJson;
          var messageJson = await jsonDecode(jsonEncode(msgTableName));
          log(messageJson.toString());
          customReportNamesModel = CustomReportNamesModel.fromJson(messageJson);
          notifyListeners();
        });
        consumerTableName.cancel();
        channelTableName.close();
        clientTableName.close();
        notifyListeners();
      } catch (_) {
        rethrow;
      }
    }
  }

  // Future<void> getTableData(String tableName) async {
  //   Map getTableDataMessage = {
  //     "type": "GetCustomReport",
  //     "reportname": "ItemSalesReport",
  //   };
  //   var clientTableData = amqp.Client(settings: settings);
  //   try {
  //     var channelTableData = await clientTableData.channel();
  //     var queueReq = await channelTableData.queue(requestQueue, durable: true);
  //     queueReq.publish(getTableDataMessage);
  //     var queueRes = await channelTableData.queue(responseQueue, durable: true);
  //     var consumerTableData = await queueRes.consume();
  //     consumerTableData.listen((message) async {
  //       msgTableData = message.payloadAsJson;
  //       log(message.payloadAsString);
  //       var messageJson = await jsonDecode(jsonEncode(msgTableData));
  //       log(messageJson);
  //       log(messageJson.toString());
  //       itemSalesModel = ItemSalesModel.fromJson(messageJson);
  //       notifyListeners();
  //     });
  //     consumerTableData.cancel();
  //     channelTableData.close();
  //     channelTableData.close();
  //     notifyListeners();
  //   } catch (_) {
  //     // throw e;
  //     // throw s;
  //   }
  // }

  Future<void> getTableData() async {
    try {
      itemSalesModel = ItemSalesModel.fromJson(itemsalesjson);

      notifyListeners();
    } catch (_) {}
  }
}
