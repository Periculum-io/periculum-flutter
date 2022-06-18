import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';

class FlutterPericulum {
  static const MethodChannel _channel = MethodChannel('flutter_periculum');

  static Future<String> generateMobileAnalysisV1({
    required String publicKey,
    String? phoneNumber,
    String? bvn,
  }) async {
    try {
      final String response =
          await _channel.invokeMethod('generateMobileDataAnalysis', {
        "publicKey": publicKey,
        'phoneNumber': phoneNumber,
        'endpoint': '/mobile/analytics',
      });
      log(response);
      return response;
    } on FormatException catch (_) {
      log("FormatException: Invalid Acccess Token");
      rethrow;
    } on HttpException catch (e) {
      log(e.message);
      rethrow;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  static Future<String> generateMobileInsightV2({
    required String publicKey,
    String? phoneNumber,
    String? bvn,
  }) async {
    try {
      final String response =
          await _channel.invokeMethod('generateMobileDataAnalysis', {
        "publicKey": publicKey,
        'phoneNumber': phoneNumber,
        "bvn": bvn,
        'endpoint': '/mobile/insights/v2',
      });
      log(response);
      return response;
    } on PlatformException catch (e) {
      throw e.message.toString();
    }
  }

  static Future<String> patchMobileAnalysisV2({
    required String publicKey,
    required String overviewkey,
    String? phoneNumber,
    String? bvn,
  }) async {
    try {
      final String response =
          await _channel.invokeMethod('patchMobileAnalysis', {
        "publicKey": publicKey,
        "overviewkey": overviewkey,
        'phoneNumber': phoneNumber,
        "bvn": bvn,
      });
      log(response);
      return response;
    } on FormatException catch (_) {
      log("FormatException: Invalid Acccess Token");
      rethrow;
    } on HttpException catch (e) {
      log(e.message);
      rethrow;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
