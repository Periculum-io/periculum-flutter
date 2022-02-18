# flutter_periculum

Periculum Insight Plugin (Flutter)
This plugin allows Flutter apps to generate Mobile Data Analysis and Affordability Analysis.

## Platform Supported
Android

## Installation and usage
1. Add the latest version of the plugin to your pubspec.yaml (and run `pub get`)
dependencies:
    flutter_periculum: ^0.0.2

2. Import  the plugin and use it in your flutter App.0

import 'package:flutter_periculum/flutter_periculum.dart';

## Example
...dart
var response;

try {

  response = await FlutterPericulum.affordabilityAnalysis(
      statementKey: 3,
      dti: 2.0,
      loanTenure: 30,
      averageMonthlyTotalExpenses: 4000, //optional
      averageMonthlyLoanRepaymentAmount: 1000, //optional
      token: "..."
      );

} on PlatformException {

  response = 'Failed to get platform version.';

}

if (!mounted) return;

final body = jsonDecode(response.toString());
...

## Compatibility
Minimum Android SDK: Periculum requires a minimum API level of 21.

## Info
For this plugin to work, you must have a Periculum account and you'll also need to use your merchant Id and secret key to generate a token from the Periculum API.


## Getting Started
For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

