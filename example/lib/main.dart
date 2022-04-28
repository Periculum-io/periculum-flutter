// ignore_for_file: prefer_typing_uninitialized_variables, unused_local_variable

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_periculum/flutter_periculum.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_periculum/models/AffordabilityResponse.dart';
import 'package:flutter_periculum/models/CreditScoreResponse.dart';
import 'package:flutter_periculum/models/Statement.dart';

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
  late Statement statement;
  late AffordabilityResponse affordabilityResponse;
  bool isLoading = false;
  bool _response = false;
  late List<CreditScoreResponse> creditResponse;

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
                                      token: "${dotenv.env['tokenKey']}")
                                  .then((value) => {
                                        affordabilityResponse = value,
                                        debugPrint(value
                                            .averageMonthlyLoanRepaymentAmount
                                            .toString())
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
                    TextButton(
                        onPressed: () async {
                          var response;
                          try {
                            response =
                                await FlutterPericulum.statementAnalytics(
                                        token: "${dotenv.env['tokenKey']}",
                                        statementKey: '125')
                                    .then((value) => {
                                          setState(() {
                                            isLoading = false;
                                            _response = true;
                                            statement = value;
                                          }),
                                        });
                          } on PlatformException {
                            setState(() {
                              isLoading = false;
                              _response = false;
                            });
                          } on Exception catch (e) {
                            if (kDebugMode) {
                              print(e);
                            }
                            setState(() {
                              _response = false;
                              isLoading = false;
                            });
                          }
                        },
                        child: const Text(
                          'Get Exisiting statement analytics',
                        )),
                    Text("Get statement $_response: "),
                    TextButton(
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });
                          var response;
                          try {
                            response =
                                await FlutterPericulum.getExisitingCreditScore(
                                        token: "${dotenv.env['tokenKey']}",
                                        statementKey: "123")
                                    .then((value) => {
                                          setState(() {
                                            isLoading = false;
                                            creditResponse = value;
                                            debugPrint(creditResponse[0]
                                                .baseScore
                                                .toString());
                                          }),
                                        });
                          } on PlatformException {
                            setState(() {
                              isLoading = false;
                            });
                          } on Exception catch (e) {
                            isLoading = false;
                            if (kDebugMode) {
                              print(e);
                            }
                            setState(() {
                              isLoading = false;
                            });
                          }
                        },
                        child: const Text(
                          'Get Transaction analytics',
                        )),
                    ElevatedButton(
                      onPressed: () async {
                        await FlutterPericulum.getStatementTransaction(
                            token: '${dotenv.env['tokenKey']}',
                            statementKey: '125');
                      },
                      child: const Text("Press Statement Transation"),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await FlutterPericulum.generateCreditScore(
                            token: '${dotenv.env['tokenKey']}',
                            statementKey: '120');
                      },
                      child: const Text("Generate Credit Score"),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
