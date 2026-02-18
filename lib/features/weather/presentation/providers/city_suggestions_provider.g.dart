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
          AsyncValue<List<String>>,
          List<String>,
          FutureOr<List<String>>
        >
    with $FutureModifier<List<String>>, $FutureProvider<List<String>> {
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
  $FutureProviderElement<List<String>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<String>> create(Ref ref) {
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

String _$citySuggestionsHash() => r'03c43c48a9fabfdc1745b5d7110aedd7d4506613';

final class CitySuggestionsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<String>>, String> {
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
