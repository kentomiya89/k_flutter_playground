import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../state/text_notifier.dart';

final _textProvider = Provider.autoDispose<String>(
  (ref) => ref.watch(textProvider),
);

class SecureStorageScreen extends HookConsumerWidget {
  const SecureStorageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(textProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Secure Storage Samples'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(ref.watch(_textProvider)),
            const SizedBox(height: 8),
            TextFormField(
              onFieldSubmitted: notifier.save,
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: notifier.delete,
              child: const Text('削除'),
            ),
          ],
        ),
      ),
    );
  }
}
