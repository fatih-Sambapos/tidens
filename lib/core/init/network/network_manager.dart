import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart';

class NetworkManager {
  static final NetworkManager _instance = NetworkManager._init();

  late Dio _service;
  final String contentType = 'application/json';
  static NetworkManager get instance => _instance;
  String status = '';
  Map<String, String> jsonL = {};

  NetworkManager._init() {
    _service = Dio();
  }

  Future<Map<String, dynamic>> postRequest({
    required bodyFields,
    required String url,
    required var json, // Map<String, dynamic> json,

    required Map<String, String> contentType,
    String? token = '',
  }) async {
    try {
      var request = Request('POST', Uri.parse(url));
      if (bodyFields == true) {
        request.bodyFields = json;
      } else {
        request.body = jsonEncode(json);
      }

      request.headers.addAll(contentType);
      StreamedResponse response = await request.send();
      Map<String, dynamic> body =
          jsonDecode(await response.stream.bytesToString());
      status = response.statusCode.toString();
      log(body.toString());
      return body;
    } catch (e) {
      rethrow;
    }
  }

  // Future<Map<String, dynamic>> postRequest({
  //   required String url,
  //   required Map<String, dynamic> json,
  //   String? token = '',
  // }) async {
  //   try {
  //     _service.options.contentType =
  //         ContentType.parse('application/x-www-form-urlencoded').toString();
  //     final res = await _service.post(
  //       url,
  //       data: json.toString(),
  //       options: Options(headers: {
  //         HttpHeaders.contentTypeHeader: _service.options.contentType,
  //         'Authorization': token
  //       }),
  //     );
  //     return jsonDecode(res.toString());
  //   } on DioError {
  //     rethrow;
  //   }
  // }

  Future<Map<String, dynamic>> getRequest({
    required String url,
    String token = '',
  }) async {
    try {
      final res = await _service.get(
        url,
        options: Options(headers: {'Authorization': token}),
      );
      return jsonDecode(res.toString());
    } on DioError {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> putRequest({
    required String url,
    required Map<String, dynamic> json,
    String token = '',
  }) async {
    try {
      final res = await _service.put(
        url,
        data: json.toString(),
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: ContentType,
          'Authorization': token
        }),
      );
      return jsonDecode(res.toString());
    } on DioError {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> deleteRequest({
    required String url,
    required Map<String, dynamic> json,
    String token = '',
  }) async {
    try {
      final res = await _service.delete(
        url,
        data: json.toString(),
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: contentType,
          'Authorization': token
        }),
      );
      return jsonDecode(res.toString());
    } on DioError {
      rethrow;
    }
  }
}




// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:http/http.dart';

// class NetworkManager {
//   static final NetworkManager _instance = NetworkManager._init();

//   late Dio _service;
//   final String contentType = 'application/json';
//   static NetworkManager get instance => _instance;
//   String status = '';

//   NetworkManager._init() {
//     _service = Dio();
//   }

//   Future<Map<String, dynamic>> postRequest({
//     required String url,
//     required Map<String, String> json, // Map<String, dynamic> json,
//     required Map<String, String> contentType,
//     String? token = '',
//   }) async {
//     try {
//       var request = Request('POST', Uri.parse(url));
//       request.bodyFields = json;
//       request.headers.addAll(contentType);
//       StreamedResponse response = await request.send();
//       Map<String, dynamic> body =
//           jsonDecode(await response.stream.bytesToString());
//       status = response.statusCode.toString();
//       log(body.toString());
//       return body;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<Map<String, dynamic>> getRequest({
//     required String url,
//     String token = '',
//   }) async {
//     try {
//       final res = await _service.get(
//         url,
//         options: Options(headers: {'Authorization': token}),
//       );
//       return jsonDecode(res.toString());
//     } on DioError {
//       rethrow;
//     }
//   }

//   Future<Map<String, dynamic>> putRequest({
//     required String url,
//     required Map<String, dynamic> json,
//     String token = '',
//   }) async {
//     try {
//       final res = await _service.put(
//         url,
//         data: json.toString(),
//         options: Options(headers: {
//           HttpHeaders.contentTypeHeader: contentType,
//           'Authorization': token
//         }),
//       );
//       return jsonDecode(res.toString());
//     } on DioError {
//       rethrow;
//     }
//   }

//   Future<Map<String, dynamic>> deleteRequest({
//     required String url,
//     required Map<String, dynamic> json,
//     String token = '',
//   }) async {
//     try {
//       final res = await _service.delete(
//         url,
//         data: json.toString(),
//         options: Options(headers: {
//           HttpHeaders.contentTypeHeader: contentType,
//           'Authorization': token
//         }),
//       );
//       return jsonDecode(res.toString());
//     } on DioError {
//       rethrow;
//     }
//   }
// }
