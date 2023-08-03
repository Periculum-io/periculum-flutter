import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_insights/models/overview_key.dart';
import 'package:flutter_insights/models/periculum.dart';
import 'package:flutter_insights/models/sender_address.dart';
import 'package:http/http.dart' as http;

import 'models/response.dart';


class FlutterPericulum {
  static const MethodChannel _channel = MethodChannel('flutter_insights');
  static String baseUrl = 'https://api.insights-periculum.com';

  static void sendDataToNative(String data) {
    try {
      _channel.invokeMethod('senderAddress', senderAddressFromJson(data));
    } on PlatformException catch (e) {
      // Handle error
    }
  }


  static Future<List<SenderAddress>> getSenderAddress({required String publicKey})async {
    try{
      var url = Uri.parse('$baseUrl/mobile/sms-address-list');
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
        'publicKey': publicKey,
      }));
      return senderAddressFromJson(response.body.toString());

    }on FormatException catch (_){
      rethrow;
    }

  }

  static Future<PericulumResponse?> generateMobileAnalysisV1({
      required String publicKey,
      required String phoneNumber,
      required String bvn,
    }) async {

    Periculum? data;
    try {
      final senderAddress = await getSenderAddress(publicKey: publicKey);
      final String response =
        await _channel.invokeMethod('generateMobileDataAnalysis', {
          "publicKey": publicKey,
          'phoneNumber': phoneNumber,
        });
        data = periculumFromJson(response.toString());

      List<Datum> unfilteredSMS= [];
      List<Datum> filteredSMS= [];
      unfilteredSMS = data.sms.data;
      for(int i = 0; i<senderAddress.length; i++){
        for(var smses in unfilteredSMS){
          if(smses.address.toLowerCase().contains(senderAddress[i].address.toLowerCase())){
            filteredSMS.add(smses);
          }
        }

      }

      Sms filterSMS = Sms(count: filteredSMS.length, data: filteredSMS);
      Periculum filteredData = Periculum(appName: data.appName, bundleId: data.bundleId, device: data.device, metadata: data.metadata, publicKey: publicKey, sms: filterSMS, statementName: data.statementName, version: data.version);

      var url = Uri.parse('$baseUrl/mobile/analytics');
      var call = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: json.encode(filteredData.toJson()));

      
      switch(call.statusCode){

        case 401:
          return PericulumResponse(mobileInsightsOverviewKey: null, statusCode: call.statusCode, status: false, message: 'Invalid publicKey');
          break;
        case 400:
          return PericulumResponse(mobileInsightsOverviewKey: null, statusCode: call.statusCode, status: false, message: 'There is already an Insights with the unique id provided. Please use the PATCH endpoint to update the existing Insights.');
          break;
          case 200:
        return PericulumResponse(mobileInsightsOverviewKey: null, statusCode: call.statusCode, status: true);
        break;
      }

    } on FormatException catch (_) {
      rethrow;
    } on HttpException catch (_) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  static Future<PericulumResponse?> generateMobileInsightV2({
      required String publicKey,
      String? phoneNumber,
      String? bvn,
    }) async {
    try {
      final senderAddress = await getSenderAddress(publicKey: publicKey);
      final String response =
        await _channel.invokeMethod('generateMobileDataAnalysis', {
          "publicKey": publicKey,
          'phoneNumber': phoneNumber,
          "bvn": bvn,
        });
      Periculum data = periculumFromJson(response.toString());

      List<Datum> unfilteredSMS= [];
      List<Datum> filteredSMS= [];
      unfilteredSMS = data.sms.data;
      for(int i = 0; i<senderAddress.length; i++){
        for(var smses in unfilteredSMS){
          if(smses.address.toLowerCase().contains(senderAddress[i].address.toLowerCase())){
            filteredSMS.add(smses);
          }
        }

      }

      Sms filterSMS = Sms(count: filteredSMS.length, data: filteredSMS);
      Periculum filteredData = Periculum(appName: data.appName, bundleId: data.bundleId, device: data.device, metadata: data.metadata, publicKey: publicKey, sms: filterSMS, statementName: data.statementName, version: data.version);

      var url = Uri.parse('$baseUrl/mobile/insights/v2');
      var call = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(filteredData.toJson()));

      
      switch(call.statusCode){
        case 200:
          OverviewKey? overviewKey = overviewKeyFromJson(call.body.toString());
          (call.body.toString());
          return PericulumResponse(mobileInsightsOverviewKey: overviewKey.mobileInsightsOverviewKey, statusCode: call.statusCode, status: true);
          break;
        case 401:
          return PericulumResponse(mobileInsightsOverviewKey: null, statusCode: call.statusCode, status: false, message: 'Invalid publicKey');
          break;
        case 400:
          return PericulumResponse(mobileInsightsOverviewKey: null, statusCode: call.statusCode, status: false, message: 'There is already an Insights with the unique id provided. Please use the PATCH endpoint to update the existing Insights.');
          break;
      }

    } on PlatformException catch (e) {
      throw e.message.toString();
    }
  }

  static Future<PericulumResponse?> patchMobileAnalysisV2({
      required String publicKey,
      required String overviewkey,
      String? phoneNumber,
      String? bvn,
    }) async {
    try {
      final senderAddress = await getSenderAddress(publicKey: publicKey);
      final  response =
        await _channel.invokeMethod('generateMobileDataAnalysis', {
          "publicKey": publicKey,
          "overviewkey": overviewkey,
          'phoneNumber': phoneNumber,
          "bvn": bvn,
        });
      Periculum data = periculumFromJson(response.toString());

      List<Datum> unfilteredSMS= [];
      List<Datum> filteredSMS= [];
      unfilteredSMS = data.sms.data;
      for(int i = 0; i<senderAddress.length; i++){
        for(var smses in unfilteredSMS){
          if(smses.address.toLowerCase().contains(senderAddress[i].address.toLowerCase())){
            filteredSMS.add(smses);
          }
        }
      }
      Sms filterSMS = Sms(count: filteredSMS.length, data: filteredSMS);
      Periculum filteredData = Periculum(appName: data.appName, bundleId: data.bundleId, device: data.device, metadata: data.metadata, publicKey: publicKey, sms: filterSMS, statementName: data.statementName, version: data.version);

      var url = Uri.parse('$baseUrl/mobile/insights/v2/1');
      var call = await http.patch(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(filteredData.toJson()));


      
      switch(call.statusCode){
        case 200:
          OverviewKey overviewKey = overviewKeyFromJson(call.body.toString());
          return PericulumResponse(mobileInsightsOverviewKey: overviewKey.mobileInsightsOverviewKey, statusCode: call.statusCode, status: true);
          break;
        case 401:
          return PericulumResponse(mobileInsightsOverviewKey:null, statusCode: call.statusCode, status: false, message: 'Invalid publicKey');
          break;
        case 500:
          return PericulumResponse(mobileInsightsOverviewKey:null, statusCode: call.statusCode, status: false, message: 'Overview key does not exist.');
          break;
      };
    } on FormatException catch (e) {
      throw e.toString();
    } on HttpException catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
