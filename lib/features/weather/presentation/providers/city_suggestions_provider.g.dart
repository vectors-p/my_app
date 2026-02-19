// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_suggestions_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(citySuggestions)
final citySuggestionsProvider = CitySuggestionsFamily._();

final class CitySuggestionsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CitySuggestion>>,
          List<CitySuggestion>,
          FutureOr<List<CitySuggestion>>
        >
    with
        $FutureModifier<List<CitySuggestion>>,
        $FutureProvider<List<CitySuggestion>> {
  CitySuggestionsProvider._({
    required CitySuggestionsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'citySuggestionsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$citySuggestionsHash();

  @override
  String toString() {
    return r'citySuggestionsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<CitySuggestion>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<CitySuggestion>> create(Ref ref) {
    final argument = this.argument as String;
    return citySuggestions(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CitySuggestionsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$citySuggestionsHash() => r'862cf689061db8a00d227ec3c9302ec08531e0bf';

final class CitySuggestionsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<CitySuggestion>>, String> {
  CitySuggestionsFamily._()
    : super(
        retry: null,
        name: r'citySuggestionsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CitySuggestionsProvider call(String query) =>
      CitySuggestionsProvider._(argument: query, from: this);

  @override
  String toString() => r'citySuggestionsProvider';
}
