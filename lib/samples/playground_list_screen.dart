import 'package:flutter/material.dart';

import '../widget/playground_list.dart';
import 'device_and_packge_info/device_and_package_info_screen.dart';
import 'dropdown_button_sample/dropdown_button_screen.dart';
import 'example_graphql/example_graphql_screen.dart';
import 'navigation_pattern/bottom_navigation_remain.dart';
import 'navigation_pattern/navigation_pattern_screen.dart';
import 'secure_storage/screen/secure_storage_screen.dart';
import 'text_field_with_clear_button_sample/screen/text_field_with_clear_button_screen.dart';

class PlaygroundListScreen extends StatelessWidget {
  const PlaygroundListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('サンプル集'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          children: const [
            PlaygroundListTile(
              title: 'ドロップダウンボタン',
              page: DropdownButtonSample(),
            ),
            PlaygroundListTile(
              title: 'テキストフィールドクリアボタン',
              page: TextFieldWithClearButtonForRp(),
            ),
            PlaygroundListTile(
              title: '画面遷移パターン',
              page: NavigationPatternScreen(),
            ),
            PlaygroundListTile(
              title: 'ネスト画面遷移',
              page: BottomNavigationRemain(),
            ),
            PlaygroundListTile(
              title: 'ポケモンAPI(GraphQL)',
              page: PokemonScreen(),
            ),
            PlaygroundListTile(
              title: '端末とアプリ情報',
              page: DeviceAndPackageInfoSampleScreen(),
            ),
            PlaygroundListTile(
              title: 'Secure Storage',
              page: SecureStorageScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
