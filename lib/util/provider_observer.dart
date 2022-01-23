import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:k_flutter_playground/util/logger.dart';

class ProviderLogger extends ProviderObserver {
  @override
  void didAddProvider(
    ProviderBase provider,
    Object? value,
    ProviderContainer container,
  ) {
    logger
      ..info('called didAddProvider')
      ..info(provider);
  }

  @override
  void providerDidFail(
    ProviderBase provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    logger
      ..info('called providerDidFail')
      ..info(provider);
  }

  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    logger
      ..info('called didUpdateProvider')
      ..info(provider);
  }

  @override
  void didDisposeProvider(
    ProviderBase provider,
    ProviderContainer containers,
  ) {
    logger
      ..info('called didDisposeProvider')
      ..info(provider);
  }
}
