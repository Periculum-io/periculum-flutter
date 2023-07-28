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

Returns a PericulumResponse 

```dart 
var flutterPericulum =
          await FlutterPericulum.generateMobileAnalysis(
        publicKey: 'publicKey',
        bvn: '1234567890123',
        phoneNumber: '090********',
      );
```

## Return type of PericulumResponse

```dart 
{
   "insightKey":"mobileInsightKey", //num
   "statusCode":"statusCode", //num
   "status":"status", //bool
   "message":"message" // string
}
```

## Generate Mobile Insight for Version 2 of the SDK

Returns a PericulumResponse
###### 
| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `publicKey` | `String` | **required**  |
| `phoneNumber` | `String` | **required** |
| `bvn` | `String` | **required** |

```dart
//return type of PericulumResponse 
PericulumResponse flutterPericulum =
          await FlutterPericulum.generateMobileInsightV2(
        publicKey: 'publicKey',
        bvn: '1234567890123',
        phoneNumber: '090********',
      );
```

## Update an existing Mobile Analysis for Version 2 of the SDK


Returns a Json Object carrying ```PericulumResponse``mobileInsightsOverviewKey 
###### 
| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `publicKey` | `String` | **required**  |
| `phoneNumber` | `String` | **optional** |
| `bvn` | `String` | **optional** |

```dart
//return type of PericulumResponse 
PericulumResponse flutterPericulum =
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

