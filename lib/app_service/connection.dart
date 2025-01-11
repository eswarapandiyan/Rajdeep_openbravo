import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../app_utils/alert_service.dart';

class Connection {
  final header = {'Content-Type': 'application/json'};
  AlertService alertService = AlertService();
  getWithoutToken(String url) async {
    String username = "APIUser";
    String password = "EPiQn5QETv6mU4";
    var header = {
      'Content-Type': 'application/json',
      'Authorization':
          'Basic ${base64Encode(utf8.encode('$username:$password'))}',
    };
    try {
      var response = await http.get(Uri.parse(url), headers: header);
      print('Response status code ${response.statusCode}');
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        final result = json.decode(response.body);
        String msg = "${response.statusCode}: ${result['message'].toString()}";
        alertService.errorToast(msg);
      }
    } catch (e) {
      print("Exception ${e}");
    } finally {
      debugPrint('--- API request completed ---');
    }
  }

  postWithoutToken(String url, request) async {
    try {
      var response = await http.post(
        Uri.parse(url),
        headers: header,
        body: jsonEncode(request),
      );
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        final result = json.decode(response.body);
        String msg = "${response.statusCode}: ${result['message'].toString()}";
        alertService.errorToast(msg);
      }
    } catch (e) {
      print("Exception ${e}");
    } finally {
      debugPrint('--- API request completed ---');
    }
  }

  // postWithToken(String url, request, [error]) async {
  //   SecureStorage secureStorage = SecureStorage();
  //   final header = {
  //     'Content-Type': 'application/json',
  //     'Authorization': "Bearer ${secureStorage.getToken().toString()}",
  //   };
  //   try {
  //     Response response = await http.post(
  //       Uri.parse(url),
  //       headers: header,
  //       body: jsonEncode(request),
  //     );
  //     if (response.statusCode == 200) {
  //       return json.decode(response.body);
  //     } else if (response.statusCode == 404) {
  //       if (error != null) {
  //         gotoLogin(); // goto LOGIN PAGE
  //         return json.decode(response.body);
  //       } else {
  //         var result = json.decode(response.body);
  //         alertService.errorToast(result['message'].toString());
  //       }
  //     } else {
  //       var result = json.decode(response.body);
  //       alertService.errorToast(result['message'].toString());
  //     }
  //   } catch (e) {
  //     customException(e);
  //   } finally {
  //     debugPrint('--- API Request Completed ---');
  //   }
  // }

  // getWithToken(String url, [error]) async {
  //   SecureStorage secureStorage = SecureStorage();
  //   final header = {
  //     'Content-Type': 'application/json; charset=utf-8',
  //     'Authorization': "Bearer ${secureStorage.getToken().toString()}",
  //   };
  //   try {
  //     var response = await http.get(
  //       Uri.parse(url),
  //       headers: header,
  //     );
  //     if (response.statusCode == 200) {
  //       return json
  //           .decode(utf8.decode(response.bodyBytes, allowMalformed: true));
  //     } else if (response.statusCode == 401) {
  //       alertService.errorToast("Unauthorized");
  //       gotoLogin();
  //       return null;
  //     } else {
  //       if (error == null) {
  //         var result = json.decode(response.body);
  //         alertService.errorToast(
  //             "${response.statusCode}: ${result['message'].toString()}");
  //       }
  //     }
  //   } catch (e) {
  //     if (error == null) {
  //       customException(e);
  //     }
  //   } finally {
  //     debugPrint('--- API Request Completed ---');
  //   }
  // }
}
