import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:k_flutter_playground/samples/text_field_sample/with_clear_button/provider/text_field_provider.dart';

// Riverpod用
class TextFieldWithClearButtonForRp extends HookConsumerWidget {
  const TextFieldWithClearButtonForRp();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('TextField ClearButton'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: 'テキストを入力',
              suffixIcon: ref.watch(
                      textFieldProvider.select((value) => value.isHiddenIcon))
                  ? null
                  : IconButton(
                      icon: Icon(Icons.clear),
                      color: Colors.grey,
                      onPressed: () {
                        controller.clear();
                        ref.read(textFieldProvider).text =
                            controller.value.text;
                      },
                    ),
            ),
            onChanged: (text) {
              ref.read(textFieldProvider).text = text;
            },
          ),
        ),
      ),
    );
  }
}
