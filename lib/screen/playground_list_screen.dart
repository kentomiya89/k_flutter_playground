import 'package:flutter/material.dart';
import 'package:k_flutter_playground/screen/dropdown_button_sample/dropdown_button_screen.dart';
import 'package:k_flutter_playground/widget/playground_list.dart';

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
          ],
        ),
      ),
    );
  }
}
