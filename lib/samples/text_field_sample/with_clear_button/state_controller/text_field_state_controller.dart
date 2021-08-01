// テキストフィールド専用の状態クラス
import 'package:flutter/foundation.dart';

// ChangeNotifier
class TextFieldStateController extends ChangeNotifier {
  String _text = '';
  bool _isHiddenIcon = true;

  String get text => _text;
  bool get isHiddenIcon => _isHiddenIcon;

  set text(String inputText) {
    notifyChangingTextCountIfNeeded(inputText);
    _text = inputText;
  }

  void notifyChangingTextCountIfNeeded(String inputText) {
    // 同じ文字だったら何もしない
    if (_text != inputText) {
      // 文字列が1文字以上になったとき
      if (_text.isEmpty && inputText.isNotEmpty) {
        _isHiddenIcon = false;
        notifyListeners();
        return;
      }

      // 文字列が0文字になったとき
      if (inputText.isEmpty && _text.isNotEmpty) {
        _isHiddenIcon = true;
        notifyListeners();
        return;
      }
    }
  }
}
