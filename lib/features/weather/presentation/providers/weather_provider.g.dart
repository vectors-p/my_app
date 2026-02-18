// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(weather)
final weatherProvider = WeatherFamily._();

final class WeatherProvider
    extends
        $FunctionalProvider<
          AsyncValue<WeatherModel>,
          WeatherModel,
          FutureOr<WeatherModel>
        >
    with $FutureModifier<WeatherModel>, $FutureProvider<WeatherModel> {
  WeatherProvider._({
    required WeatherFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'weatherProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$weatherHash();

  @override
  String toString() {
    return r'weatherProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<WeatherModel> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<WeatherModel> create(Ref ref) {
    final argument = this.argument as String;
    return weather(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is WeatherProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$weatherHash() => r'0d1f2aa5a3f828e7275509dfed348533b921e95e';

final class WeatherFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<WeatherModel>, String> {
  WeatherFamily._()
    : super(
        retry: null,
        name: r'weatherProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  WeatherProvider call(String city) =>
      WeatherProvider._(argument: city, from: this);

  @override
  String toString() => r'weatherProvider';
}
