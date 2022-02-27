import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../util/providers.dart';

final textProvider = StateNotifierProvider.autoDispose<TextNotifier, String>(
  (ref) => TextNotifier(ref.read),
);

const _noData = 'No Data';
const _testTextKey = 'testText';

class TextNotifier extends StateNotifier<String> {
  TextNotifier(this._reader) : super('---') {
    initState();
  }

  final Reader _reader;

  Future<void> initState() async {
    final secureStorage = _reader(secureStorageProvider);

    final data = await secureStorage.read(key: _testTextKey);
    state = data ?? _noData;
  }

  Future<void> save(String text) async {
    final secureStorage = _reader(secureStorageProvider);
    await secureStorage.write(key: _testTextKey, value: text);
    state = text;
  }

  Future<void> delete() async {
    final secureStorage = _reader(secureStorageProvider);
    await secureStorage.delete(key: _testTextKey);
    state = _noData;
  }
}
