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
    required ({String city, String country, double latitude, double longitude})
    super.argument,
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
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<WeatherModel> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<WeatherModel> create(Ref ref) {
    final argument =
        this.argument
            as ({
              String city,
              String country,
              double latitude,
              double longitude,
            });
    return weather(
      ref,
      city: argument.city,
      country: argument.country,
      latitude: argument.latitude,
      longitude: argument.longitude,
    );
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

String _$weatherHash() => r'8b830dea045684df846f5c89abb4c8102d6457d4';

final class WeatherFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<WeatherModel>,
          ({String city, String country, double latitude, double longitude})
        > {
  WeatherFamily._()
    : super(
        retry: null,
        name: r'weatherProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  WeatherProvider call({
    required String city,
    required String country,
    required double latitude,
    required double longitude,
  }) => WeatherProvider._(
    argument: (
      city: city,
      country: country,
      latitude: latitude,
      longitude: longitude,
    ),
    from: this,
  );

  @override
  String toString() => r'weatherProvider';
}
