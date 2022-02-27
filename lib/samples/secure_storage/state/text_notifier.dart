import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../util/providers.dart';

final textProvider = StateNotifierProvider.autoDispose<TextNotifier, String>(
  (ref) => TextNotifier(ref.read),
);

const noData = 'No Data';
const testTextKey = 'testText';

class TextNotifier extends StateNotifier<String> {
  TextNotifier(this._reader) : super('---') {
    initState();
  }

  final Reader _reader;

  Future<void> initState() async {
    final secureStorage = _reader(secureStorageProvider);

    final data = await secureStorage.read(key: testTextKey);
    state = data ?? noData;
  }

  Future<void> save(String text) async {
    final secureStorage = _reader(secureStorageProvider);
    await secureStorage.write(key: testTextKey, value: text);
    state = text;
  }

  Future<void> delete() async {
    final secureStorage = _reader(secureStorageProvider);
    await secureStorage.delete(key: testTextKey);
    state = noData;
  }
}
