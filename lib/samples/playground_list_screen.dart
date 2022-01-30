import 'package:flutter/material.dart';
import 'package:k_flutter_playground/samples/example_graphql/example_graphql_screen.dart';
import 'package:k_flutter_playground/samples/text_field_sample/with_clear_button/screen/text_field_with_clear_button_screen.dart';
import 'package:k_flutter_playground/widget/playground_list.dart';

import 'dropdown_button_sample/dropdown_button_screen.dart';
import 'navigation_pattern/bottom_navigation_remain.dart';
import 'navigation_pattern/navigation_pattern_screen.dart';

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
          ],
        ),
      ),
    );
  }
}
