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
                                  "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6Ik1VSkJOVUk0UkRFek9FVTBORGd4UWpVMVJqTTJPVEJEUXpRMFF6bEJRa1F6UWpnd1JETkVSQSJ9.eyJodHRwczovL2luc2lnaHRzLXBlcmljdWx1bS5jb20vdGVuYW50IjoibnVjbGV1c2lzIiwiaXNzIjoiaHR0cHM6Ly9wZXJpY3VsdW0tdGVjaG5vbG9naWVzLWluYy5hdXRoMC5jb20vIiwic3ViIjoiSDR1VHJzdjJoMGlEVGlTMDR2NmVGWmNpdTNLMGJvWnJAY2xpZW50cyIsImF1ZCI6Imh0dHBzOi8vYXBpLmluc2lnaHRzLXBlcmljdWx1bS5jb20iLCJpYXQiOjE2NDQ4Mzg0NjIsImV4cCI6MTY0NTQ0MzI2MiwiYXpwIjoiSDR1VHJzdjJoMGlEVGlTMDR2NmVGWmNpdTNLMGJvWnIiLCJndHkiOiJjbGllbnQtY3JlZGVudGlhbHMifQ.dhw4Nb86pea3qycjsYBS090lcIElyxoPY4IuJGx_jZ7zJ3I-TYugNIiDZPD0UyhCAVktNO6YS69cuBpDOr_Uy73tmOTx0Yb0Qhuqj3hUOZbSUs5hIsEluvNSgK8re64H9nkz9xEMex2gYLXA-d1esXhjIUQDqupbHKblKA_SKgxd5vhQRkQgoVgTQHzBHLCIa2LyVhhTaa-N84jDq61luGYV_fP2PPg97S4Sw6xx7q98zGf_zOvVZi75-Kj6pFQiZtdPSw8FFWrDtfSV7XcGVxGe9od0TFjEIrmqA3r4U92rGuEmY0E9nZetreKyzadEHtfhU5ruC9DrgJg_6OzWQA");
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
                              token:
                                  "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6Ik1VSkJOVUk0UkRFek9FVTBORGd4UWpVMVJqTTJPVEJEUXpRMFF6bEJRa1F6UWpnd1JETkVSQSJ9.eyJodHRwczovL2luc2lnaHRzLXBlcmljdWx1bS5jb20vdGVuYW50IjoibnVjbGV1c2lzIiwiaXNzIjoiaHR0cHM6Ly9wZXJpY3VsdW0tdGVjaG5vbG9naWVzLWluYy5hdXRoMC5jb20vIiwic3ViIjoiSDR1VHJzdjJoMGlEVGlTMDR2NmVGWmNpdTNLMGJvWnJAY2xpZW50cyIsImF1ZCI6Imh0dHBzOi8vYXBpLmluc2lnaHRzLXBlcmljdWx1bS5jb20iLCJpYXQiOjE2NDQ0OTIyMTMsImV4cCI6MTY0NTA5NzAxMywiYXpwIjoiSDR1VHJzdjJoMGlEVGlTMDR2NmVGWmNpdTNLMGJvWnIiLCJndHkiOiJjbGllbnQtY3JlZGVudGlhbHMifQ.dnNsmnRr7EdvG_D65UW8JJb8ISvSVzKHMKAFMFglvNcpxYK33BHj85VWXwrJ0Z_n-qqlX84KX4kz4kHki7aBj5_dYgCn02EnHMZab_pNiKGcqWixo1_Rl5z3cLnxl1B8OzSyDsu9R8ulcUR4-ixr5DDAiWNS7_VNhvbZAQ8R8MnwgFtH1wx1q2OTJwhrVB0HkJoqu5cIWZ8B9l4UimplfJnYsrimOfAqyX1w6ohofmWI347wt2oP_xiyt-m7fDR8BdufOb4nHKlbZmM-U-roAJ0TfoPDZeeg5ltpnkvnZj0cTf-OXSpWdWkFVausnH9xVDNfwqxN6O7emBAq48W6JQ");
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
