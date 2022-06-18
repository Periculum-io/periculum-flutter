import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_periculum/models/overview_key.dart';

class FlutterPericulum {
  static const MethodChannel _channel = MethodChannel('flutter_periculum');

  static Future<String> generateMobileAnalysisV1({
    required String publicKey,
    required String phoneNumber,
    required String bvn,
  }) async {
    try {
      final String response =
          await _channel.invokeMethod('generateMobileDataAnalysis', {
        "publicKey": publicKey,
        'phoneNumber': phoneNumber,
        'endpoint': '/mobile/analytics',
      });
      return response;
    } on FormatException catch (_) {
      rethrow;
    } on HttpException catch (_) {
      rethrow;
    } catch (e) {
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
      return response;
    } on PlatformException catch (e) {
      throw e.message.toString();
    }
  }

  static Future<OverviewKey> patchMobileAnalysisV2({
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
      return overviewKeyFromJson(response);
    } on FormatException catch (_) {
      rethrow;
    } on HttpException catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
