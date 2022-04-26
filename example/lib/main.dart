import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
  bool _response = false;
  bool _statementResponse = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const token = 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6Ik1VSkJOVUk0UkRFek9FVTBORGd4UWpVMVJqTTJPVEJEUXpRMFF6bEJRa1F6UWpnd1JETkVSQSJ9.eyJodHRwczovL2luc2lnaHRzLXBlcmljdWx1bS5jb20vdGVuYW50IjoibnVjbGV1c2lzIiwiaXNzIjoiaHR0cHM6Ly9wZXJpY3VsdW0tdGVjaG5vbG9naWVzLWluYy5hdXRoMC5jb20vIiwic3ViIjoiSDR1VHJzdjJoMGlEVGlTMDR2NmVGWmNpdTNLMGJvWnJAY2xpZW50cyIsImF1ZCI6Imh0dHBzOi8vYXBpLmluc2lnaHRzLXBlcmljdWx1bS5jb20iLCJpYXQiOjE2NTA5MTQ2NzksImV4cCI6MTY1MTUxOTQ3OSwiYXpwIjoiSDR1VHJzdjJoMGlEVGlTMDR2NmVGWmNpdTNLMGJvWnIiLCJndHkiOiJjbGllbnQtY3JlZGVudGlhbHMifQ.X6i4rNvo21ycR4l8Vbdovkyhc7lBYEdQ3zOzexOLO00XfcTO08wihZXuCHESCuYWxej39FLgNvoYINIqenRTEJkkyWR08KC_ONDUXpYvmJivFfmMzaBcDv4J9UvPxb0den-LMT-dfbAiwqQGXL1DadAo3nMHuzUFVpeLcJZ4lqQplulLPKuq9Mbsjfe4XC3Y6pm0sBd-0KI_MMYEBKHIw9U_arR_wf7GmcD3R_DZ-kzOwvmknu4VkmhGlAgzrZqq2uHUXzHBUOY99i_P2PktB5Ty7d9yKksSi5fJgQn6yTbRKghu5keZQ5lwaTfuq5PGovSIF-jDwiFHhf0qT3URsw';
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
                                  "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6Ik1VSkJOVUk0UkRFek9FVTBORGd4UWpVMVJqTTJPVEJEUXpRMFF6bEJRa1F6UWpnd1JETkVSQSJ9.eyJodHRwczovL2luc2lnaHRzLXBlcmljdWx1bS5jb20vdGVuYW50IjoibnVjbGV1c2lzIiwiaXNzIjoiaHR0cHM6Ly9wZXJpY3VsdW0tdGVjaG5vbG9naWVzLWluYy5hdXRoMC5jb20vIiwic3ViIjoiSDR1VHJzdjJoMGlEVGlTMDR2NmVGWmNpdTNLMGJvWnJAY2xpZW50cyIsImF1ZCI6Imh0dHBzOi8vYXBpLmluc2lnaHRzLXBlcmljdWx1bS5jb20iLCJpYXQiOjE2NTA5MTQ2NzksImV4cCI6MTY1MTUxOTQ3OSwiYXpwIjoiSDR1VHJzdjJoMGlEVGlTMDR2NmVGWmNpdTNLMGJvWnIiLCJndHkiOiJjbGllbnQtY3JlZGVudGlhbHMifQ.X6i4rNvo21ycR4l8Vbdovkyhc7lBYEdQ3zOzexOLO00XfcTO08wihZXuCHESCuYWxej39FLgNvoYINIqenRTEJkkyWR08KC_ONDUXpYvmJivFfmMzaBcDv4J9UvPxb0den-LMT-dfbAiwqQGXL1DadAo3nMHuzUFVpeLcJZ4lqQplulLPKuq9Mbsjfe4XC3Y6pm0sBd-0KI_MMYEBKHIw9U_arR_wf7GmcD3R_DZ-kzOwvmknu4VkmhGlAgzrZqq2uHUXzHBUOY99i_P2PktB5Ty7d9yKksSi5fJgQn6yTbRKghu5keZQ5lwaTfuq5PGovSIF-jDwiFHhf0qT3URsw");
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
                          response = await FlutterPericulum.affordabilityAnalysis(
                              statementKey: 3,
                              dti: 2.0,
                              loanTenure: 30,
                              averageMonthlyTotalExpenses: 4000,
                              averageMonthlyLoanRepaymentAmount: 1000,
                              token:
                                  "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6Ik1VSkJOVUk0UkRFek9FVTBORGd4UWpVMVJqTTJPVEJEUXpRMFF6bEJRa1F6UWpnd1JETkVSQSJ9.eyJodHRwczovL2luc2lnaHRzLXBlcmljdWx1bS5jb20vdGVuYW50IjoibnVjbGV1c2lzIiwiaXNzIjoiaHR0cHM6Ly9wZXJpY3VsdW0tdGVjaG5vbG9naWVzLWluYy5hdXRoMC5jb20vIiwic3ViIjoiSDR1VHJzdjJoMGlEVGlTMDR2NmVGWmNpdTNLMGJvWnJAY2xpZW50cyIsImF1ZCI6Imh0dHBzOi8vYXBpLmluc2lnaHRzLXBlcmljdWx1bS5jb20iLCJpYXQiOjE2NTA5MTQ2NzksImV4cCI6MTY1MTUxOTQ3OSwiYXpwIjoiSDR1VHJzdjJoMGlEVGlTMDR2NmVGWmNpdTNLMGJvWnIiLCJndHkiOiJjbGllbnQtY3JlZGVudGlhbHMifQ.X6i4rNvo21ycR4l8Vbdovkyhc7lBYEdQ3zOzexOLO00XfcTO08wihZXuCHESCuYWxej39FLgNvoYINIqenRTEJkkyWR08KC_ONDUXpYvmJivFfmMzaBcDv4J9UvPxb0den-LMT-dfbAiwqQGXL1DadAo3nMHuzUFVpeLcJZ4lqQplulLPKuq9Mbsjfe4XC3Y6pm0sBd-0KI_MMYEBKHIw9U_arR_wf7GmcD3R_DZ-kzOwvmknu4VkmhGlAgzrZqq2uHUXzHBUOY99i_P2PktB5Ty7d9yKksSi5fJgQn6yTbRKghu5keZQ5lwaTfuq5PGovSIF-jDwiFHhf0qT3URsw");
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
                    const SizedBox(
                      height: 10.0,
                    ),
                    Center(
                      child: Text('Running on: $_platformVersion\n'),
                    ),
                    TextButton(
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });
                          var response;
                          try {
                            response = await FlutterPericulum.statementAnalytics(
                                token:
                                "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6Ik1VSkJOVUk0UkRFek9FVTBORGd4UWpVMVJqTTJPVEJEUXpRMFF6bEJRa1F6UWpnd1JETkVSQSJ9.eyJodHRwczovL2luc2lnaHRzLXBlcmljdWx1bS5jb20vdGVuYW50IjoibnVjbGV1c2lzIiwiaXNzIjoiaHR0cHM6Ly9wZXJpY3VsdW0tdGVjaG5vbG9naWVzLWluYy5hdXRoMC5jb20vIiwic3ViIjoiSDR1VHJzdjJoMGlEVGlTMDR2NmVGWmNpdTNLMGJvWnJAY2xpZW50cyIsImF1ZCI6Imh0dHBzOi8vYXBpLmluc2lnaHRzLXBlcmljdWx1bS5jb20iLCJpYXQiOjE2NTA5MTQ2NzksImV4cCI6MTY1MTUxOTQ3OSwiYXpwIjoiSDR1VHJzdjJoMGlEVGlTMDR2NmVGWmNpdTNLMGJvWnIiLCJndHkiOiJjbGllbnQtY3JlZGVudGlhbHMifQ.X6i4rNvo21ycR4l8Vbdovkyhc7lBYEdQ3zOzexOLO00XfcTO08wihZXuCHESCuYWxej39FLgNvoYINIqenRTEJkkyWR08KC_ONDUXpYvmJivFfmMzaBcDv4J9UvPxb0den-LMT-dfbAiwqQGXL1DadAo3nMHuzUFVpeLcJZ4lqQplulLPKuq9Mbsjfe4XC3Y6pm0sBd-0KI_MMYEBKHIw9U_arR_wf7GmcD3R_DZ-kzOwvmknu4VkmhGlAgzrZqq2uHUXzHBUOY99i_P2PktB5Ty7d9yKksSi5fJgQn6yTbRKghu5keZQ5lwaTfuq5PGovSIF-jDwiFHhf0qT3URsw")
                                .then((value) => {
                                      setState(() {
                                        isLoading = false;
                                        setState(() {
                                          _response = true;
                                        });
                                      }),
                                      debugPrint(value.toString()),
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
                    Text("Get statement: $_response"),
                    TextButton(
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });
                          var response;
                          try {
                            response =
                                await FlutterPericulum.statementTransaction(token: "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6Ik1VSkJOVUk0UkRFek9FVTBORGd4UWpVMVJqTTJPVEJEUXpRMFF6bEJRa1F6UWpnd1JETkVSQSJ9.eyJodHRwczovL2luc2lnaHRzLXBlcmljdWx1bS5jb20vdGVuYW50IjoibnVjbGV1c2lzIiwiaXNzIjoiaHR0cHM6Ly9wZXJpY3VsdW0tdGVjaG5vbG9naWVzLWluYy5hdXRoMC5jb20vIiwic3ViIjoiSDR1VHJzdjJoMGlEVGlTMDR2NmVGWmNpdTNLMGJvWnJAY2xpZW50cyIsImF1ZCI6Imh0dHBzOi8vYXBpLmluc2lnaHRzLXBlcmljdWx1bS5jb20iLCJpYXQiOjE2NTA5MTQ2NzksImV4cCI6MTY1MTUxOTQ3OSwiYXpwIjoiSDR1VHJzdjJoMGlEVGlTMDR2NmVGWmNpdTNLMGJvWnIiLCJndHkiOiJjbGllbnQtY3JlZGVudGlhbHMifQ.X6i4rNvo21ycR4l8Vbdovkyhc7lBYEdQ3zOzexOLO00XfcTO08wihZXuCHESCuYWxej39FLgNvoYINIqenRTEJkkyWR08KC_ONDUXpYvmJivFfmMzaBcDv4J9UvPxb0den-LMT-dfbAiwqQGXL1DadAo3nMHuzUFVpeLcJZ4lqQplulLPKuq9Mbsjfe4XC3Y6pm0sBd-0KI_MMYEBKHIw9U_arR_wf7GmcD3R_DZ-kzOwvmknu4VkmhGlAgzrZqq2uHUXzHBUOY99i_P2PktB5Ty7d9yKksSi5fJgQn6yTbRKghu5keZQ5lwaTfuq5PGovSIF-jDwiFHhf0qT3URsw", key: "120").then((value) => {
                                      setState(() {
                                        isLoading = false;
                                        setState(() {
                                          _statementResponse = true;
                                        });
                                      }),
                                      debugPrint(value.toString()),
                                    });
                          } on PlatformException {
                            setState(() {
                              isLoading = false;
                              _statementResponse = false;
                            });
                          } on Exception catch (e) {
                            if (kDebugMode) {
                              print(e);
                            }
                            setState(() {
                              _statementResponse = false;
                              isLoading = false;
                            });
                          }
                        },
                        child: const Text(
                          'Get Exisiting statement transaction analytics',
                        )),
                    Text("Get statement Transcation: $_statementResponse"),
                  ],
                ),
              ),
      ),
    );
  }

}
