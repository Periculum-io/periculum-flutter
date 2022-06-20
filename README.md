# flutter_periculum
<p align="center">
    <img title="Flutterwave" height="200" src="https://www.periculum.io/wp-content/uploads/2020/11/logo1.png" width="50%"/>
</p>

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

#### Required Permission 
The following permission (LOCATION, SMS and WIFI) are required to be requested in the AndroidManifest.xml from the Android device before make the making calling `FlutterPericulum.mobileDataAnalysis` . 

```xml
  <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
  <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
  <uses-permission android:name="android.permission.LOCAL_MAC_ADDRESS" />
  <uses-permission android:name="android.permission.READ_SMS" />
  <uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />
  <uses-permission android:name="android.permission.INTERNET"/> //Internet permission is generally required
```


## Generate Mobile Analysis
```dart
try {
  response = await FlutterPericulum.mobileDataAnalysis(
      phoneNumber: "08023456789",
      bvn: "12345678901",
      token: "Ebter Access token");
  setState(() {
    responseOutput =
        "GenerateMobileAnalysis -> $response"; //Returns a string of Array of mobile Analysis.
  });
} catch (e){
  //handle exception 
}
```

## Generate Affordability 

```dart
AffordabilityResponse response; //returns an AffordabilityResponse object 
try {
  response = await FlutterPericulum.affordabilityAnalysis(
      statementKey: 3,
      dti: 2.0,
      loanTenure: 30,
      averageMonthlyTotalExpenses: 4000, //optional
      averageMonthlyLoanRepaymentAmount: 1000, //optional
      token: "..." [Get token](https://github.com/SteveOye/periculum-flutter/blob/docs_refactor/README.md#authentication)
      );
} on PlatformException {
  response = 'Failed to get platform version.';
}
if (!mounted) return;
```
## Generate Credit Score

###### 
| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `token` | `String` | **required**  [Get token](https://github.com/SteveOye/periculum-flutter/blob/docs_refactor/README.md#authentication) |
| `statementKey` | `String` | **required** |


```dart
CreditScoreResponse response; //returns an CreditScoreResponse object 

try {
  response =
    await FlutterPericulum.generateCreditScore(
    token: "" //get token from authentication,
    statementKey: '125',
  );
} catch (e) {
   //handle exceptions
}
```

## Get Existing Credit Score

###### 
| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `token` | `String` | **required** [Get token](https://github.com/SteveOye/periculum-flutter/blob/docs_refactor/README.md#authentication) |
| `statementKey` | `String` | **required** |

```dart
List<CreditScoreResponse> response; //returns an List<CreditScoreResponse> object 

try {
  response =
    await FlutterPericulum.getExisitingCreditScore(
    token: "", //get token from authentication 
    statementKey: '125',
  );
} catch (e) {
   //handle exceptions
}
```
## Get Statement Transactions
###### 
| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `token` | `String` | **required**  [Get token](https://github.com/SteveOye/periculum-flutter/blob/docs_refactor/README.md#authentication) |
| `statementKey` | `String` | **required** |


```dart
List<Transaction> response; //returns an List<Transaction> object 

try {
  response =
    await FlutterPericulum.getStatementTransaction(
    token: "" //get token from authentication,
    statementKey: '125',
  );
} catch (e) {
   //handle exceptions
}
```

## Get Existing Statement Analytics
###### 
| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `token` | `String` | **required**  [Get token](https://github.com/SteveOye/periculum-flutter/blob/docs_refactor/README.md#authentication) |
| `statementKey` | `String` | **required** |


```dart
StatementResponse response; //returns an StatementResponse object 


try {
  response =
    await FlutterPericulum.getStatementAnalytics(
    token: "" //get token from authentication,
    statementKey: '125',
  );
} catch (e) {
   //handle exceptions
}
```

## Get Existing Statement Affordability Analysis
###### 
| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `token` | `String` | **required** [Get token](https://github.com/SteveOye/periculum-flutter/blob/docs_refactor/README.md#authentication) |
| `statementKey` | `String` | **required** |

```dart
List<AffordabilityResponse> response; //returns an List<AffordabilityResponse> object 

try {
  response =
    await FlutterPericulum.getAffordability(
    token: "" //get token from authentication,
    statementKey: '125',
  );
} catch (e) {
   //handle exceptions
}
```

## Attach Customer Identification Information To A Statement
###### 
| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `token` | `String` | **required**  [Get token](https://github.com/SteveOye/periculum-flutter/blob/docs_refactor/README.md#authentication) |
| `customerIdentificationPayload` | `CustomerIdentificationPayload` | **required** |


```dart
var response; //returns the statusCode
onPressed: () async {
  var data = IdentificationData(
      identifierName: 'bvn', value: '8678');
  var data2 = IdentificationData(
      identifierName: 'nin', value: '8678');
  response = await FlutterPericulum
      .attachCustomerIdentificationInfromation(
          token: "" //get token from authentication,
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

