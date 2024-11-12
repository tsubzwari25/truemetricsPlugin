import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'truemetrics_plugin_method_channel.dart';

abstract class TruemetricsPluginPlatform extends PlatformInterface {
  /// Constructs a TruemetricsPluginPlatform.
  TruemetricsPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static TruemetricsPluginPlatform _instance = MethodChannelTruemetricsPlugin();

  /// The default instance of [TruemetricsPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelTruemetricsPlugin].
  static TruemetricsPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TruemetricsPluginPlatform] when
  /// they register themselves.
  static set instance(TruemetricsPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> initTrueMetrics() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
