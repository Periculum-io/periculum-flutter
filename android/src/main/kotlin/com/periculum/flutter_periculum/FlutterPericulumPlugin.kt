package com.periculum.flutter_periculum

import android.app.Activity
import android.content.Context
import android.content.Context.BATTERY_SERVICE
import android.content.Intent
import android.content.IntentFilter
import android.content.pm.PackageManager
import android.location.Location
import android.net.wifi.WifiManager
import android.os.BatteryManager
import android.os.Build
import android.provider.Settings
import android.provider.Telephony
import android.telephony.TelephonyManager
import android.text.format.Formatter
import android.util.Log
import android.widget.Toast
import androidx.annotation.NonNull
import androidx.annotation.RequiresApi
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import com.google.android.gms.location.FusedLocationProviderClient
import com.google.android.gms.location.LocationServices
import com.google.gson.Gson
import com.periculum.flutter_periculum.models.requests.*
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.async
import kotlinx.coroutines.launch
import okhttp3.*
import okhttp3.MediaType.Companion.toMediaType
import java.io.File
import java.io.IOException
import java.util.*


/** FlutterPericulumPlugin */
class FlutterPericulumPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    lateinit var myplugin: FlutterPericulumPlugin
    lateinit var context: Activity
    lateinit var fusedLocationProviderClient: FusedLocationProviderClient
    private val BASE_URL: String = "https://api.insights-periculum.com/"

    lateinit var periculum: Periculum
    var smsCount = 0

    lateinit var myLocation: LocationDetails
    lateinit var camera: Camera
    lateinit var myNetwork: MyNetwork
    lateinit var myDevice: Device
    var smslist: MutableList<SMS> = mutableListOf<SMS>()
    lateinit var mySmses: MainSMS

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        myplugin = FlutterPericulumPlugin()
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_periculum")
        channel.setMethodCallHandler(this)
    }

    @RequiresApi(Build.VERSION_CODES.KITKAT)
    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        if (call.method == "generateAffordabilityAnalysis") {
            val args = call.arguments as HashMap<String, Any>

            if (args != null) {
                val token = args.get("token")
                val dti = args.get("dti")
                val statementKey = args.get("statementKey")
                val loanTenure = args.get("loanTenure")

                val endpoint = "affordability"

                val url = "$BASE_URL$endpoint"

                val JSON = "application/json; charset=utf-8".toMediaType()
                //Log.d("URL", url)

                //The data I want to send
                val JSONObjectString =
                    "{\"dti\": $dti,\"statementKey\": $statementKey,\"loanTenure\": $loanTenure}"


                //Log.d("PARAMETERS", JSONObjectString)

                var body: RequestBody = RequestBody.create(JSON, JSONObjectString)
                val request = Request.Builder()
                    .addHeader("Authorization", "Bearer $token")
                    .post(body)
                    .url(url)
                    .build()
                val client = OkHttpClient()
                client.newCall(request).enqueue(object : Callback {
                    override fun onResponse(call: Call, response: Response) {
                        val tm = response.body!!.string()
                        //val result = JSONObject(tm)
                        //Log.d("Success", tm)
//                        result.success(hashMapOf(
//                            "status" to true,
//                            "data" to tm
//                        ).toString())

                        result.success(tm)
                    }

                    override fun onFailure(call: Call, e: IOException) {
//                        Log.d("Failed", "FAILED")
//                        e.printStackTrace()
                        //Log.println(Log.DEBUG, "debug", "Permission granted");
                        val error = e.message
                        result.success("{\"title\": \"${error}\"}")
                    }
                })

            }


        } else if (call.method == "generateMobileDataAnalysis") {
            GlobalScope.launch(Dispatchers.IO) {
                if (!isLocationAndReadSMSPermissionGranted()) {
                    async { requestLocationAndReadSMSPermissions() }
                }

                var pCheck = async { isLocationAndReadSMSPermissionGranted() }

                if (pCheck.await()) {

                checkPermissions();

                val args = call.arguments as? HashMap<String, String>
                var statementName: String = ""
                var phoneNumber: String = ""
                var bvn: String = ""
                var token: String = ""

                if (args != null) {
                    statementName =
                        args.getOrElse("statementName") { getStatementName().toString() }
                    token = args.get("token").toString()
                    phoneNumber = args.get("phoneNumber").toString()
                    bvn = args.get("bvn").toString()

                    if (statementName == null || statementName == "null") {
                        statementName = getStatementName().toString()
                    }
                } else {
                    statementName = getStatementName().toString()
                }

                //Log.d("statementName", statementName)

                var customer = Customer(phoneNumber, bvn)
                var mymetadata = MetaData(customer)
                var device = async { getDeviceDetails() }
                var smses = async { getDebitSMSes() }

                var mydevice = device.await()
                var mysms = smses.await()

                fusedLocationProviderClient =
                    LocationServices.getFusedLocationProviderClient(myplugin.context)
                fusedLocationProviderClient.lastLocation.addOnCompleteListener { locTask ->
                    var location: Location = locTask.result

                    if (location != null) {
                        var latitude = locTask.result.latitude
                        var longitude = locTask.result.longitude
                        var accuracy = locTask.result.accuracy.toDouble()
                        var speed = locTask.result.speed.toDouble()
                        var bearing = locTask.result.bearing.toDouble()
                        var altitude = locTask.result.altitude
                        var time = getStatementName()

                        myLocation = LocationDetails(
                            accuracy,
                            altitude,
                            bearing,
                            latitude,
                            longitude,
                            "fused",
                            speed,
                            time)

                        val gson = Gson()

                        periculum =
                            Periculum(statementName,
                                mydevice,
                                mysms,
                                mymetadata,
                                myLocation)

                        val jsonInString: String = gson.toJson(periculum)

                        val endpoint = "mobile/analytics"

                        val url = "$BASE_URL$endpoint"

                        val JSON = "application/json; charset=utf-8".toMediaType()
                        //Log.d("URL", url)

                        //Log.d("PAYLOAD", jsonInString)


                        var body: RequestBody = RequestBody.create(JSON, jsonInString)
                        val request = Request.Builder()
                            .addHeader("Authorization", "Bearer $token")
                            .post(body)
                            .url(url)
                            .build()
                        val client = OkHttpClient()
                        client.newCall(request).enqueue(object : Callback {
                            override fun onResponse(call: Call, response: Response) {
                                val tm = response.body!!.string()
                                //val result = JSONObject(tm)
//                                    Log.d("Success", tm)
//                                    result.success(hashMapOf(
//                                        "status" to false,
//                                        "data" to tm.toString()
//                                    ).toString())
                                result.success(tm)
                            }

                            override fun onFailure(call: Call, e: IOException) {
                                //Log.d("Error", e.message.toString())
                                val error = e.message;
                                result.success("{\"title\": \"${error}\"}")
                            }
                        })

                    } else {
                        result.success("{\"title\": \"Unable to get location details\"}")
                    }
                }

                } else {
                    result.success("{\"title\": \"Unable to get permission\"}")
                }
            }

        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    suspend fun isLocationAndReadSMSPermissionGranted(): Boolean {
        return if (ActivityCompat.checkSelfPermission(
                myplugin.context,
                android.Manifest.permission.ACCESS_COARSE_LOCATION
            ) != PackageManager.PERMISSION_GRANTED && ActivityCompat.checkSelfPermission(
                myplugin.context,
                android.Manifest.permission.ACCESS_FINE_LOCATION
            ) != PackageManager.PERMISSION_GRANTED && ActivityCompat.checkSelfPermission(
                myplugin.context,
                android.Manifest.permission.READ_SMS
            ) != PackageManager.PERMISSION_GRANTED
        ) {
            ActivityCompat.requestPermissions(
                myplugin.context,
                arrayOf(
                    android.Manifest.permission.ACCESS_FINE_LOCATION,
                    android.Manifest.permission.ACCESS_COARSE_LOCATION,
                    android.Manifest.permission.READ_SMS
                ),
                44
            )
            false
        } else {
            true
        }
    }

    suspend fun checkPermissions() {
        when {
            ContextCompat.checkSelfPermission(myplugin.context.applicationContext,
                android.Manifest.permission.ACCESS_COARSE_LOCATION) == PackageManager.PERMISSION_GRANTED && ContextCompat.checkSelfPermission(
                myplugin.context.applicationContext,
                android.Manifest.permission.ACCESS_FINE_LOCATION) == PackageManager.PERMISSION_GRANTED && ContextCompat.checkSelfPermission(
                myplugin.context.applicationContext,
                android.Manifest.permission.READ_SMS) == PackageManager.PERMISSION_GRANTED -> {
            }

            else -> ActivityCompat.requestPermissions(
                myplugin.context,
                arrayOf(
                    android.Manifest.permission.ACCESS_FINE_LOCATION,
                    android.Manifest.permission.ACCESS_COARSE_LOCATION,
                    android.Manifest.permission.READ_SMS
                ),
                44
            )
        }


//        (ActivityCompat.checkSelfPermission(
//                myplugin.context,
//                android.Manifest.permission.ACCESS_COARSE_LOCATION
//            ) != PackageManager.PERMISSION_GRANTED && ActivityCompat.checkSelfPermission(
//                myplugin.context,
//                android.Manifest.permission.ACCESS_FINE_LOCATION
//            ) != PackageManager.PERMISSION_GRANTED && ActivityCompat.checkSelfPermission(
//                myplugin.context,
//                android.Manifest.permission.READ_SMS
//            ) != PackageManager.PERMISSION_GRANTED
//        ) {
//            ActivityCompat.requestPermissions(
//                myplugin.context,
//                arrayOf(
//                    android.Manifest.permission.ACCESS_FINE_LOCATION,
//                    android.Manifest.permission.ACCESS_COARSE_LOCATION,
//                    android.Manifest.permission.READ_SMS
//                ),
//                44
//            )
//            false
//        } else {
//            true
//        }
    }

    suspend fun requestLocationAndReadSMSPermissions() {
        ActivityCompat.requestPermissions(
            myplugin.context,
            arrayOf(
                android.Manifest.permission.ACCESS_FINE_LOCATION,
                android.Manifest.permission.ACCESS_COARSE_LOCATION,
                android.Manifest.permission.READ_SMS
            ),
            44
        )
    }

    suspend fun getLocationDetails(): LocationDetails {
        var latitude = 0.0
        var longitude = 0.0
        var accuracy = 0.0
        var speed = 0.0
        var bearing = 0.0
        var provider: String = "fused"
        var altitude = 0.0
        var time = getStatementName()

        fusedLocationProviderClient =
            LocationServices.getFusedLocationProviderClient(myplugin.context)
        fusedLocationProviderClient.lastLocation.addOnCompleteListener { locTask ->
            var location: Location = locTask.result

            if (location != null) {
                latitude = locTask.result.latitude
                longitude = locTask.result.longitude
                accuracy = locTask.result.accuracy.toDouble()
                speed = locTask.result.speed.toDouble()
                bearing = locTask.result.bearing.toDouble()
                altitude = locTask.result.altitude
                time = getStatementName()

                myLocation = LocationDetails(
                    accuracy,
                    altitude,
                    bearing,
                    latitude,
                    longitude,
                    provider,
                    speed,
                    time)

                return@addOnCompleteListener
                Log.d("Location Here", myLocation.toString())

            } else {
                myLocation = LocationDetails(
                    accuracy,
                    altitude,
                    bearing,
                    latitude,
                    longitude,
                    provider,
                    speed,
                    time)

                return@addOnCompleteListener
                Log.d("Location There", myLocation.toString())
            }
        }
        Log.d("Location Here2", myLocation.toString())
        return myLocation
    }

    suspend fun getDeviceDetails(): Device {
        // try {
        var versionCode = Build.VERSION.RELEASE

        val brand = Build.BRAND
        val deviceId =
            Settings.Secure.getString(
                myplugin.context.getContentResolver(),
                Settings.Secure.ANDROID_ID
            )
        val model = Build.MODEL
        val id = Build.ID
        val sdk = Build.VERSION.SDK_INT
        val manufacture = Build.MANUFACTURER
//            val user = Build.USER
//            val type = Build.TYPE
//            val base = Build.VERSION_CODES.BASE
//            val incremental = Build.VERSION.INCREMENTAL
//            val board = Build.BOARD
//            val host = Build.HOST
        val fingerPrint = Build.FINGERPRINT
//            val os = Build.VERSION.SDK
        val device = Build.DEVICE
        // val androidID = Settings.Secure.ANDROID_ID
        val maxMemory = Runtime.getRuntime().totalMemory()
        var isTablet = false
        val baseOs = "Android"
        val firstInstallTime = getStatementName()
        val readableVersion = "1.0.1"


        val batlevel = getBatteryLevel()

        var pm: PackageManager = myplugin.context.packageManager
        val cameraState = pm.hasSystemFeature(PackageManager.FEATURE_CAMERA_ANY)
        camera = Camera(cameraState)

        var cmgr: TelephonyManager =
            (myplugin.context.getSystemService(Context.TELEPHONY_SERVICE) as TelephonyManager)
        val carrierName = cmgr.getNetworkOperatorName()

        if (Objects.requireNonNull(cmgr).phoneType == TelephonyManager.PHONE_TYPE_NONE) {
            isTablet = true
        }

        val nmgr: WifiManager = (myplugin.context.getApplicationContext()
            .getSystemService(Context.WIFI_SERVICE) as WifiManager)
        val macAddress = nmgr.connectionInfo.macAddress

        val ipAddress = Formatter.formatIpAddress(nmgr.connectionInfo.ipAddress)

        myNetwork = MyNetwork(carrierName, ipAddress, macAddress)

        myDevice = Device(device,
            deviceId,
            model,
            firstInstallTime,
            baseOs,
            sdk,
            id,
            batlevel,
            brand,
            versionCode,
            manufacture,
            fingerPrint,
            maxMemory.toString(),
            readableVersion,
            id,
            isTablet,
            camera,
            myNetwork)


        //Log.d("MY_DEVICE", myDevice.toString())
//            Log.d("MY_DEVICE",
//                "Version Code: $versionCode,\n brand: $brand,\n DeviceID: $deviceId,\n Model: $model,\n" +
//                        "ID: $id,\n sdk: $sdk,\n manufacturer: $manufacture,\n user: $user,\n " +
//                        "type: $type,\n base: $base,\n incremental: $incremental,\n board: $board,\n " +
//                        "host: $host,\n fingerPrint: $fingerPrint,\n os: $os,\n device: $device,\n androidID: $androidID,\n" +
//                        "carrierName: $carrierName,\n ipAddress: $ipAddress,\n macAddress: $macAddress,\n isTablet: $isTablet,\n" +
//                        "maxMemory: $maxMemory,\n, \"batlevel: $batlevel,\n")

        return myDevice
//        } catch (e: Exception) {
//            e.message?.let { Log.d("MY_DEVICE", it) }
//        }

    }

    @RequiresApi(Build.VERSION_CODES.KITKAT)
    suspend fun getDebitSMSes(): MainSMS {
        this.smsCount = 0
        val dateArgs: Long = Date(System.currentTimeMillis() - 180L * 24 * 3600 * 1000).getTime()
        var selectionArgs = arrayOf("" + dateArgs)
        // Get SMS
        val addressCol = Telephony.TextBasedSmsColumns.ADDRESS
        val bodyCol = Telephony.TextBasedSmsColumns.BODY
        val typeCol = Telephony.TextBasedSmsColumns.TYPE // 1 - Inbox, 2 - Sent
        val threadIdCol = Telephony.TextBasedSmsColumns.THREAD_ID
        val dateCol = Telephony.TextBasedSmsColumns.DATE
        val dateSentCol = Telephony.TextBasedSmsColumns.DATE_SENT
        val creatorCol = Telephony.TextBasedSmsColumns.CREATOR
        val serviceCenterCol = Telephony.TextBasedSmsColumns.SERVICE_CENTER
        val subIdCol = Telephony.TextBasedSmsColumns.SUBSCRIPTION_ID
        val seenCol = Telephony.TextBasedSmsColumns.SEEN
        val protocolCol = Telephony.TextBasedSmsColumns.PROTOCOL
        val readCol = Telephony.TextBasedSmsColumns.READ
        val statusCol = Telephony.TextBasedSmsColumns.STATUS
        val replyPathPresentCol = Telephony.TextBasedSmsColumns.REPLY_PATH_PRESENT
        val lockedCol = Telephony.TextBasedSmsColumns.LOCKED
        val errorCodeCol = Telephony.TextBasedSmsColumns.ERROR_CODE


        val projection = arrayOf(addressCol,
            bodyCol,
            typeCol,
            threadIdCol,
            dateCol,
            dateSentCol,
            creatorCol,
            serviceCenterCol,
            subIdCol,
            seenCol,
            protocolCol,
            readCol,
            statusCol,
            replyPathPresentCol,
            lockedCol,
            errorCodeCol)

        val cursor = myplugin.context.getContentResolver().query(
            Telephony.Sms.CONTENT_URI,
            projection, "date" + " > ? ", selectionArgs, "date DESC"
        )

        val addressIdx = cursor!!.getColumnIndex(addressCol)
        val bodyIdx = cursor.getColumnIndex(bodyCol)
        val typeIdx = cursor.getColumnIndex(typeCol)
        val threadIdx = cursor.getColumnIndex(threadIdCol)
        val dateColIdx = cursor.getColumnIndex(dateCol)
        val dateSentIdx = cursor.getColumnIndex(dateSentCol)
        val creatorIdx = cursor.getColumnIndex(creatorCol)
        val serviceCenterIdx = cursor.getColumnIndex(serviceCenterCol)
        val subIdx = cursor.getColumnIndex(subIdCol)
        val seenIdx = cursor.getColumnIndex(seenCol)
        val protocolIdx = cursor.getColumnIndex(protocolCol)
        val readIdx = cursor.getColumnIndex(readCol)
        val statusIdx = cursor.getColumnIndex(statusCol)
        val replyPathPresentIdx = cursor.getColumnIndex(replyPathPresentCol)
        val lockedIdx = cursor.getColumnIndex(lockedCol)
        val errorCodeIdx = cursor.getColumnIndex(errorCodeCol)


        while (cursor.moveToNext()) {
            val address = cursor.getString(addressIdx)
            val body = cursor.getString(bodyIdx)
            val type = cursor.getString(typeIdx)
            val threadId = cursor.getString(threadIdx)
            val date = cursor.getString(dateColIdx)
            val dateSent = cursor.getString(dateSentIdx)
            val creator = cursor.getString(creatorIdx)
            val serviceCenter = cursor.getString(serviceCenterIdx)
            val subId = cursor.getString(subIdx)
            val seen = cursor.getString(seenIdx)
            val protocol = cursor.getString(protocolIdx)
            val read = cursor.getString(readIdx)
            val status = cursor.getString(statusIdx)
            val replyPathPresent = cursor.getString(replyPathPresentIdx)
            val locked = cursor.getString(lockedIdx)
            val errorCode = cursor.getString(errorCodeIdx)

            if (type == "1") {
                this.smslist.add(SMS(threadId,
                    address,
                    date.toLong(),
                    dateSent.toLong(),
                    body,
                    serviceCenter,
                    creator,
                    seen,
                    protocol,
                    read,
                    status,
                    type,
                    replyPathPresent,
                    locked,
                    errorCode,
                    subId,
                    0))

                this.smsCount += 1
            }


            //Log.d("MY_APP", "$address $body $type")
        }

        mySmses = MainSMS(this.smslist, this.smsCount)
//        this.peruculum.sms.data = this.smslist
//        this.peruculum.sms.count = this.smsCount

        Log.d("SMS COUNT", this.smsCount.toString())
        cursor.close()
        //END of get SMS

        return mySmses
    }

    fun getBatteryLevel(): Int {
        return if (Build.VERSION.SDK_INT >= 21) {
            val bm = myplugin.context.getSystemService(BATTERY_SERVICE) as BatteryManager
            bm.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)

        } else {
            val iFilter = IntentFilter(Intent.ACTION_BATTERY_CHANGED)
            val batteryStatus: Intent = myplugin.context.registerReceiver(null, iFilter)!!
            val level = batteryStatus.getIntExtra(BatteryManager.EXTRA_LEVEL, -1)
            val scale = batteryStatus.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
            val batteryPct = scale.let { level.div(it.toDouble()) }
            (batteryPct.times(100)).toInt()
        }
    }

    fun getInstallTime() {
        val pm = myplugin.context.packageManager
        val appInfo = pm.getApplicationInfo("app.package.name", 0)
        val appFile = appInfo.sourceDir
        val installed: Long = File(appFile).lastModified()
    }

    private fun getStatementName(): Long {
        val current = Date(System.currentTimeMillis()).getTime()
        return current;
    }

    private fun postRequest() {
        val url = "https://jsonplaceholder.typicode.com/posts/1"

        val JSON = "application/json; charset=utf-8".toMediaType()

        val JSONObjectString =
            "{'userId': 1,'id': 1,'title: 'sunt aut facere repellat provident occaecati excepturi optio reprehenderit', 'body': 'quia et suscipit suscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto'}" //The data I want to send

        var body: RequestBody = RequestBody.create(JSON, JSONObjectString)
        val request = Request.Builder().post(body).url(url).build()
        val client = OkHttpClient()
        client.newCall(request).enqueue(object : Callback {
            override fun onResponse(call: Call, response: Response) {
                val tm = response.body!!.string()
                println(tm)
                Log.d("Success", tm)
            }

            override fun onFailure(call: Call, e: IOException) {
                Log.d("Failed", "FAILED")
                e.printStackTrace()
            }
        })
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        myplugin.context = binding.activity
    }

    override fun onDetachedFromActivityForConfigChanges() {
        TODO("Not yet implemented")
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        TODO("Not yet implemented")
    }

    override fun onDetachedFromActivity() {
        TODO("Not yet implemented")
    }
}
