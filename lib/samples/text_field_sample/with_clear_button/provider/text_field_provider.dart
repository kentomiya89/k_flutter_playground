import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../state_controller/text_field_state_controller.dart';

final textFieldProvider =
    ChangeNotifierProvider.autoDispose<TextFieldStateController>(
        (_) => TextFieldStateController());
