import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_periculum/flutter_periculum.dart';

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
  bool isLoading = false;
  final bool _response = false;
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
                          try {
                            var flutterPericulum =
                                await FlutterPericulum.generateMobileAnalysisV1(
                              publicKey: 'nucleusis123',
                              bvn: '344983985053053',
                              phoneNumber: '09098983930',
                            );
                            setState(() {
                              responseOutput = flutterPericulum;
                            });
                          } catch (e) {
                            throw e.toString();
                          }
                        },
                        child: const Text('Mobile Analysis V1'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          try {
                            var flutterPericulum =
                                await FlutterPericulum.generateMobileInsightV2(
                              publicKey: 'nucleusis123',
                              bvn: '344983985053053',
                              phoneNumber: '09098983930',
                            );

                            setState(() {
                              responseOutput = flutterPericulum;
                            });
                          } on Exception catch (e) {
                            throw e.toString();
                          }
                        },
                        child: const Text('Mobile Analysis V2'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          try {
                            var flutterPericulum =
                                await FlutterPericulum.patchMobileAnalysisV2(
                              publicKey: 'nucleusis123',
                              overviewkey: '12',
                              bvn: '344983985053053',
                              phoneNumber: '09098983930',
                            );

                            setState(() {
                              responseOutput = flutterPericulum
                                  .mobileInsightsOverviewKey
                                  .toString();
                            });
                          } on Exception catch (e) {
                            throw e.toString();
                          }
                        },
                        child: const Text('Patch Analysis V2'),
                      ),
                      Text("Result: $responseOutput"),
                    ]),
              ),
      ),
    );
  }
}
