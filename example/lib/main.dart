import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_periculum/flutter_periculum.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_periculum/models/AffordabilityResponse.dart';
import 'package:flutter_periculum/models/CreditScoreResponse.dart';
import 'package:flutter_periculum/models/StatementResponse.dart';

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
  late StatementResponse statement;
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
            ? CircularProgressIndicator()
            : SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                  ],
                ),
              ),
      ),
    );
  }
}
