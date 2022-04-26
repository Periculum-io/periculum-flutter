import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_periculum/models/ExistingStatment.dart';

class FlutterPericulum {
  static const MethodChannel _channel = MethodChannel('flutter_periculum');

  static Future<String> mobileDataAnalysis({
    required String token,
    String? phoneNumber,
    String? bvn,
    String? statementName,
  }) async {
    Map<String, dynamic> myresponse;

    final String response =
        await _channel.invokeMethod('generateMobileDataAnalysis', {
      'phoneNumber': phoneNumber,
      "bvn": bvn,
      'statementName': statementName,
      "token": token,
    });

    var result = jsonDecode(response);

    if (result != null) {
      myresponse = {"status": true, "data": response};
    } else {
      myresponse = {
        "status": false,
        "msg": result["title"],
      };
    }

    return jsonEncode(myresponse).toString();
  }

  static Future<String> affordabilityAnalysis({
    required String token,
    required double dti,
    required int statementKey,
    required int loanTenure,
    int? averageMonthlyTotalExpenses,
    int? averageMonthlyLoanRepaymentAmount,
  }) async {
    Map<String, dynamic> myresponse;
    String response =
        await _channel.invokeMethod('generateAffordabilityAnalysis', {
      'token': token,
      'dti': dti,
      'statementKey': statementKey,
      'loanTenure': loanTenure,
      'averageMonthlyTotalExpenses': averageMonthlyTotalExpenses,
      'averageMonthlyLoanRepaymentAmount': averageMonthlyLoanRepaymentAmount,
    });

    var result = jsonDecode(response);

    if (result["status"] == null) {
      myresponse = {"status": true, "data": response};
    } else {
      myresponse = {
        "status": false,
        "msg": result["title"],
      };
    }

    return jsonEncode(myresponse).toString();
  }

  static Future<String> statementAnalytics({required String token}) async {
    Map<String, dynamic> myResponse;
    String response = await _channel.invokeMethod(
      'getStatementAnalytics',
      {'token': token},
    );
    var result = jsonDecode(response);
    if (result != null) {
      myResponse = {"status": true, "data": response};
    } else {
      myResponse = {
        "status": false,
        "msg": result,
      };
    }

    return jsonEncode(myResponse).toString();
  }

  static Future<String> statementTransaction(
      {required String token, required String key}) async {
    Map<String, dynamic> myResponse;
    String response = await _channel.invokeMethod('getStatementTransaction', {
      'token': token,
      'statementKey': key,
    });
    var result = jsonDecode(response);
    if (result != null) {
      myResponse = {"status": true, "data": response};
    } else {
      myResponse = {
        "status": false,
        "msg": result,
      };
    }

    return jsonEncode(myResponse).toString();
  }

  static Future<String> statementAffordabilityAnalysis(
      {required String token, required String key}) async {
    Map<String, dynamic> myResponse;
    String response =
        await _channel.invokeMethod('getStatementAffordabilityAnalysis', {
      'token': token,
      'statementKey': key,
    });
    var result = jsonDecode(response);
    if (result != null) {
      myResponse = {"status": true, "data": response};
    } else {
      myResponse = {
        "status": false,
        "msg": result,
      };
    }

    return jsonEncode(myResponse).toString();
  }
}
