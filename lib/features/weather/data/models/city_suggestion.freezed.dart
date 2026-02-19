// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'city_suggestion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CitySuggestion {

 String get displayName; String get city; String get country; double get latitude; double get longitude;
/// Create a copy of CitySuggestion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CitySuggestionCopyWith<CitySuggestion> get copyWith => _$CitySuggestionCopyWithImpl<CitySuggestion>(this as CitySuggestion, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CitySuggestion&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.city, city) || other.city == city)&&(identical(other.country, country) || other.country == country)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}


@override
int get hashCode => Object.hash(runtimeType,displayName,city,country,latitude,longitude);

@override
String toString() {
  return 'CitySuggestion(displayName: $displayName, city: $city, country: $country, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class $CitySuggestionCopyWith<$Res>  {
  factory $CitySuggestionCopyWith(CitySuggestion value, $Res Function(CitySuggestion) _then) = _$CitySuggestionCopyWithImpl;
@useResult
$Res call({
 String displayName, String city, String country, double latitude, double longitude
});




}
/// @nodoc
class _$CitySuggestionCopyWithImpl<$Res>
    implements $CitySuggestionCopyWith<$Res> {
  _$CitySuggestionCopyWithImpl(this._self, this._then);

  final CitySuggestion _self;
  final $Res Function(CitySuggestion) _then;

/// Create a copy of CitySuggestion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? displayName = null,Object? city = null,Object? country = null,Object? latitude = null,Object? longitude = null,}) {
  return _then(_self.copyWith(
displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [CitySuggestion].
extension CitySuggestionPatterns on CitySuggestion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CitySuggestion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CitySuggestion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CitySuggestion value)  $default,){
final _that = this;
switch (_that) {
case _CitySuggestion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CitySuggestion value)?  $default,){
final _that = this;
switch (_that) {
case _CitySuggestion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String displayName,  String city,  String country,  double latitude,  double longitude)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CitySuggestion() when $default != null:
return $default(_that.displayName,_that.city,_that.country,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String displayName,  String city,  String country,  double latitude,  double longitude)  $default,) {final _that = this;
switch (_that) {
case _CitySuggestion():
return $default(_that.displayName,_that.city,_that.country,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String displayName,  String city,  String country,  double latitude,  double longitude)?  $default,) {final _that = this;
switch (_that) {
case _CitySuggestion() when $default != null:
return $default(_that.displayName,_that.city,_that.country,_that.latitude,_that.longitude);case _:
  return null;

}
}

}

/// @nodoc


class _CitySuggestion implements CitySuggestion {
  const _CitySuggestion({required this.displayName, required this.city, required this.country, required this.latitude, required this.longitude});
  

@override final  String displayName;
@override final  String city;
@override final  String country;
@override final  double latitude;
@override final  double longitude;

/// Create a copy of CitySuggestion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CitySuggestionCopyWith<_CitySuggestion> get copyWith => __$CitySuggestionCopyWithImpl<_CitySuggestion>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CitySuggestion&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.city, city) || other.city == city)&&(identical(other.country, country) || other.country == country)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}


@override
int get hashCode => Object.hash(runtimeType,displayName,city,country,latitude,longitude);

@override
String toString() {
  return 'CitySuggestion(displayName: $displayName, city: $city, country: $country, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class _$CitySuggestionCopyWith<$Res> implements $CitySuggestionCopyWith<$Res> {
  factory _$CitySuggestionCopyWith(_CitySuggestion value, $Res Function(_CitySuggestion) _then) = __$CitySuggestionCopyWithImpl;
@override @useResult
$Res call({
 String displayName, String city, String country, double latitude, double longitude
});




}
/// @nodoc
class __$CitySuggestionCopyWithImpl<$Res>
    implements _$CitySuggestionCopyWith<$Res> {
  __$CitySuggestionCopyWithImpl(this._self, this._then);

  final _CitySuggestion _self;
  final $Res Function(_CitySuggestion) _then;

/// Create a copy of CitySuggestion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? displayName = null,Object? city = null,Object? country = null,Object? latitude = null,Object? longitude = null,}) {
  return _then(_CitySuggestion(
displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
