// lib/core/providers/settings_provider.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_provider.g.dart';

@Riverpod(keepAlive: true)
class Settings extends _$Settings {
  static const _unitKey = 'temperature_unit';

  @override
  Future<bool> build() async {
    // true = Celsius, false = Fahrenheit
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_unitKey) ?? true;
  }

  Future<void> toggleUnit() async {
    final current = await future;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_unitKey, !current);
    state = AsyncData(!current);
  }

  bool get isCelsius => state.value ?? true;
}
