import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_insights/flutter_insights.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoading = false;
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
                              publicKey: 'insert',
                              bvn: 'insert',
                              phoneNumber: 'insert',
                            );
                            setState(() {
                              responseOutput = flutterPericulum.toString();
                            });
                          } catch (e) {
                            rethrow;
                          }
                        },
                        child: const Text('Mobile Analysis V1'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          try {
                            var flutterPericulum =
                                await FlutterPericulum.generateMobileInsightV2(
                              publicKey: 'insert',
                              bvn: 'insert',
                              phoneNumber: 'insert',
                            );

                            setState(() {
                              responseOutput = flutterPericulum.toString();
                            });
                          } on Exception catch (_) {
                            rethrow;
                          }
                        },
                        child: const Text('Mobile Analysis V2'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          try {
                            var flutterPericulum =
                                await FlutterPericulum.patchMobileAnalysisV2(
                              publicKey: 'insert',
                              overviewkey: 'insert',
                              bvn: 'insert',
                              phoneNumber: 'insert',
                            );

                            setState(() {
                              responseOutput = flutterPericulum.toString();
                            });
                          } on Exception catch (e) {
                            log(e.toString());
                            // throw e.toString();
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
