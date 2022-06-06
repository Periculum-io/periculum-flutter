import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_periculum/flutter_periculum.dart';

class V2Example extends StatefulWidget {
  const V2Example({Key? key}) : super(key: key);

  @override
  State<V2Example> createState() => _V2ExampleState();
}

class _V2ExampleState extends State<V2Example> {
  String responseOutput = "";
  String _mobileData = 'Unknown';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Text('V2 Example App'),
                  ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        responseOutput = "Loading.. ";
                      });
                      var response;
                      try {
                        response = await FlutterPericulum.mobileDataAnalysis(
                            phoneNumber: "08023456789",
                            bvn: "12345678901",
                            token: "${dotenv.env['tokenKey']}",
                            endpoint: "/mobile/insights/v2");
                        setState(() {
                          log(response.toString());
                          responseOutput =
                              "GenerateMobileAnalysis -> $response";
                        });
                      } on PlatformException {
                        setState(() {
                          _mobileData = response;
                        });
                      }
                      if (!mounted) return;

                      setState(() {
                        _mobileData = response;
                      });
                    },
                    child: const Text('Mobile Data Analysis'),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Center(
                    child: Text('Running on: $_mobileData\n'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        responseOutput = "GetInsightV2 -> loading.. ";
                      });
                      var response;
                      try {
                        response =
                            await FlutterPericulum.getMobileV2InsightOverview(
                                token: "${dotenv.env['tokenKey']}",
                                insightsOverviewKey: '2');
                        setState(() {
                          responseOutput =
                              "GetInsightV2 -> ${json.encode(response)}";
                        });
                      } catch (e) {
                        throw e.toString();
                      }
                    },
                    child: const Text('Get Overview Insight'),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        responseOutput = "GetBankInsight -> loading.. ";
                      });
                      var response;
                      try {
                        response = await FlutterPericulum
                            .getMobileV2BanksForInsightOverviewKey(
                                token: "${dotenv.env['tokenKey']}",
                                insightsOverviewKey: '2');
                        setState(() {
                          responseOutput =
                              "GetBankInsight -> ${json.encode(response)}";
                        });
                      } catch (e) {
                        throw e.toString();
                      }
                    },
                    child: const Text('Get Banks Insight'),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        responseOutput = "GetLendersOverview -> loading.. ";
                      });
                      var response;
                      try {
                        response = await FlutterPericulum
                            .getMobileV2LendersForInsightOverviewKey(
                                token: "${dotenv.env['tokenKey']}",
                                insightsOverviewKey: '2');
                        setState(() {
                          responseOutput =
                              "GetLendersOverview -> ${json.encode(response)}";
                        });
                      } catch (e) {
                        throw e.toString();
                      }
                    },
                    child: const Text('Get Lenders Insight'),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        responseOutput = "GetTransactionInsights -> loading.. ";
                      });
                      var response;
                      try {
                        response = await FlutterPericulum
                            .getMobileV2TransactionsByBankAddressAndAccountNumberForInsightOverviewKey(
                                token: "${dotenv.env['tokenKey']}",
                                insightsOverviewKey: '2',
                                smsAddress: '49',
                                accountKey: '41');
                        setState(() {
                          responseOutput =
                              "GetTransactionInsights -> ${json.encode(response)}";
                        });
                      } catch (e) {
                        throw e.toString();
                      }
                    },
                    child: const Text('Get Transaction Insight'),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        responseOutput = "GetInsights -> loading.. ";
                      });
                      var response;
                      try {
                        response = await FlutterPericulum
                            .getMobileV2InsightsByBankAddressAndAccountNumberForInsightOverviewKey(
                          token: "${dotenv.env['tokenKey']}",
                          insightsOverviewKey: '4',
                          smsAddress: '141',
                          accountKey: '117',
                        );
                        setState(() {
                          responseOutput =
                              "GetInsights -> ${json.encode(response)}";
                        });
                      } catch (e) {
                        throw e.toString();
                      }
                    },
                    child: const Text('Get Insight'),
                  ),
                  Text("Result: $responseOutput"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
