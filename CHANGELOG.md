## 0.0.1

Initial release
Get Affordabilily Analysis
Get Mobile Data Analysis

## 0.0.2

Updated Affordabilily Analysis to include optional averageMonthlyTotalExpenses and averageMonthlyLoanRepaymentAmount in its payload

## 1.0.0 - 2022-05-16

Update the package with new features:
* Generate Credit Score 
* Get Existing Credit Score
* Get Statement Transaction 
* Get Statement Analysis
* Get Existing Affordabilit Statement
* Add Clients Identification to Statement

## 2.0.0 - 2022-06-20

Update the package with new features:
* Changed authentication to public key
* SDKs are now push data only for both V1 and V2 flows
* V1 generates statement analytics per bank identified from SMS messages
* V2 generates mobile statement analytics
* V1 endpoint returns statement analytics key which can be sent to backend server. The backend server can call Insights with client_credentials flow for the full details.
* V2 endpoint returns mobile statement analytics overview key which can be sent to backend server. The backend server can call Insights with client_credentials flow for all of the V2 data.

## 2.0.1 - 2022-07-27

Update the package with new features:
* Removed the need for location permission
* Push only transactional SMS to insights

## 2.0.3 - 2023-10-27

Added implementation for onDetachedFromActivityForConfigChanges