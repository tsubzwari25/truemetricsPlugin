import 'package:flutter_test/flutter_test.dart';
import 'package:truemetrics_plugin/truemetrics_plugin.dart';
import 'package:truemetrics_plugin/truemetrics_plugin_platform_interface.dart';
import 'package:truemetrics_plugin/truemetrics_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockTruemetricsPluginPlatform
    with MockPlatformInterfaceMixin
    implements TruemetricsPluginPlatform {
  @override
  Future<String?> initTrueMetrics() => Future.value('42');
}

void main() {
  final TruemetricsPluginPlatform initialPlatform =
      TruemetricsPluginPlatform.instance;

  test('$MethodChannelTruemetricsPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelTruemetricsPlugin>());
  });

  test('getPlatformVersion', () async {
    TruemetricsPlugin truemetricsPlugin = TruemetricsPlugin();
    MockTruemetricsPluginPlatform fakePlatform =
        MockTruemetricsPluginPlatform();
    TruemetricsPluginPlatform.instance = fakePlatform;

    expect(await truemetricsPlugin.getTrueMetrics(), '42');
  });
}
