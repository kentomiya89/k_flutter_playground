import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:k_flutter_playground/util/logger.dart';

class ProviderLogger extends ProviderObserver {
  @override
  void didAddProvider(ProviderBase provider, Object? value) {
    logger..info('called didAddProvider')..info(provider);
  }

  @override
  void mayHaveChanged(ProviderBase provider) {
    logger..info('called didAddProvider')..info(provider);
  }

  @override
  void didUpdateProvider(ProviderBase provider, Object? newValue) {
    logger..info('called didAddProvider')..info(provider);
  }

  @override
  void didDisposeProvider(ProviderBase provider) {
    logger..info('called didAddProvider')..info(provider);
  }
}
