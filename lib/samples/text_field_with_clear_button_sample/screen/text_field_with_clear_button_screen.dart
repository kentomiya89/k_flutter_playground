import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../provider/text_field_provider.dart';

// Riverpod用
class TextFieldWithClearButtonForRp extends HookConsumerWidget {
  const TextFieldWithClearButtonForRp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController(text: '');
    final textController = ref.watch(textProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('TextField ClearButton'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: 'テキストを入力',
              suffixIcon: ref.watch(isShowClearButtonProvider)
                  ? null
                  : IconButton(
                      icon: const Icon(Icons.clear),
                      color: Colors.grey,
                      onPressed: () {
                        controller.clear();
                        textController.update((state) => '');
                      },
                    ),
            ),
            onChanged: (text) => textController.update((state) => text),
          ),
        ),
      ),
    );
  }
}
