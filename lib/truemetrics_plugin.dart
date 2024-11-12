import 'truemetrics_plugin_platform_interface.dart';

class TruemetricsPlugin {
  Future<String?> getTrueMetrics() {
    return TruemetricsPluginPlatform.instance.initTrueMetrics();
  }
}
