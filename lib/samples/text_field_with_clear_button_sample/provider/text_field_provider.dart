import 'package:hooks_riverpod/hooks_riverpod.dart';

// テキスト
final textProvider = StateProvider.autoDispose((ref) => '');

// クリアアイコンを表示するかどうか
final isShowClearButtonProvider = Provider.autoDispose<bool>(
  (ref) => ref.watch(textProvider.select((value) => value.isNotEmpty)),
);
