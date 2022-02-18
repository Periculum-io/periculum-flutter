import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_periculum/flutter_periculum.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _mobileData = 'Unknown';
  String _platformVersion = 'Unknown';
  bool isLoading = false;

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
                              token:
                                  "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6Ik1VSkJOVUk0UkRFek9FVTBORGd4UWpVMVJqTTJPVEJEUXpRMFF6bEJRa1F6UWpnd1JETkVSQSJ9.eyJodHRwczovL2luc2lnaHRzLXBlcmljdWx1bS5jb20vdGVuYW50IjoibnVjbGV1c2lzIiwiaXNzIjoiaHR0cHM6Ly9wZXJpY3VsdW0tdGVjaG5vbG9naWVzLWluYy5hdXRoMC5jb20vIiwic3ViIjoiSDR1VHJzdjJoMGlEVGlTMDR2NmVGWmNpdTNLMGJvWnJAY2xpZW50cyIsImF1ZCI6Imh0dHBzOi8vYXBpLmluc2lnaHRzLXBlcmljdWx1bS5jb20iLCJpYXQiOjE2NDUxNzI4MjAsImV4cCI6MTY0NTc3NzYyMCwiYXpwIjoiSDR1VHJzdjJoMGlEVGlTMDR2NmVGWmNpdTNLMGJvWnIiLCJndHkiOiJjbGllbnQtY3JlZGVudGlhbHMifQ.V-lS3WBeB3nkaw2SUT_zYn3vEzx5s2jtLn5PnFD2RHov02MCSewD1ZJzDD9w8UUT0yKHNGwT8jov4twla0RI9gJx64qHSoyAky6uzeeCRDhQAJ9NsiEkqgAFL8xSERsww6bZU2-PaXOpGZ0altf2XEW3duYrvDkfh2W_xIdzfzIHH6wQvnym07xWPVcRSniWfGkqRW1g8TLrWeru493OI_pczAP3FSJ_hjma-eZohIr750O1avsPDAkmiO4r0jxtewzgVsGZRCetuTDi0Y0d8wdXZ__Q2pzc7tdNWDl8tP2jnZ4VHYktbNz3cFK_P7JZxGhIGXKnMuyPa4XM0CTj5w");
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
                    SizedBox(
                      height: 10.0,
                    ),
                    Center(
                      child: Text('Running on: $_mobileData\n'),
                    ),
                    SizedBox(
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
                          response = await FlutterPericulum.affordabilityAnalysis(
                              statementKey: 3,
                              dti: 2.0,
                              loanTenure: 30,
                              averageMonthlyTotalExpenses: 4000,
                              averageMonthlyLoanRepaymentAmount: 1000,
                              token:
                                  "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6Ik1VSkJOVUk0UkRFek9FVTBORGd4UWpVMVJqTTJPVEJEUXpRMFF6bEJRa1F6UWpnd1JETkVSQSJ9.eyJodHRwczovL2luc2lnaHRzLXBlcmljdWx1bS5jb20vdGVuYW50IjoibnVjbGV1c2lzIiwiaXNzIjoiaHR0cHM6Ly9wZXJpY3VsdW0tdGVjaG5vbG9naWVzLWluYy5hdXRoMC5jb20vIiwic3ViIjoiSDR1VHJzdjJoMGlEVGlTMDR2NmVGWmNpdTNLMGJvWnJAY2xpZW50cyIsImF1ZCI6Imh0dHBzOi8vYXBpLmluc2lnaHRzLXBlcmljdWx1bS5jb20iLCJpYXQiOjE2NDUxNzI4MjAsImV4cCI6MTY0NTc3NzYyMCwiYXpwIjoiSDR1VHJzdjJoMGlEVGlTMDR2NmVGWmNpdTNLMGJvWnIiLCJndHkiOiJjbGllbnQtY3JlZGVudGlhbHMifQ.V-lS3WBeB3nkaw2SUT_zYn3vEzx5s2jtLn5PnFD2RHov02MCSewD1ZJzDD9w8UUT0yKHNGwT8jov4twla0RI9gJx64qHSoyAky6uzeeCRDhQAJ9NsiEkqgAFL8xSERsww6bZU2-PaXOpGZ0altf2XEW3duYrvDkfh2W_xIdzfzIHH6wQvnym07xWPVcRSniWfGkqRW1g8TLrWeru493OI_pczAP3FSJ_hjma-eZohIr750O1avsPDAkmiO4r0jxtewzgVsGZRCetuTDi0Y0d8wdXZ__Q2pzc7tdNWDl8tP2jnZ4VHYktbNz3cFK_P7JZxGhIGXKnMuyPa4XM0CTj5w");
                        } on PlatformException {
                          setState(() {
                            _mobileData = response;
                            isLoading = false;
                          });
                        }

                        if (!mounted) return;

                        final body = jsonDecode(response.toString());

                        print(body["data"].toString());
                        // print(body["dti"]);

                        setState(() {
                          _platformVersion = response;
                          isLoading = false;
                        });
                      },
                      child: Text('Affordabilyty Analysis'),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Center(
                      child: Text('Running on: $_platformVersion\n'),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
