import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'util.dart';

class ProviderLogger extends ProviderObserver {
  @override
  void didAddProvider(
    ProviderBase<dynamic> provider,
    Object? value,
    ProviderContainer container,
  ) {
    logger
      ..info('called didAddProvider')
      ..info(provider);
  }

  @override
  void providerDidFail(
    ProviderBase<dynamic> provider,
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
    ProviderBase<dynamic> provider,
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
    ProviderBase<dynamic> provider,
    ProviderContainer containers,
  ) {
    logger
      ..info('called didDisposeProvider')
      ..info(provider);
  }
}
