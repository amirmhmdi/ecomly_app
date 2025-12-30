// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_adapter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AuthAdapter)
const authAdapterProvider = AuthAdapterProvider._();

final class AuthAdapterProvider
    extends $NotifierProvider<AuthAdapter, AuthState> {
  const AuthAdapterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authAdapterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authAdapterHash();

  @$internal
  @override
  AuthAdapter create() => AuthAdapter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthState>(value),
    );
  }
}

String _$authAdapterHash() => r'33d6d671339af2ca8b955046ce7a7db59519d67e';

abstract class _$AuthAdapter extends $Notifier<AuthState> {
  AuthState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AuthState, AuthState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AuthState, AuthState>,
              AuthState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
