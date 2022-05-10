import 'dart:convert';

MobileDataAnalysis mobileDataAnalysisFromJson(String str) =>
    MobileDataAnalysis.fromJson(json.decode(str));

String mobileDataAnalysisToJson(MobileDataAnalysis data) =>
    json.encode(data.toJson());

class MobileDataAnalysis {
  MobileDataAnalysis({
    required this.statementName,
    required this.appName,
    required this.bundleId,
    required this.version,
    required this.device,
    required this.sms,
    required this.metadata,
    required this.location,
  });

  String statementName;
  String appName;
  String bundleId;
  String version;
  Device device;
  Sms sms;
  Metadata metadata;
  Location location;

  factory MobileDataAnalysis.fromJson(Map<String, dynamic> json) =>
      MobileDataAnalysis(
        statementName: json["statementName"],
        appName: json["appName"],
        bundleId: json["bundleId"],
        version: json["version"],
        device: Device.fromJson(json["device"]),
        sms: Sms.fromJson(json["sms"]),
        metadata: Metadata.fromJson(json["metadata"]),
        location: Location.fromJson(json["location"]),
      );

  Map<String, dynamic> toJson() => {
        "statementName": statementName,
        "appName": appName,
        "bundleId": bundleId,
        "version": version,
        "device": device.toJson(),
        "sms": sms.toJson(),
        "metadata": metadata.toJson(),
        "location": location.toJson(),
      };
}

class Device {
  Device({
    required this.device,
    required this.deviceId,
    required this.deviceName,
    required this.firstInstallTime,
    required this.baseOs,
    required this.apiLevel,
    required this.androidId,
    required this.batteryLevel,
    required this.brand,
    required this.buildNumber,
    required this.fingerprint,
    required this.manufacturer,
    required this.maxMemory,
    required this.readableVersion,
    required this.uniqueId,
    required this.isTablet,
    required this.camera,
    required this.network,
  });

  String device;
  String deviceId;
  String deviceName;
  int firstInstallTime;
  String baseOs;
  int apiLevel;
  String androidId;
  int batteryLevel;
  String brand;
  int buildNumber;
  dynamic fingerprint;
  String manufacturer;
  int maxMemory;
  String readableVersion;
  String uniqueId;
  bool isTablet;
  Camera camera;
  Network network;

  factory Device.fromJson(Map<String, dynamic> json) => Device(
        device: json["device"],
        deviceId: json["deviceId"],
        deviceName: json["deviceName"],
        firstInstallTime: json["firstInstallTime"],
        baseOs: json["baseOs"],
        apiLevel: json["apiLevel"],
        androidId: json["androidId"],
        batteryLevel: json["batteryLevel"],
        brand: json["brand"],
        buildNumber: json["buildNumber"],
        fingerprint: json["fingerprint"],
        manufacturer: json["manufacturer"],
        maxMemory: json["maxMemory"],
        readableVersion: json["readableVersion"],
        uniqueId: json["uniqueId"],
        isTablet: json["isTablet"],
        camera: Camera.fromJson(json["camera"]),
        network: Network.fromJson(json["network"]),
      );

  Map<String, dynamic> toJson() => {
        "device": device,
        "deviceId": deviceId,
        "deviceName": deviceName,
        "firstInstallTime": firstInstallTime,
        "baseOs": baseOs,
        "apiLevel": apiLevel,
        "androidId": androidId,
        "batteryLevel": batteryLevel,
        "brand": brand,
        "buildNumber": buildNumber,
        "fingerprint": fingerprint,
        "manufacturer": manufacturer,
        "maxMemory": maxMemory,
        "readableVersion": readableVersion,
        "uniqueId": uniqueId,
        "isTablet": isTablet,
        "camera": camera.toJson(),
        "network": network.toJson(),
      };
}

class Camera {
  Camera({
    required this.isCameraPresent,
  });

  bool isCameraPresent;

  factory Camera.fromJson(Map<String, dynamic> json) => Camera(
        isCameraPresent: json["isCameraPresent"],
      );

  Map<String, dynamic> toJson() => {
        "isCameraPresent": isCameraPresent,
      };
}

class Network {
  Network({
    required this.carrier,
    required this.ip,
    required this.macAddress,
  });

  String carrier;
  String ip;
  String macAddress;

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

  int accuracy;
  double altitude;
  int bearing;
  double latitude;
  double longitude;
  String provider;
  int speed;
  int time;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        accuracy: json["accuracy"],
        altitude: json["altitude"].toDouble(),
        bearing: json["bearing"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
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
  Metadata({
    required this.customer,
  });

  Customer customer;

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        customer: Customer.fromJson(json["customer"]),
      );

  Map<String, dynamic> toJson() => {
        "customer": customer.toJson(),
      };
}

class Customer {
  Customer({
    required this.phoneNumber,
    required this.bvn,
  });

  String phoneNumber;
  String bvn;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        phoneNumber: json["phoneNumber"],
        bvn: json["bvn"],
      );

  Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "bvn": bvn,
      };
}

class Sms {
  Sms({
    required this.data,
    required this.count,
  });

  List<Datum> data;
  int count;

  factory Sms.fromJson(Map<String, dynamic> json) => Sms(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "count": count,
      };
}

class Datum {
  Datum({
    required this.id,
    required this.threadId,
    required this.address,
    required this.date,
    required this.dateSent,
    required this.protocol,
    required this.read,
    required this.status,
    required this.type,
    required this.replyPathPresent,
    required this.body,
    required this.serviceCenter,
    required this.locked,
    required this.errorCode,
    required this.subId,
    required this.seen,
    required this.deletable,
    required this.simSlot,
    required this.simImsi,
    required this.hidden,
    required this.appId,
    required this.msgId,
    required this.reserved,
    required this.pri,
    required this.teleserviceId,
    required this.svcCmd,
    required this.roamPending,
    required this.spamReport,
    required this.secretMode,
    required this.safeMessage,
    required this.favorite,
    required this.dRptCnt,
    required this.usingMode,
    required this.announcementsSubtype,
  });

  int id;
  int threadId;
  String address;
  int date;
  int dateSent;
  int protocol;
  int read;
  int status;
  int type;
  int replyPathPresent;
  String body;
  String serviceCenter;
  int locked;
  int errorCode;
  int subId;
  int seen;
  int deletable;
  int simSlot;
  String simImsi;
  int hidden;
  int appId;
  int msgId;
  int reserved;
  int pri;
  int teleserviceId;
  int svcCmd;
  int roamPending;
  int spamReport;
  int secretMode;
  int safeMessage;
  int favorite;
  int dRptCnt;
  int usingMode;
  int announcementsSubtype;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        threadId: json["thread_id"],
        address: json["address"],
        date: json["date"],
        dateSent: json["date_sent"],
        protocol: json["protocol"],
        read: json["read"],
        status: json["status"],
        type: json["type"],
        replyPathPresent: json["reply_path_present"],
        body: json["body"],
        serviceCenter: json["service_center"],
        locked: json["locked"],
        errorCode: json["error_code"],
        subId: json["sub_id"],
        seen: json["seen"],
        deletable: json["deletable"],
        simSlot: json["sim_slot"],
        simImsi: json["sim_imsi"],
        hidden: json["hidden"],
        appId: json["app_id"],
        msgId: json["msg_id"],
        reserved: json["reserved"],
        pri: json["pri"],
        teleserviceId: json["teleservice_id"],
        svcCmd: json["svc_cmd"],
        roamPending: json["roam_pending"],
        spamReport: json["spam_report"],
        secretMode: json["secret_mode"],
        safeMessage: json["safe_message"],
        favorite: json["favorite"],
        dRptCnt: json["d_rpt_cnt"],
        usingMode: json["using_mode"],
        announcementsSubtype: json["announcements_subtype"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "thread_id": threadId,
        "address": address,
        "date": date,
        "date_sent": dateSent,
        "protocol": protocol,
        "read": read,
        "status": status,
        "type": type,
        "reply_path_present": replyPathPresent,
        "body": body,
        "service_center": serviceCenter,
        "locked": locked,
        "error_code": errorCode,
        "sub_id": subId,
        "seen": seen,
        "deletable": deletable,
        "sim_slot": simSlot,
        "sim_imsi": simImsi,
        "hidden": hidden,
        "app_id": appId,
        "msg_id": msgId,
        "reserved": reserved,
        "pri": pri,
        "teleservice_id": teleserviceId,
        "svc_cmd": svcCmd,
        "roam_pending": roamPending,
        "spam_report": spamReport,
        "secret_mode": secretMode,
        "safe_message": safeMessage,
        "favorite": favorite,
        "d_rpt_cnt": dRptCnt,
        "using_mode": usingMode,
        "announcements_subtype": announcementsSubtype,
      };
}
