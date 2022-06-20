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
## Authentication

Your app must first identify and authorize itself against an authorization server by getting an access token before using any of Insights endpoints. For security concerns, make sure that the entire process of obtaining a token takes place on a remote server. So, once you've gotten the token from your server, you can utilize it to get analytics or affordability information by giving it into the token parameter.

To authenticate against the authorization server, make sure you have Periculum's client id and client secret. Your app will not be able to receive an access token and call endpoints on the Insights API without these. If you have not received your client id or client secret, please contact Periculum's usual support channel (email support@periculum.io).

Visit https://www.periculum.io/documentation/insights/#authenticationrequest for further information. 

![Authorization process](https://github.com/AshaluwalaKazeem/Periculum/blob/master/auth.png)

1. Customer phone app authenticates with customer backend server.
2. Customer backend server should return a valid access token. 
...2a. If the customer backend server has not obtained an access token, then it should make a call with the customer's client credentials to the authorization server and obtain an access token. 
...2ai. The customer backend server should cache the access token. 
...2b. If the customer backend server has an existing cached access token that has not expired, then it should return the cached token. 
...2bi. If the customer access token is near expiry (5-15 minutes before expiry), then it should obtain a new access token with its client credentials.
3. The access token is either retrieved from the authorization server or the cache.
4. The customer backend server returns the access token to the customer's mobile app.
5. The customer's mobile app can now make an SDK call to submit mobile phone data using the access token.
6. The SDK method will call the Insights API with the access token.
   7 & 8. Insights API will validate the token.
9. Insights API will return the response to the SDK method.
10. The SDK method will return the response back to the customer mobile app.


#### Required Permission 
The following permission (LOCATION, SMS and WIFI) are required to be requested in the AndroidManifest.xml from the Android device before calling method of the package. 

```xml
  <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
  <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
  <uses-permission android:name="android.permission.LOCAL_MAC_ADDRESS" />
  <uses-permission android:name="android.permission.READ_SMS" />
  <uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />
  <uses-permission android:name="android.permission.INTERNET"/> 
```


## Generate Mobile Analysis for Version 1 of the SDK

###### 
| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `publicKey` | `String` | **required**  |
| `phoneNumber` | `String` | **required** |
| `bvn` | `String` | **required** |

Returns a list of key 

```dart 
var flutterPericulum =
          await FlutterPericulum.generateMobileAnalysis(
        publicKey: 'publicKey',
        bvn: '1234567890123',
        phoneNumber: '090********',
      );
```

## Generate Mobile Insight for Version 2 of the SDK

Returns a Json String contain //{ "mobileInsightsOverviewKey": 6}
###### 
| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `publicKey` | `String` | **required**  |
| `phoneNumber` | `String` | **required** |
| `bvn` | `String` | **required** |

```dart 
var flutterPericulum =
          await FlutterPericulum.generateMobileInsightV2(
        publicKey: 'publicKey',
        bvn: '1234567890123',
        phoneNumber: '090********',
      );
```

## Update an existing Mobile Analysis for Version 2 of the SDK


Returns a Json Object carrying ```OverviewKey``mobileInsightsOverviewKey 
###### 
| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `publicKey` | `String` | **required**  |
| `phoneNumber` | `String` | **optional** |
| `bvn` | `String` | **optional** |

```dart
var flutterPericulum =
          await FlutterPericulum.patchMobileAnalysisV2(
        publicKey: 'publickKey',
        overviewkey: 'overviewKey',
        bvn: '12345678908765',
        phoneNumber: '090********');
```


```dart
 ElevatedButton(
  onPressed: () async {
    try {
      var flutterPericulum =
          await FlutterPericulum.generateMobileInsightV2(
        publicKey: 'nucleusis123',
        bvn: '344983985053053',
        phoneNumber: '09098983930',
  
      setState(() {
        responseOutput = flutterPericulum;
      });
    } on Exception catch (e) {
      throw e.toString();
    }
  },
  child: const Text('Mobile Analysis V2'),
),
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

