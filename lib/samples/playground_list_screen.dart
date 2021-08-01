import 'package:flutter/material.dart';
import 'package:k_flutter_playground/samples/text_field_sample/with_clear_button/screen/text_field_with_clear_button_screen.dart';
import 'package:k_flutter_playground/widget/playground_list.dart';

import 'dropdown_button_sample/dropdown_button_screen.dart';

class PlaygroundListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('サンプル集'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            PlaygroundListTile(
              title: 'ドロップダウンボタン',
              page: DropdownButtonSample(),
            ),
            PlaygroundListTile(
              title: 'テキストフィールドクリアボタン',
              page: TextFieldWithClearButtonForRp(),
            ),
          ],
        ),
      ),
    );
  }
}
