# flutter_periculum

Periculum Insight Plugin (Flutter)
This plugin allows Flutter apps to generate Mobile Data Analysis and Affordability Analysis.

## Platform Supported
Android

## Installation and usage
1. Add the latest version of the plugin to your pubspec.yaml (and run `pub get`)
dependencies:
    `flutter_periculum: ^0.0.2`

2. Import  the plugin and use it in your flutter App.0

`import 'package:flutter_periculum/flutter_periculum.dart';`

## Example
...dart
```
        AffordabilityResponse response; //returns an AffordabilityResponse object 

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
```
## Generate Credit Score
...dart
```
CreditScoreResponse response; //returns an CreditScoreResponse object 

try {
  response =
    await FlutterPericulum.generateCreditScore(
    token: "${dotenv.env['tokenKey']}",
    statementKey: '125',
  );
} catch (e) {
   log(e.toString());
}
```

## Get Existing Credit Score
...dart
```
List<CreditScoreResponse> response; //returns an List<CreditScoreResponse> object 

try {
  response =
    await FlutterPericulum.getExisitingCreditScore(
    token: "${dotenv.env['tokenKey']}",
    statementKey: '125',
  );
} catch (e) {
   //handle exceptions
}
```
## Get Statement Transactions
...dart
```
List<Transaction> response; //returns an List<Transaction> object 

try {
  response =
    await FlutterPericulum.getStatementTransaction(
    token: "${dotenv.env['tokenKey']}",
    statementKey: '125',
  );
} catch (e) {
   //handle exceptions
}
```

## Get Existing Statement Analytics
...dart
```
StatementResponse response; //returns an StatementResponse object 


try {
  response =
    await FlutterPericulum.getStatementAnalytics(
    token: "${dotenv.env['tokenKey']}",
    statementKey: '125',
  );
} catch (e) {
   //handle exceptions
}
```

## Get Existing Statement Affordability Analysis
...dart
```
List<AffordabilityResponse> response; //returns an List<AffordabilityResponse> object 

try {
  response =
    await FlutterPericulum.getAffordability(
    token: "${dotenv.env['tokenKey']}",
    statementKey: '125',
  );
} catch (e) {
   //handle exceptions
}
```

## Attach Customer Identification Information To A Statement
...dart
```
var response; //returns the statusCode
onPressed: () async {
  var data = IdentificationData(
      identifierName: 'bvn', value: '8678');
  var data2 = IdentificationData(
      identifierName: 'nin', value: '8678');
  response = await FlutterPericulum
      .attachCustomerIdentificationInfromation(
          token: "${dotenv.env['tokenKey']}",
          statementKey: '125',
          customerIdentificationPayload:
              CustomerIdentificationPayload(
                  statementKey: 125,
                  identificationData: [data, data2]));
},
```

...
## Compatibility
Minimum Android SDK: `Periculum requires a minimum API level of 21.`

## Info
For this plugin to work, you must have a Periculum account and you'll also need to use your merchant Id and secret key to generate a token from the Periculum API.


## Getting Started
For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

