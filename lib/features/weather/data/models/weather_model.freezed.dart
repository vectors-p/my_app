// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WeatherModel {

 String get city; String get country; double get temperature; double get feelsLike; double get tempMin; double get tempMax; String get description; int get weatherCode; int get humidity; double get windSpeed; int get pressure; bool get isDay; String get time; List<DailyForecast> get forecast;
/// Create a copy of WeatherModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherModelCopyWith<WeatherModel> get copyWith => _$WeatherModelCopyWithImpl<WeatherModel>(this as WeatherModel, _$identity);

  /// Serializes this WeatherModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherModel&&(identical(other.city, city) || other.city == city)&&(identical(other.country, country) || other.country == country)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.feelsLike, feelsLike) || other.feelsLike == feelsLike)&&(identical(other.tempMin, tempMin) || other.tempMin == tempMin)&&(identical(other.tempMax, tempMax) || other.tempMax == tempMax)&&(identical(other.description, description) || other.description == description)&&(identical(other.weatherCode, weatherCode) || other.weatherCode == weatherCode)&&(identical(other.humidity, humidity) || other.humidity == humidity)&&(identical(other.windSpeed, windSpeed) || other.windSpeed == windSpeed)&&(identical(other.pressure, pressure) || other.pressure == pressure)&&(identical(other.isDay, isDay) || other.isDay == isDay)&&(identical(other.time, time) || other.time == time)&&const DeepCollectionEquality().equals(other.forecast, forecast));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,city,country,temperature,feelsLike,tempMin,tempMax,description,weatherCode,humidity,windSpeed,pressure,isDay,time,const DeepCollectionEquality().hash(forecast));

@override
String toString() {
  return 'WeatherModel(city: $city, country: $country, temperature: $temperature, feelsLike: $feelsLike, tempMin: $tempMin, tempMax: $tempMax, description: $description, weatherCode: $weatherCode, humidity: $humidity, windSpeed: $windSpeed, pressure: $pressure, isDay: $isDay, time: $time, forecast: $forecast)';
}


}

/// @nodoc
abstract mixin class $WeatherModelCopyWith<$Res>  {
  factory $WeatherModelCopyWith(WeatherModel value, $Res Function(WeatherModel) _then) = _$WeatherModelCopyWithImpl;
@useResult
$Res call({
 String city, String country, double temperature, double feelsLike, double tempMin, double tempMax, String description, int weatherCode, int humidity, double windSpeed, int pressure, bool isDay, String time, List<DailyForecast> forecast
});




}
/// @nodoc
class _$WeatherModelCopyWithImpl<$Res>
    implements $WeatherModelCopyWith<$Res> {
  _$WeatherModelCopyWithImpl(this._self, this._then);

  final WeatherModel _self;
  final $Res Function(WeatherModel) _then;

/// Create a copy of WeatherModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? city = null,Object? country = null,Object? temperature = null,Object? feelsLike = null,Object? tempMin = null,Object? tempMax = null,Object? description = null,Object? weatherCode = null,Object? humidity = null,Object? windSpeed = null,Object? pressure = null,Object? isDay = null,Object? time = null,Object? forecast = null,}) {
  return _then(_self.copyWith(
city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double,feelsLike: null == feelsLike ? _self.feelsLike : feelsLike // ignore: cast_nullable_to_non_nullable
as double,tempMin: null == tempMin ? _self.tempMin : tempMin // ignore: cast_nullable_to_non_nullable
as double,tempMax: null == tempMax ? _self.tempMax : tempMax // ignore: cast_nullable_to_non_nullable
as double,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,weatherCode: null == weatherCode ? _self.weatherCode : weatherCode // ignore: cast_nullable_to_non_nullable
as int,humidity: null == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as int,windSpeed: null == windSpeed ? _self.windSpeed : windSpeed // ignore: cast_nullable_to_non_nullable
as double,pressure: null == pressure ? _self.pressure : pressure // ignore: cast_nullable_to_non_nullable
as int,isDay: null == isDay ? _self.isDay : isDay // ignore: cast_nullable_to_non_nullable
as bool,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,forecast: null == forecast ? _self.forecast : forecast // ignore: cast_nullable_to_non_nullable
as List<DailyForecast>,
  ));
}

}


/// Adds pattern-matching-related methods to [WeatherModel].
extension WeatherModelPatterns on WeatherModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeatherModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeatherModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeatherModel value)  $default,){
final _that = this;
switch (_that) {
case _WeatherModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeatherModel value)?  $default,){
final _that = this;
switch (_that) {
case _WeatherModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String city,  String country,  double temperature,  double feelsLike,  double tempMin,  double tempMax,  String description,  int weatherCode,  int humidity,  double windSpeed,  int pressure,  bool isDay,  String time,  List<DailyForecast> forecast)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeatherModel() when $default != null:
return $default(_that.city,_that.country,_that.temperature,_that.feelsLike,_that.tempMin,_that.tempMax,_that.description,_that.weatherCode,_that.humidity,_that.windSpeed,_that.pressure,_that.isDay,_that.time,_that.forecast);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String city,  String country,  double temperature,  double feelsLike,  double tempMin,  double tempMax,  String description,  int weatherCode,  int humidity,  double windSpeed,  int pressure,  bool isDay,  String time,  List<DailyForecast> forecast)  $default,) {final _that = this;
switch (_that) {
case _WeatherModel():
return $default(_that.city,_that.country,_that.temperature,_that.feelsLike,_that.tempMin,_that.tempMax,_that.description,_that.weatherCode,_that.humidity,_that.windSpeed,_that.pressure,_that.isDay,_that.time,_that.forecast);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String city,  String country,  double temperature,  double feelsLike,  double tempMin,  double tempMax,  String description,  int weatherCode,  int humidity,  double windSpeed,  int pressure,  bool isDay,  String time,  List<DailyForecast> forecast)?  $default,) {final _that = this;
switch (_that) {
case _WeatherModel() when $default != null:
return $default(_that.city,_that.country,_that.temperature,_that.feelsLike,_that.tempMin,_that.tempMax,_that.description,_that.weatherCode,_that.humidity,_that.windSpeed,_that.pressure,_that.isDay,_that.time,_that.forecast);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WeatherModel implements WeatherModel {
  const _WeatherModel({required this.city, required this.country, required this.temperature, required this.feelsLike, required this.tempMin, required this.tempMax, required this.description, required this.weatherCode, required this.humidity, required this.windSpeed, required this.pressure, required this.isDay, required this.time, required final  List<DailyForecast> forecast}): _forecast = forecast;
  factory _WeatherModel.fromJson(Map<String, dynamic> json) => _$WeatherModelFromJson(json);

@override final  String city;
@override final  String country;
@override final  double temperature;
@override final  double feelsLike;
@override final  double tempMin;
@override final  double tempMax;
@override final  String description;
@override final  int weatherCode;
@override final  int humidity;
@override final  double windSpeed;
@override final  int pressure;
@override final  bool isDay;
@override final  String time;
 final  List<DailyForecast> _forecast;
@override List<DailyForecast> get forecast {
  if (_forecast is EqualUnmodifiableListView) return _forecast;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_forecast);
}


/// Create a copy of WeatherModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeatherModelCopyWith<_WeatherModel> get copyWith => __$WeatherModelCopyWithImpl<_WeatherModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeatherModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeatherModel&&(identical(other.city, city) || other.city == city)&&(identical(other.country, country) || other.country == country)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.feelsLike, feelsLike) || other.feelsLike == feelsLike)&&(identical(other.tempMin, tempMin) || other.tempMin == tempMin)&&(identical(other.tempMax, tempMax) || other.tempMax == tempMax)&&(identical(other.description, description) || other.description == description)&&(identical(other.weatherCode, weatherCode) || other.weatherCode == weatherCode)&&(identical(other.humidity, humidity) || other.humidity == humidity)&&(identical(other.windSpeed, windSpeed) || other.windSpeed == windSpeed)&&(identical(other.pressure, pressure) || other.pressure == pressure)&&(identical(other.isDay, isDay) || other.isDay == isDay)&&(identical(other.time, time) || other.time == time)&&const DeepCollectionEquality().equals(other._forecast, _forecast));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,city,country,temperature,feelsLike,tempMin,tempMax,description,weatherCode,humidity,windSpeed,pressure,isDay,time,const DeepCollectionEquality().hash(_forecast));

@override
String toString() {
  return 'WeatherModel(city: $city, country: $country, temperature: $temperature, feelsLike: $feelsLike, tempMin: $tempMin, tempMax: $tempMax, description: $description, weatherCode: $weatherCode, humidity: $humidity, windSpeed: $windSpeed, pressure: $pressure, isDay: $isDay, time: $time, forecast: $forecast)';
}


}

/// @nodoc
abstract mixin class _$WeatherModelCopyWith<$Res> implements $WeatherModelCopyWith<$Res> {
  factory _$WeatherModelCopyWith(_WeatherModel value, $Res Function(_WeatherModel) _then) = __$WeatherModelCopyWithImpl;
@override @useResult
$Res call({
 String city, String country, double temperature, double feelsLike, double tempMin, double tempMax, String description, int weatherCode, int humidity, double windSpeed, int pressure, bool isDay, String time, List<DailyForecast> forecast
});




}
/// @nodoc
class __$WeatherModelCopyWithImpl<$Res>
    implements _$WeatherModelCopyWith<$Res> {
  __$WeatherModelCopyWithImpl(this._self, this._then);

  final _WeatherModel _self;
  final $Res Function(_WeatherModel) _then;

/// Create a copy of WeatherModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? city = null,Object? country = null,Object? temperature = null,Object? feelsLike = null,Object? tempMin = null,Object? tempMax = null,Object? description = null,Object? weatherCode = null,Object? humidity = null,Object? windSpeed = null,Object? pressure = null,Object? isDay = null,Object? time = null,Object? forecast = null,}) {
  return _then(_WeatherModel(
city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double,feelsLike: null == feelsLike ? _self.feelsLike : feelsLike // ignore: cast_nullable_to_non_nullable
as double,tempMin: null == tempMin ? _self.tempMin : tempMin // ignore: cast_nullable_to_non_nullable
as double,tempMax: null == tempMax ? _self.tempMax : tempMax // ignore: cast_nullable_to_non_nullable
as double,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,weatherCode: null == weatherCode ? _self.weatherCode : weatherCode // ignore: cast_nullable_to_non_nullable
as int,humidity: null == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as int,windSpeed: null == windSpeed ? _self.windSpeed : windSpeed // ignore: cast_nullable_to_non_nullable
as double,pressure: null == pressure ? _self.pressure : pressure // ignore: cast_nullable_to_non_nullable
as int,isDay: null == isDay ? _self.isDay : isDay // ignore: cast_nullable_to_non_nullable
as bool,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,forecast: null == forecast ? _self._forecast : forecast // ignore: cast_nullable_to_non_nullable
as List<DailyForecast>,
  ));
}


}

// dart format on
