import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'truemetrics_plugin_platform_interface.dart';

/// An implementation of [TruemetricsPluginPlatform] that uses method channels.
class MethodChannelTruemetricsPlugin extends TruemetricsPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('truemetrics_plugin');

  @override
  Future<String?> initTrueMetrics() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
