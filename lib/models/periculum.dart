// To parse this JSON data, do
//
//     final periculum = periculumFromJson(jsonString);

import 'dart:convert';

Periculum periculumFromJson(String str) => Periculum.fromJson(json.decode(str));

String periculumToJson(Periculum data) => json.encode(data.toJson());

class Periculum {
  String appName;
  String bundleId;
  Device device;
  Location location;
  Metadata metadata;
  String publicKey;
  String? overviewkey;
  Sms sms;
  String statementName;
  String version;

  Periculum({
    required this.appName,
    required this.bundleId,
    required this.device,
    required this.location,
    required this.metadata,
    required this.publicKey,
    this.overviewkey,
    required this.sms,
    required this.statementName,
    required this.version,
  });

  factory Periculum.fromJson(Map<String, dynamic> json) => Periculum(
    appName: json["appName"],
    bundleId: json["bundleId"],
    device: Device.fromJson(json["device"]),
    location: Location.fromJson(json["location"]),
    metadata: Metadata.fromJson(json["metadata"]),
    publicKey: json["publicKey"],
    overviewkey: json["overviewkey"],
    sms: Sms.fromJson(json["sms"]),
    statementName: json["statementName"],
    version: json["version"],
  );

  Map<String, dynamic> toJson() => {
    "appName": appName,
    "bundleId": bundleId,
    "device": device.toJson(),
    "location": location.toJson(),
    "metadata": metadata.toJson(),
    "publicKey": publicKey,
    "overviewkey": overviewkey,
    "sms": sms.toJson(),
    "statementName": statementName,
    "version": version,
  };
}

class Device {
  String androidId;
  int apiLevel;
  String baseOs;
  int batteryLevel;
  String brand;
  String buildNumber;
  Camera camera;
  String device;
  String deviceId;
  String deviceName;
  String fingerprint;
  int firstInstallTime;
  bool isTablet;
  String manufacturer;
  String maxMemory;
  Network network;
  String readableVersion;
  String uniqueId;

  Device({
    required this.androidId,
    required this.apiLevel,
    required this.baseOs,
    required this.batteryLevel,
    required this.brand,
    required this.buildNumber,
    required this.camera,
    required this.device,
    required this.deviceId,
    required this.deviceName,
    required this.fingerprint,
    required this.firstInstallTime,
    required this.isTablet,
    required this.manufacturer,
    required this.maxMemory,
    required this.network,
    required this.readableVersion,
    required this.uniqueId,
  });

  factory Device.fromJson(Map<String, dynamic> json) => Device(
    androidId: json["androidId"],
    apiLevel: json["apiLevel"],
    baseOs: json["baseOs"],
    batteryLevel: json["batteryLevel"],
    brand: json["brand"],
    buildNumber: json["buildNumber"],
    camera: Camera.fromJson(json["camera"]),
    device: json["device"],
    deviceId: json["deviceId"],
    deviceName: json["deviceName"],
    fingerprint: json["fingerprint"],
    firstInstallTime: json["firstInstallTime"],
    isTablet: json["isTablet"],
    manufacturer: json["manufacturer"],
    maxMemory: json["maxMemory"],
    network: Network.fromJson(json["network"]),
    readableVersion: json["readableVersion"],
    uniqueId: json["uniqueId"],
  );

  Map<String, dynamic> toJson() => {
    "androidId": androidId,
    "apiLevel": apiLevel,
    "baseOs": baseOs,
    "batteryLevel": batteryLevel,
    "brand": brand,
    "buildNumber": buildNumber,
    "camera": camera.toJson(),
    "device": device,
    "deviceId": deviceId,
    "deviceName": deviceName,
    "fingerprint": fingerprint,
    "firstInstallTime": firstInstallTime,
    "isTablet": isTablet,
    "manufacturer": manufacturer,
    "maxMemory": maxMemory,
    "network": network.toJson(),
    "readableVersion": readableVersion,
    "uniqueId": uniqueId,
  };
}

class Camera {
  bool isCameraPresent;

  Camera({
    required this.isCameraPresent,
  });

  factory Camera.fromJson(Map<String, dynamic> json) => Camera(
    isCameraPresent: json["isCameraPresent"],
  );

  Map<String, dynamic> toJson() => {
    "isCameraPresent": isCameraPresent,
  };
}

class Network {
  String carrier;
  String ip;
  String macAddress;

  Network({
    required this.carrier,
    required this.ip,
    required this.macAddress,
  });

  factory Network.fromJson(Map<String, dynamic> json) => Network(
    carrier: json["carrier"],
    ip: json["ip"],
    macAddress: json["macAddress"],
  );

  Map<String, dynamic> toJson() => {
    "carrier": carrier,
    "ip": ip,
    "macAddress": macAddress,
  };
}

class Location {
  num accuracy;
  num altitude;
  num bearing;
  double latitude;
  double longitude;
  String provider;
  num speed;
  num time;

  Location({
    required this.accuracy,
    required this.altitude,
    required this.bearing,
    required this.latitude,
    required this.longitude,
    required this.provider,
    required this.speed,
    required this.time,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    accuracy: json["accuracy"],
    altitude: json["altitude"],
    bearing: json["bearing"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    provider: json["provider"],
    speed: json["speed"],
    time: json["time"],
  );

  Map<String, dynamic> toJson() => {
    "accuracy": accuracy,
    "altitude": altitude,
    "bearing": bearing,
    "latitude": latitude,
    "longitude": longitude,
    "provider": provider,
    "speed": speed,
    "time": time,
  };
}

class Metadata {
  Customer customer;

  Metadata({
    required this.customer,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
    customer: Customer.fromJson(json["customer"]),
  );

  Map<String, dynamic> toJson() => {
    "customer": customer.toJson(),
  };
}

class Customer {
  String bvn;
  String phoneNumber;

  Customer({
    required this.bvn,
    required this.phoneNumber,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    bvn: json["bvn"],
    phoneNumber: json["phoneNumber"],
  );

  Map<String, dynamic> toJson() => {
    "bvn": bvn,
    "phoneNumber": phoneNumber,
  };
}

class Sms {
  int count;
  List<Datum> data;

  Sms({
    required this.count,
    required this.data,
  });

  factory Sms.fromJson(Map<String, dynamic> json) => Sms(
    count: json["count"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  String address;
  int announcementsSubtype;
  int appId;
  String body;
  Creator creator;
  int dRptCnt;
  int date;
  int dateSent;
  int deletable;
  String errorCode;
  int favorite;
  int hidden;
  String locked;
  int msgId;
  int pri;
  String protocol;
  String read;
  String replyPathPresent;
  int reserved;
  int roamPending;
  int safeMessage;
  int secretMode;
  String seen;
  SimImsi simImsi;
  int simSlot;
  int spamReport;
  String status;
  String subId;
  int svcCmd;
  int teleserviceId;
  String threadId;
  String type;
  int usingMode;

  Datum({
    required this.id,
    required this.address,
    required this.announcementsSubtype,
    required this.appId,
    required this.body,
    required this.creator,
    required this.dRptCnt,
    required this.date,
    required this.dateSent,
    required this.deletable,
    required this.errorCode,
    required this.favorite,
    required this.hidden,
    required this.locked,
    required this.msgId,
    required this.pri,
    required this.protocol,
    required this.read,
    required this.replyPathPresent,
    required this.reserved,
    required this.roamPending,
    required this.safeMessage,
    required this.secretMode,
    required this.seen,
    required this.simImsi,
    required this.simSlot,
    required this.spamReport,
    required this.status,
    required this.subId,
    required this.svcCmd,
    required this.teleserviceId,
    required this.threadId,
    required this.type,
    required this.usingMode,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    address: json["address"],
    announcementsSubtype: json["announcements_subtype"],
    appId: json["app_id"],
    body: json["body"],
    creator: creatorValues.map[json["creator"]]!,
    dRptCnt: json["d_rpt_cnt"],
    date: json["date"],
    dateSent: json["date_sent"],
    deletable: json["deletable"],
    errorCode: json["error_code"],
    favorite: json["favorite"],
    hidden: json["hidden"],
    locked: json["locked"],
    msgId: json["msg_id"],
    pri: json["pri"],
    protocol: json["protocol"],
    read: json["read"],
    replyPathPresent: json["reply_path_present"],
    reserved: json["reserved"],
    roamPending: json["roam_pending"],
    safeMessage: json["safe_message"],
    secretMode: json["secret_mode"],
    seen: json["seen"],
    simImsi: simImsiValues.map[json["sim_imsi"]]!,
    simSlot: json["sim_slot"],
    spamReport: json["spam_report"],
    status: json["status"],
    subId: json["sub_id"],
    svcCmd: json["svc_cmd"],
    teleserviceId: json["teleservice_id"],
    threadId: json["thread_id"],
    type: json["type"],
    usingMode: json["using_mode"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "address": address,
    "announcements_subtype": announcementsSubtype,
    "app_id": appId,
    "body": body,
    "creator": creatorValues.reverse[creator],
    "d_rpt_cnt": dRptCnt,
    "date": date,
    "date_sent": dateSent,
    "deletable": deletable,
    "error_code": errorCode,
    "favorite": favorite,
    "hidden": hidden,
    "locked": locked,
    "msg_id": msgId,
    "pri": pri,
    "protocol": protocol,
    "read": read,
    "reply_path_present": replyPathPresent,
    "reserved": reserved,
    "roam_pending": roamPending,
    "safe_message": safeMessage,
    "secret_mode": secretMode,
    "seen": seen,
    "sim_imsi": simImsiValues.reverse[simImsi],
    "sim_slot": simSlot,
    "spam_report": spamReport,
    "status": status,
    "sub_id": subId,
    "svc_cmd": svcCmd,
    "teleservice_id": teleserviceId,
    "thread_id": threadId,
    "type": type,
    "using_mode": usingMode,
  };
}

enum Creator {
  COM_GOOGLE_ANDROID_APPS_MESSAGING
}

final creatorValues = EnumValues({
  "com.google.android.apps.messaging": Creator.COM_GOOGLE_ANDROID_APPS_MESSAGING
});

enum SimImsi {
  EMPTY
}

final simImsiValues = EnumValues({
  " ": SimImsi.EMPTY
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
