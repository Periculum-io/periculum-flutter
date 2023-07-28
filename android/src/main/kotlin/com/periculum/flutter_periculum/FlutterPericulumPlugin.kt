package com.periculum.flutter_periculum

import android.app.Activity
import android.content.Context
import android.content.Context.BATTERY_SERVICE
import android.content.Intent
import android.content.IntentFilter
import android.content.pm.PackageManager
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
import com.google.gson.Gson
import com.google.gson.reflect.TypeToken
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
   
    private lateinit var channel: MethodChannel
    lateinit var myplugin: FlutterPericulumPlugin
    lateinit var context: Activity
    private val BASE_URL: String = "https://api.insights-periculum.com"

    lateinit var periculum: Periculum
    var smsCount = 0

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
      
       if (call.method == "generateMobileDataAnalysis") {
            GlobalScope.launch(Dispatchers.IO) {
                if (!isReadSMSPermissionGranted()) {
                    async { requestReadSMSPermissions() }
                }

                var pCheck = async { isReadSMSPermissionGranted() }

                if (pCheck.await()) {

                    checkPermissions();

                    val args = call.arguments as? HashMap<String, String>
                    var statementName: String = ""
                    var phoneNumber: String = ""
                    var bvn: String = ""
                    var publicKey: String = ""

                    if (args != null) {
                        statementName = getStatementName().toString() 
                        publicKey = args.get("publicKey").toString()
                        phoneNumber = args.get("phoneNumber").toString()
                        bvn = args.get("bvn").toString()



                        if (statementName == null || statementName == "null") {
                            statementName = getStatementName().toString()
                        }
                    } else {
                        statementName = getStatementName().toString()
                    }


                    var customer = Customer(phoneNumber, bvn)
                    var mymetadata = MetaData(customer)
                    var device = async { getDeviceDetails() }
                    var smses = async { getDebitSMSes() }

                    var mydevice = device.await()
                    var mysms = smses.await()





                            var time = getStatementName()


                            val gson = Gson()

                            periculum =
                                Periculum(
                                    publicKey,
                                    statementName,
                                    mydevice,
                                    mysms,
                                    mymetadata,
                                    )

                            var jsonInString: String? = gson.toJson(periculum)
                            result.success(jsonInString)

                            jsonInString = null


                    }

                else {
                    result.success("{\"title\": \"Unable to get permission\"}")
                }
            }
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    suspend fun isReadSMSPermissionGranted(): Boolean {
        return if ( ActivityCompat.checkSelfPermission(
                myplugin.context,
                android.Manifest.permission.READ_SMS
            ) != PackageManager.PERMISSION_GRANTED
        ) {
            ActivityCompat.requestPermissions(
                myplugin.context,
                arrayOf(
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
                android.Manifest.permission.READ_SMS) == PackageManager.PERMISSION_GRANTED -> {
            }

            else -> ActivityCompat.requestPermissions(
                myplugin.context,
                arrayOf(
                    android.Manifest.permission.READ_SMS
                ),
                44
            )
        }
    }

    suspend fun requestReadSMSPermissions() {
        ActivityCompat.requestPermissions(
            myplugin.context,
            arrayOf(
                android.Manifest.permission.READ_SMS
            ),
            44
        )
    }


    suspend fun getDeviceDetails(): Device {
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
        val fingerPrint = Build.FINGERPRINT
        val device = Build.DEVICE
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

        myDevice = Device(
            device,
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


        return myDevice
    }

    @RequiresApi(Build.VERSION_CODES.KITKAT)
    suspend fun getDebitSMSes(): MainSMS {
        smslist = mutableListOf<SMS>()
        this.smsCount = 0
        val dateArgs: Long = Date(System.currentTimeMillis() - 180L * 24 * 3600 * 1000).getTime()
        var selectionArgs = arrayOf("" + dateArgs)
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
        }

        mySmses = MainSMS(this.smslist, this.smsCount)

//        Log.d("SMS COUNT", this.smsCount.toString())
        cursor.close()

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
        channel.setMethodCallHandler(null)
    }
}
