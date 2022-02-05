import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:version/version.dart';

import 'device_info_provider.dart';
import 'package_info_provider.dart';

final deviceAndPackgeInfoListProvider =
    Provider.autoDispose<List<MapEntry<String, String>>>((ref) {
  final device = ref.watch(deviceInfoProvider);
  final package = ref.watch(packageInfoProvider);

  final packageInfoList = [
    MapEntry('アプリ名', package.appName),
    MapEntry('プロジェクト名(パッケージ名)', package.packageName),
    MapEntry('アプリバージョン', package.version),
    MapEntry('ビルドバージョン', package.buildNumber),
  ];

  if (Platform.isAndroid) {
    final androidInfo = device as AndroidDeviceInfo;
    return [
      ...packageInfoList,
      MapEntry('OSバージョン', androidInfo.version.release!),
      MapEntry('SDKバージョン', androidInfo.version.sdkInt!.toString()),
      MapEntry('機種名', androidInfo.device!),
      MapEntry('ブランド', androidInfo.brand!),
    ];
  } else if (Platform.isIOS) {
    final iosInfo = device as IosDeviceInfo;
    return [
      ...packageInfoList,
      MapEntry('OSバージョン', iosInfo.systemVersion!),
      MapEntry('機種名', iosInfo.utsname.machine!),
    ];
  } else {
    return [
      ...packageInfoList,
    ];
  }
});

final messageProvider = Provider.autoDispose<String>((ref) {
  final device = ref.watch(deviceInfoProvider);
  if (Platform.isAndroid) {
    final androidInfo = device as AndroidDeviceInfo;
    final osVersion = Version.parse(androidInfo.version.release);
    final compareVersion = Version(12, 0, 0); // Android 12で比較
    return osVersion >= compareVersion ? 'Android 12以上です' : 'Android 12未満です';
  } else if (Platform.isIOS) {
    final iosInfo = device as IosDeviceInfo;
    final osVersion = Version.parse(iosInfo.systemVersion);
    final compareVersion = Version(15, 0, 0); // iOS15で比較
    return osVersion >= compareVersion ? 'iOS 15以上です' : 'iOS15未満です';
  } else {
    return '';
  }
});

class DeviceAndPackageInfoSampleScreen extends HookConsumerWidget {
  const DeviceAndPackageInfoSampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceInfoList = ref.watch(deviceAndPackgeInfoListProvider);
    final message = ref.watch(messageProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('端末とアプリ情報'),
        actions: [
          IconButton(
            onPressed: () {
              showDialog<void>(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: const Text('OSバージョン確認'),
                    content: Text(message),
                    actions: <Widget>[
                      // ボタン領域
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.info),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: deviceInfoList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(deviceInfoList[index].key),
            subtitle: Text(deviceInfoList[index].value),
          );
        },
      ),
    );
  }
}
