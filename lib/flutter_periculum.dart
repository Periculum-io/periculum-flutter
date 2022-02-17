import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_periculum/models/AffordabilityResponse.dart';
import 'package:flutter_periculum/models/MobileAnalysisResponse.dart';

class FlutterPericulum {
  static const MethodChannel _channel = MethodChannel('flutter_periculum');

  static Future<String> mobileDataAnalysis(
      {required String token,
      required String phoneNumber,
      required String bvn,
      String? statementName}) async {
    Map<String, dynamic> myresponse;

    final String response =
        await _channel.invokeMethod('generateMobileDataAnalysis', {
      'phoneNumber': phoneNumber,
      "bvn": bvn,
      'statementName': statementName,
      "token": token,
    });

    var result = jsonDecode(response);

    if (result["status"] == null) {
      myresponse = {
        "status": true,
        "data": response
      };
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
  }) async {
    Map<String, dynamic> myresponse;
    String response =
        await _channel.invokeMethod('generateAffordabilityAnalysis', {
      'token': token,
      'dti': dti,
      'statementKey': statementKey,
      'loanTenure': loanTenure
    });

    var result = jsonDecode(response);

    if (result["status"] == null) {
      myresponse = {
        "status": true,
        "data": response
      };
    } else {
      myresponse = {
        "status": false,
        "msg": result["title"],
      };
    }

    return jsonEncode(myresponse).toString();
  }
}
