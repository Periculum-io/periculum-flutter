import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_periculum/flutter_periculum.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_periculum/models/AffordabilityResponse.dart';
import 'package:flutter_periculum/models/CreditScoreResponse.dart';
import 'package:flutter_periculum/models/CustomerIdentificationPayload.dart';
import 'package:flutter_periculum/models/StatementResponse.dart';
import 'package:flutter_periculum/models/StatementTransactionResponse.dart';

void main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _mobileData = 'Unknown';
  late CreditScoreResponse? creditScoreResponse;
  late StatementResponse? statementResponse;
  late AffordabilityResponse? affordabilityResponse;
  late List<CreditScoreResponse>? creditResponseList;
  late List<Transaction>? listStatementTransaction;
  late List<AffordabilityResponse>? listAfford;
  bool isLoading = false;
  bool _response = false;
  String responseOutput = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: isLoading
            ? const CircularProgressIndicator()
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        var response;
                        try {
                          response = await FlutterPericulum.mobileDataAnalysis(
                              phoneNumber: "08023456789",
                              bvn: "12345678901",
                              token: "${dotenv.env['tokenKey']}");
                        } on PlatformException {
                          setState(() {
                            _mobileData = response;
                            isLoading = false;
                          });
                        }
                        if (!mounted) return;

                        setState(() {
                          _mobileData = response;
                          isLoading = false;
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
                    const SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        var response;
                        try {
                          response =
                              await FlutterPericulum.affordabilityAnalysis(
                                  statementKey: 3,
                                  dti: 2.0,
                                  loanTenure: 30,
                                  averageMonthlyTotalExpenses: 4000,
                                  averageMonthlyLoanRepaymentAmount: 1000,
                                  token: "${dotenv.env['tokenKey']}");
                          setState(() {
                            responseOutput =
                                "PostAffordabilityAnalysis -> ${json.encode(response)}";
                          });
                        } on PlatformException {
                          setState(() {
                            isLoading = false;
                          });
                        }

                        if (!mounted) return;

                        setState(() {
                          isLoading = false;
                        });
                      },
                      child: const Text('Affordabilyty Analysis'),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Center(
                      child: Text('Running on: '),
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            responseOutput = "Loading generateCreditScore...";
                          });
                          CreditScoreResponse? response;
                          try {
                            response =
                                await FlutterPericulum.generateCreditScore(
                              token: "${dotenv.env['tokenKey']}",
                              statementKey: '125',
                            );
                            setState(() {
                              responseOutput =
                                  "GenerateCreditScore -> ${json.encode(response)}";
                            });
                          } catch (e) {
                            log(e.toString());
                          }
                        },
                        child: Text('Generate Credit Score')),
                    const SizedBox(
                      height: 10.0,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            responseOutput =
                                "GetExistingCreditScore -> Loading...";
                          });
                          try {
                            creditResponseList =
                                await FlutterPericulum.getExisitingCreditScore(
                              token: "${dotenv.env['tokenKey']}",
                              statementKey: '125',
                            );

                            setState(() {
                              responseOutput =
                                  "GetExistingCreditScore -> ${json.encode(creditResponseList)}";
                            });
                          } catch (e) {
                            log(e.toString());
                          }
                        },
                        child: Text('Get Existing Credit Score')),
                    const SizedBox(
                      height: 10.0,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            responseOutput =
                                "GetStatementTransaction -> Loading...";
                          });
                          try {
                            listStatementTransaction =
                                await FlutterPericulum.getStatementTransaction(
                              token: "${dotenv.env['tokenKey']}",
                              statementKey: '125',
                            );

                            setState(() {
                              responseOutput =
                                  "GetStatementTransaction -> ${json.encode(listStatementTransaction)}";
                            });
                          } catch (e) {
                            log(e.toString());
                          }
                        },
                        child: Text('Get Statement Transaction.')),
                    const SizedBox(
                      height: 10.0,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            responseOutput =
                                "GetStatementAnalytics -> Loading...";
                          });
                          try {
                            statementResponse =
                                await FlutterPericulum.getStatementAnalytics(
                              token: "${dotenv.env['tokenKey']}",
                              statementKey: '125',
                            );
                            setState(() {
                              responseOutput =
                                  "GetStatementAnalytics -> ${json.encode(statementResponse)}";
                            });
                          } catch (e) {
                            log(e.toString());
                          }
                        },
                        child: Text('Get Statement Analytics.')),
                    const SizedBox(
                      height: 10.0,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            responseOutput = "GetAffordability ->  loading...";
                          });

                          try {
                            listAfford =
                                await FlutterPericulum.getAffordability(
                              token: "${dotenv.env['tokenKey']}",
                              statementKey: '125',
                            );

                            setState(() {
                              responseOutput =
                                  "GetAffordability -> ${json.encode(listAfford)}";
                            });
                          } catch (e) {
                            log(e.toString());
                          }
                        },
                        child: Text('Get Existing Affordability.')),
                    const SizedBox(
                      height: 10.0,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            responseOutput =
                                "AttachCustomerIdentificationInfromation -> loading....";
                          });
                          var data = IdentificationData(
                              identifierName: 'bvn', value: '8678');
                          var data2 = IdentificationData(
                              identifierName: 'nin', value: '8678');
                          var response = await FlutterPericulum
                              .attachCustomerIdentificationInfromation(
                                  token: "${dotenv.env['tokenKey']}",
                                  statementKey: '125',
                                  customerIdentificationPayload:
                                      CustomerIdentificationPayload(
                                          statementKey: 125,
                                          identificationData: [data, data2]));
                          setState(() {
                            responseOutput =
                                "AttachCustomerIdentificationInfromation -> $response";
                          });
                        },
                        child: Text('Patch Client Identification')),
                    const SizedBox(
                      height: 30,
                    ),
                    Text("Result: $responseOutput"),
                  ],
                ),
              ),
      ),
    );
  }
}
