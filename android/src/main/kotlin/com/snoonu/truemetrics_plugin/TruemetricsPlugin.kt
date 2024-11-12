package com.snoonu.truemetrics_plugin

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.truemetrics.truemetricssdk.TruemetricsSDK

/** TruemetricsPlugin */
class TruemetricsPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "truemetrics_plugin")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {

    

    if (call.method == "init") {
      initTrueMetrics()
    } else if( call.method == "startRecoding"){
      startRecoding()
    

    }else if(call.method == "stopRecording"){
      stopRecording()

    }else {
      result.notImplemented()
    }
  }

  fun initTrueMetrics(result: Result){
    TruemetricsSDK.initialize(
      context,  
      Config(apiKey = "snoonu_development_key_123")
    )

    result.success("Android ${android.os.Build.VERSION.RELEASE}")

  }

  fun startRecording(result: Result){
    result.success("Android ${android.os.Build.VERSION.RELEASE}")

    TruemetricsSDK.startRecording();
  }

  fun stopRecording(result: Result){
    result.success("Android ${android.os.Build.VERSION.RELEASE}")
    TruemetricsSDK.stopRecording();
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
