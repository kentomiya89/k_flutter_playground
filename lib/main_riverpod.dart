import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'app.dart';
import 'samples/device_and_packge_info/device_info_provider.dart';
import 'samples/device_and_packge_info/package_info_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  late BaseDeviceInfo deviceInfo;
  late PackageInfo packageInfo;

  await Future.wait([
    Future(() async {
      deviceInfo = await DeviceInfoPlugin().deviceInfo;
    }),
    Future(() async {
      packageInfo = await PackageInfo.fromPlatform();
    }),
  ]);

  runApp(
    ProviderScope(
      overrides: [
        deviceInfoProvider.overrideWithValue(deviceInfo),
        packageInfoProvider.overrideWithValue(packageInfo),
      ],
      child: const PlaygroundApp(),
    ),
  );
}
