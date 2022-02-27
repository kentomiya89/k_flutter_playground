import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:k_flutter_playground/samples/secure_storage/state/text_notifier.dart';
import 'package:k_flutter_playground/util/providers.dart';
import 'package:mocktail/mocktail.dart';

class MockSecureStorage extends Mock implements FlutterSecureStorage {}

void main() {
  const noText = '---';
  const testText = 'test';
  final mock = MockSecureStorage();

  group('Flutter Secure Storageのunit test', () {
    test('値がないときは、テキストの初期値は---を返す', () {
      when(() => mock.read(key: any(named: 'key')))
          .thenAnswer((_) => Future.value(null));

      final container = ProviderContainer(
        overrides: [
          secureStorageProvider.overrideWithValue(mock),
        ],
      );

      verifyNever(() => mock.read(key: any(named: 'key')));
      final text = container.read(textProvider);
      verify(() => mock.read(key: any(named: 'key'))).called(1);

      expect(text, noText);
    });

    test('値がないときは、テキストの初期値の値(---)は、次は保存してる値(noData)に状態変化する', () async {
      when(() => mock.read(key: any(named: 'key')))
          .thenAnswer((_) => Future.value(null));

      ProviderContainer(
        overrides: [secureStorageProvider.overrideWithValue(mock)],
      ).listen<String>(
        textProvider,
        (previous, next) {
          expect(previous, noText);
          expect(next, noData);
        },
      );

      verify(() => mock.read(key: any(named: 'key'))).called(1);
    });

    test('値があるときは、テキストの初期値の値(---)は、次は保存してる値(test)に状態変化する', () async {
      when(() => mock.read(key: any(named: 'key')))
          .thenAnswer((_) => Future.value(testText));

      ProviderContainer(
        overrides: [secureStorageProvider.overrideWithValue(mock)],
      ).listen<String>(
        textProvider,
        (previous, next) {
          expect(previous, noText);
          expect(next, testText);
        },
      );
      verify(() => mock.read(key: any(named: 'key'))).called(1);
    });

    test('テキスト「edit」を書き込むと、状態値は「edit」を返す', () async {
      const edit = 'edit';

      when(() => mock.write(key: any(named: 'key'), value: any(named: 'value')))
          .thenAnswer((_) => Future.value());

      final container = ProviderContainer(
        overrides: [
          secureStorageProvider.overrideWithValue(mock),
        ],
      );

      verifyNever(
          () => mock.write(key: any(named: 'key'), value: any(named: 'value')));
      await container.read(textProvider.notifier).save(edit);
      verify(() =>
              mock.write(key: any(named: 'key'), value: any(named: 'value')))
          .called(1);

      final text = container.read(textProvider);
      expect(text, edit);
    });

    test('テキストを削除すると、状態値は「No Data」を返す', () async {
      when(() => mock.read(key: any(named: 'key')))
          .thenAnswer((_) => Future.value(testText));
      when(() => mock.delete(key: any(named: 'key')))
          .thenAnswer((_) => Future.value());

      final container = ProviderContainer(
        overrides: [
          secureStorageProvider.overrideWithValue(mock),
        ],
      );

      verifyNever(() => mock.delete(key: any(named: 'key')));
      await container.read(textProvider.notifier).delete();
      verify(() => mock.delete(key: any(named: 'key'))).called(1);

      final text = container.read(textProvider);
      expect(text, noData);
    });
  });
}
