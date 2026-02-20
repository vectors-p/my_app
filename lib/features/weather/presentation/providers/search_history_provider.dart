import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'search_history_provider.g.dart';

@Riverpod(keepAlive: true)
class SearchHistory extends _$SearchHistory {
  static const _key = 'search_history';
  static const _maxItems = 5;

  @override
  Future<List<String>> build() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? [];
  }

  Future<void> add(String city) async {
    final current = await future;
    final updated = [
      city,
      ...current.where((c) => c.toLowerCase() != city.toLowerCase()),
    ].take(_maxItems).toList();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_key, updated);
    state = AsyncData(updated);
  }

  Future<void> remove(String city) async {
    final current = await future;
    final updated = current
        .where((c) => c.toLowerCase() != city.toLowerCase())
        .toList();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_key, updated);
    state = AsyncData(updated);
  }

  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
    state = const AsyncData([]);
  }
}
