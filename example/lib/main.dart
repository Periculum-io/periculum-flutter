import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_periculum/flutter_periculum.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_periculum/models/AffordabilityResponse.dart';
import 'package:flutter_periculum/models/ExistingCreditScoreResponse.dart';
import 'package:flutter_periculum/models/ExistingStatment.dart';

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
  // String _platformVersion = 'Unknown';
  late ExisitingStatementResponse exisitingStatementResponse;
  late AffordabilityResponse affordabilityResponse;
  bool isLoading = false;
  bool _response = false;
  // bool _statementResponse = false;
  late List<ExisitingCreditResponse> creditResponse;

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
            ? CircularProgressIndicator()
            : SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      //     disabledColor: Colors.red,
                      // disabledTextColor: Colors.black,
                      padding: const EdgeInsets.all(20),
                      textColor: Colors.white,
                      color: Colors.green,
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
                          // response = 'Failed to get platform version.';
                          setState(() {
                            _mobileData = response;
                            isLoading = false;
                          });
                        }

                        // If the widget was removed from the tree while the asynchronous platform
                        // message was in flight, we want to discard the reply rather than calling
                        // setState to update our non-existent appearance.
                        if (!mounted) return;

                        setState(() {
                          _mobileData = response;
                          isLoading = false;
                        });
                      },
                      child: Text('Mobile Data Analysis'),
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
                    RaisedButton(
                      padding: const EdgeInsets.all(20),
                      textColor: Colors.white,
                      color: Colors.green,
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
                            // _mobileData = response;
                            isLoading = false;
                          });
                        }

                        if (!mounted) return;

                        setState(() {
                          // _platformVersion = response;
                          isLoading = false;
                        });
                      },
                      child: Text('Affordabilyty Analysis'),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Center(
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
                                            exisitingStatementResponse = value;
                                          }),
                                          // debugPrint(_statementResponseText),
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
                              // _statementResponse = false;
                            });
                          } on Exception catch (e) {
                            isLoading = false;
                            if (kDebugMode) {
                              print(e);
                            }
                            setState(() {
                              // _statementResponse = false;
                              isLoading = false;
                            });
                          }
                        },
                        child: const Text(
                          'Get Transaction analytics',
                        )),
                  ],
                ),
              ),
      ),
    );
  }
}
