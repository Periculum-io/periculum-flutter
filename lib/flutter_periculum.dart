import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_periculum/models/AffordabilityResponse.dart';
import 'package:flutter_periculum/models/BanksResponse.dart';
import 'package:flutter_periculum/models/CreditScoreResponse.dart';
import 'package:flutter_periculum/models/MobileAnalysisResponseV2.dart';
import 'package:flutter_periculum/models/InsightsResponse.dart';
import 'package:flutter_periculum/models/LendersResponse.dart';
import 'package:flutter_periculum/models/MobileAnalysisResponse.dart';
import 'package:flutter_periculum/models/SmsRawResponse.dart';
import 'package:flutter_periculum/models/StatementResponse.dart';
import 'package:flutter_periculum/models/StatementTransactionResponse.dart';
import 'package:flutter_periculum/models/TransactionResponse.dart';
import 'package:http/http.dart' as http;

import 'models/CustomerIdentificationPayload.dart';

class FlutterPericulum {
  static const MethodChannel _channel = MethodChannel('flutter_periculum');
  static const String BASE_URL = "https://api.insights-periculum.com";

  static Future<String> mobileDataAnalysis({
    required String token,
    String? phoneNumber,
    String? bvn,
    String? statementName,
    String? endpoint,
  }) async {
    try {
      final String response =
          await _channel.invokeMethod('generateMobileDataAnalysis', {
        'endpoint': endpoint,
        'phoneNumber': phoneNumber,
        "bvn": bvn,
        'statementName': statementName,
        "token": token,
      });
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

  static Future<AffordabilityResponse> affordabilityAnalysis({
    required String token,
    required double dti,
    required int statementKey,
    required int loanTenure,
    int? averageMonthlyTotalExpenses,
    int? averageMonthlyLoanRepaymentAmount,
  }) async {
    try {
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
    } on FormatException catch (_) {
      log("FormatException: Invalid Acccess Token or Statement Key");
      rethrow;
    } on HttpException catch (_) {
      log("HttpException: Check your connection");
      rethrow;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  static Future<StatementResponse> getStatementAnalytics({
    required String token,
    required String statementKey,
  }) async {
    try {
      Map<String, dynamic> map;
      String response = await _channel.invokeMethod('getStatementAnalytics', {
        'token': token,
        'statementKey': statementKey,
      });

      map = json.decode(response);
      StatementResponse exisitingStatementResponse =
          StatementResponse.fromJson(map);
      return exisitingStatementResponse;
    } on FormatException catch (_) {
      log("FormatException: Invalid Acccess Token or Statement Key");
      rethrow;
    } on HttpException catch (_) {
      log("HttpException: Check your connection");
      rethrow;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  static Future<List<CreditScoreResponse>> getExisitingCreditScore({
    required String token,
    required String statementKey,
  }) async {
    String response = await _channel.invokeMethod('getExistingCreditScore', {
      'token': token,
      'statementKey': statementKey,
    });

    try {
      List<CreditScoreResponse> responseList;

      responseList = (json.decode(response) as List)
          .map((i) => CreditScoreResponse.fromJson(i))
          .toList();

      return responseList;
    } on FormatException catch (_) {
      log("FormatException: Invalid Acccess Token or Statement Key");
      rethrow;
    } on HttpException catch (_) {
      log("HttpException: Check your connection");
      rethrow;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  static Future<List<Transaction>> getStatementTransaction({
    required String token,
    required String statementKey,
  }) async {
    String response = await _channel.invokeMethod('getStatementTransaction', {
      'token': token,
      'statementKey': statementKey,
    });

    try {
      List<Transaction> responseList;

      responseList = (json.decode(response) as List)
          .map((i) => Transaction.fromJson(i))
          .toList();
      return responseList;
    } on FormatException catch (_) {
      log("FormatException: Invalid Acccess Token or Statement Key");
      rethrow;
    } on HttpException catch (_) {
      log("HttpException: Check your connection");
      rethrow;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  static Future<List<AffordabilityResponse>> getAffordability({
    required String token,
    required String statementKey,
  }) async {
    String response = await _channel.invokeMethod('getAffordability', {
      'token': token,
      'statementKey': statementKey,
    });

    try {
      List<AffordabilityResponse> responseList;

      responseList = (json.decode(response) as List)
          .map((i) => AffordabilityResponse.fromJson(i))
          .toList();

      return responseList;
    } on FormatException catch (_) {
      log("FormatException: Invalid Acccess Token or Statement Key");
      rethrow;
    } on HttpException catch (_) {
      log("HttpException: Check your connection");
      rethrow;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  static Future<CreditScoreResponse> generateCreditScore({
    required String token,
    required String statementKey,
  }) async {
    final uri = Uri.parse('$BASE_URL/creditscore/$statementKey');

    var client = http.Client();
    Map<String, dynamic> map;
    var response;
    try {
      response = await client.post(
        uri,
        body: jsonEncode({}),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      var result = response.body;

      map = json.decode(result);
      CreditScoreResponse creditScoreResponse =
          CreditScoreResponse.fromJson(map);
      return creditScoreResponse;
    } on FormatException catch (_) {
      log("FormatException: Invalid Acccess Token or Statement Key");
      rethrow;
    } on HttpException catch (_) {
      log("HttpException: Check your connection");
      rethrow;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  static Future<dynamic> attachCustomerIdentificationInfromation({
    required String token,
    required String statementKey,
    required CustomerIdentificationPayload customerIdentificationPayload,
  }) async {
    final uri = Uri.parse('$BASE_URL/statements/identification');

    var client = http.Client();
    var response;
    var payload = customerIdentificationPayload;
    try {
      response = await client.patch(
        uri,
        body: json.encode(payload),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      debugPrint(customerIdentificationPayloadToJson(payload).toString());
      var result = response.statusCode;

      return result;
    } on FormatException catch (_) {
      log("FormatException: Invalid Acccess Token or Statement Key");
      rethrow;
    } on HttpException catch (_) {
      log("HttpException: Check your connection");
      rethrow;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  //V2

  static Future<MobileAnalysisResponseV2> getMobileV2InsightOverview({
    required String token,
    required String insightsOverviewKey,
  }) async {
    final uri = Uri.parse('$BASE_URL/mobile/v2/$insightsOverviewKey/overview');

    var client = http.Client();
    Map<String, dynamic> map;
    var response;
    try {
      response = await client.get(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      var result = response.body;
      map = json.decode(result);
      MobileAnalysisResponseV2 getMobileV2InsightOverview =
          MobileAnalysisResponseV2.fromJson(map);
      return getMobileV2InsightOverview;
    } on FormatException catch (_) {
      log("FormatException: Invalid Acccess Token or Insights Key");
      rethrow;
    } on HttpException catch (_) {
      log("HttpException: Check your connection");
      rethrow;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  static Future<BankResponse> getMobileV2BanksForInsightOverviewKey({
    required String token,
    required String insightsOverviewKey,
  }) async {
    final uri = Uri.parse('$BASE_URL/mobile/v2/$insightsOverviewKey/banks');

    var client = http.Client();
    Map<String, dynamic> map;
    var response;
    try {
      response = await client.get(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      var result = response.body;
      map = json.decode(result);
      BankResponse bankResponse = BankResponse.fromJson(map);
      return bankResponse;
    } on FormatException catch (_) {
      log("FormatException: Invalid Acccess Token or Insights Key");
      rethrow;
    } on HttpException catch (_) {
      log("HttpException: Check your connection");
      rethrow;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  static Future<LendersResponse> getMobileV2LendersForInsightOverviewKey({
    required String token,
    required String insightsOverviewKey,
  }) async {
    final uri = Uri.parse('$BASE_URL/mobile/v2/$insightsOverviewKey/lenders');

    var client = http.Client();
    Map<String, dynamic> map;
    var response;
    try {
      response = await client.get(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      var result = response.body;
      map = json.decode(result);
      LendersResponse lendersResponse = LendersResponse.fromJson(map);
      return lendersResponse;
    } on FormatException catch (_) {
      log("FormatException: Invalid Acccess Token or Insights Key");
      rethrow;
    } on HttpException catch (_) {
      log("HttpException: Check your connection");
      rethrow;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  static Future<List<TransactionResponse>>
      getMobileV2TransactionsByBankAddressAndAccountNumberForInsightOverviewKey({
    required String token,
    required String insightsOverviewKey,
    required String smsAddress,
    required String accountKey,
  }) async {
    final uri = Uri.parse(
        '$BASE_URL/mobile/v2/$insightsOverviewKey/banks/$smsAddress/$accountKey/transactions');

    var client = http.Client();
    var response;
    try {
      response = await client.get(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      List<TransactionResponse> responseList;

      responseList = transactionResponseFromJson(response.body);

      return responseList;
    } on FormatException catch (_) {
      log("FormatException: Invalid Acccess Token or Insights Key");
      rethrow;
    } on HttpException catch (_) {
      log("HttpException: Check your connection");
      rethrow;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  static Future<List<RawSmsResponse>>
      getMobileV2LenderRawSMSByLenderAddressForInsightOverviewKey({
    required String token,
    required String insightsOverviewKey,
    required String smsAddress,
  }) async {
    final uri = Uri.parse(
        '$BASE_URL/mobile/v2/$insightsOverviewKey/lenders/rawSMS/$smsAddress');

    var client = http.Client();
    var response;
    try {
      response = await client.get(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      List<RawSmsResponse> responseList;
      responseList = rawSmsResponseFromJson(response.body);

      return responseList;
    } on FormatException catch (_) {
      log("FormatException: Invalid Acccess Token or Insights Key");
      rethrow;
    } on HttpException catch (_) {
      log("HttpException: Check your connection");
      rethrow;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  static Future<InsightsResponse>
      getMobileV2InsightsByBankAddressAndAccountNumberForInsightOverviewKey({
    required String token,
    required String insightsOverviewKey,
    required String smsAddress,
    required String accountKey,
  }) async {
    final uri = Uri.parse(
        '$BASE_URL/mobile/v2/$insightsOverviewKey/banks/$smsAddress/$accountKey/insights');

    var client = http.Client();
    var response;
    try {
      response = await client.get(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      var result = response.body;
      var map = json.decode(result);
      InsightsResponse insightsResponse = InsightsResponse.fromJson(map);
      return insightsResponse;
    } on FormatException catch (_) {
      log("FormatException: Invalid Acccess Token or Insights Key");
      rethrow;
    } on HttpException catch (_) {
      log("HttpException: Check your connection");
      rethrow;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
