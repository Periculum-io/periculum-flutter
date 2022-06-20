package com.periculum.flutter_periculum.models.requests


data class Customer(
    val phoneNumber: String,
    val bvn: String?,
)

data class MetaData(
    var customer: Customer
)

data class Periculum(
    var publicKey: String,
    var statementName: String,
    var device: Device,
    var sms: MainSMS,
    var metadata: MetaData,
    var location: LocationDetails,
    var appName: String = "Periculum",
    var bundleId: String = "com.periculum",
    var version: String = "1.0"
)

data class LocationDetails(
    var accuracy: Double,
    var altitude: Double,
    var bearing: Double,
    var latitude: Double,
    var longitude: Double,
    var provider: String = "fused",
    var speed: Double,
    var time: Long
)

data class Device(
    var device: String,
    var deviceId: String,
    var deviceName: String,
    var firstInstallTime: Long,
    var baseOs: String,
    var apiLevel: Int,
    var androidId: String,
    var batteryLevel: Int,
    var brand:String,
    var buildNumber: String,
    var manufacturer: String,
    var fingerprint: String?,
    var maxMemory: String,
    var readableVersion: String,
    var uniqueId: String,
    var isTablet: Boolean = false,
    var camera: Camera,
    var network: MyNetwork,
)

data class Camera(
    var isCameraPresent: Boolean,
)

data class MyNetwork(
    var carrier: String,
    var ip: String = "0.0.0.0",
    val macAddress: String,
)

data class MainSMS(
    var data: MutableList<SMS>,
    var count: Int,
)

data class SMS(
    val thread_id: String,
    val address: String,
    val date: Long,
    val date_sent: Long,
    val body: String,
    val service_center: String?,
    val creator: String,
    val seen: String,
    val protocol: String,
    val read: String,
    val status: String,
    val type: String,
    val reply_path_present: String,
    val locked: String,
    val error_code: String,
    val sub_id: String,
    val _id: Int?,
    val sim_imsi: String = " ",
    val deletable: Int = 0,
    val sim_slot: Int = 0,
    val hidden: Int = 0,
    val app_id: Int = 0,
    val msg_id: Int = 0,
    val reserved: Int = 0,
    val pri: Int = 0,
    val teleservice_id: Int = 0,
    val svc_cmd: Int = 0,
    val roam_pending: Int = 0,
    val spam_report: Int = 0,
    val secret_mode: Int = 0,
    val safe_message: Int = 0,
    val favorite: Int = 0,
    val d_rpt_cnt: Int = 0,
    val using_mode: Int = 0,
    val announcements_subtype: Int = 0,
)