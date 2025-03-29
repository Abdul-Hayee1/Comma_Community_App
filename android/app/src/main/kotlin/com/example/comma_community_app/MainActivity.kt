package com.example.comma_community_app

import android.content.pm.PackageInfo
import android.content.pm.PackageManager
import android.content.pm.Signature
import android.util.Base64
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.security.MessageDigest

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.example.comma_community_app/hash"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getHashKey") {
                try {
                    val hashKey = getHashKey()
                    result.success(hashKey)
                } catch (e: Exception) {
                    result.error("ERROR", "Failed to get hash key", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getHashKey(): String {
        val info: PackageInfo = packageManager.getPackageInfo(
            "com.example.comma_community_app",
            PackageManager.GET_SIGNATURES
        )
        for (signature in info.signatures) {
            val md = MessageDigest.getInstance("SHA")
            md.update(signature.toByteArray())
            return Base64.encodeToString(md.digest(), Base64.DEFAULT).trim()
        }
        throw Exception("No signatures found")
    }
}