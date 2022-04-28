import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_periculum/models/AffordabilityResponse.dart';
import 'package:flutter_periculum/models/ExistingCreditScoreResponse.dart';
import 'package:flutter_periculum/models/ExistingStatment.dart';
import 'package:flutter_periculum/models/TransactionStatementResponse.dart';

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

  static Future<AffordabilityResponse> affordabilityAnalysis({
    required String token,
    required double dti,
    required int statementKey,
    required int loanTenure,
    int? averageMonthlyTotalExpenses,
    int? averageMonthlyLoanRepaymentAmount,
  }) async {
    Map<String, dynamic> map;

    AffordabilityResponse affordabilityResponse;
    String response =
        await _channel.invokeMethod('generateAffordabilityAnalysis', {
      'token': token,
      'dti': dti,
      'statementKey': statementKey,
      'loanTenure': loanTenure,
      'averageMonthlyTotalExpenses': averageMonthlyTotalExpenses,
      'averageMonthlyLoanRepaymentAmount': averageMonthlyLoanRepaymentAmount,
    });

    var result = json.decode(response);
    map = json.decode(response);
    affordabilityResponse = AffordabilityResponse.fromJson(map);
    return affordabilityResponse;
  }

  static Future<ExisitingStatementResponse> statementAnalytics({
    required String token,
    required String statementKey,
  }) async {
    Map<String, dynamic> map;
    String response = await _channel.invokeMethod('getStatementAnalytics', {
      'token': token,
      'statementKey': statementKey,
    });

    map = json.decode(response);
    ExisitingStatementResponse exisitingStatementResponse =
        ExisitingStatementResponse.fromJson(map);
    debugPrint(exisitingStatementResponse.name);
    return exisitingStatementResponse;
  }

  // static Future<TransactionStatementResponse> statementTransaction({
  //   //work in progress
  //   required String token,
  //   required String key,
  // }) async {
  //   Map<String, dynamic> map;
  //   String response = await _channel.invokeMethod('getStatementTransaction', {
  //     'token': token,
  //     'statementKey': key,
  //   });

  //   var result = json.decode(response) as List;
  //   print(result[0]);
  //   map = json.decode(result[0]);
  //   TransactionStatementResponse transactionStatementResponse =
  //       TransactionStatementResponse.fromJson(map);
  //   return transactionStatementResponse;
  // }

  static Future<List<ExisitingCreditResponse>> getExisitingCreditScore({
    required String token,
    required String statementKey,
  }) async {
    String response = await _channel.invokeMethod('getExistingCreditScore', {
      'token': token,
      'statementKey': statementKey,
    });

    try {
      List<ExisitingCreditResponse> responseList;

      responseList = (json.decode(response) as List)
          .map((i) => ExisitingCreditResponse.fromJson(i))
          .toList();

      return responseList;
    } catch (e) {
      throw '{"status": false, "error": ${e.toString()}}';
    }
  }
}
