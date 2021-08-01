import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:k_flutter_playground/samples/text_field_sample/with_clear_button/state_controller/text_field_state_controller.dart';

final textFieldProvider =
    ChangeNotifierProvider.autoDispose<TextFieldStateController>(
        (_) => TextFieldStateController());
