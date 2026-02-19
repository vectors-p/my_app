// lib/features/weather/presentation/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/features/weather/data/models/city_suggestion.dart';
import 'package:my_app/features/weather/presentation/providers/city_suggestions_provider.dart';
import 'package:my_app/features/weather/presentation/providers/search_history_provider.dart';
import 'package:my_app/shared/widgets/app_button.dart';
import 'package:my_app/shared/widgets/app_text_field.dart';
import '../../../../core/theme/app_theme.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _controller = TextEditingController();
  String _query = '';

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() => _query = _controller.text.trim());
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _selectSuggestion(CitySuggestion suggestion) {
    setState(() => _query = '');
    _controller.clear();
    context.push(
      '/weather',
      extra: {
        'city': suggestion.city,
        'country': '',
        'latitude': suggestion.latitude,
        'longitude': suggestion.longitude,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final historyAsync = ref.watch(searchHistoryProvider);
    final showSuggestions = _query.length >= 2;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppTheme.darkBg,
              AppTheme.darkBgSecondary,
              AppTheme.darkBg,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 64),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => context.push('/settings'),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.1),
                          ),
                        ),
                        child: Icon(
                          Icons.settings_outlined,
                          color: Colors.white.withValues(alpha: 0.7),
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.15),
                      width: 1.5,
                    ),
                  ),
                  child: const Icon(
                    Icons.wb_sunny_outlined,
                    color: Color(0xFFFFD580),
                    size: 28,
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Weather',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                    letterSpacing: -1.5,
                    height: 1.1,
                  ),
                ),
                Text(
                  'Forecast',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.primaryBlue,
                    letterSpacing: -1.5,
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Search any city in the world',
                  style: TextStyle(
                    fontSize: 15,
                    color: AppTheme.textSecondary,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.2,
                  ),
                ),
                const SizedBox(height: 48),
                AppTextField(
                  controller: _controller,
                  hint: 'City name...',
                  onSubmitted: () {},
                ),
                if (showSuggestions)
                  _SuggestionsDropdown(
                    query: _query,
                    onSelect: _selectSuggestion,
                  ),
                if (!showSuggestions) ...[
                  const SizedBox(height: 16),
                  AppButton(label: 'Search', onTap: () {}),
                ],
                const Spacer(),
                if (!showSuggestions)
                  historyAsync.when(
                    loading: () => const SizedBox.shrink(),
                    error: (_, _) => const SizedBox.shrink(),
                    data: (history) => _CityChips(
                      cities: history.isEmpty
                          ? ['London', 'Tokyo', 'New York', 'Dubai', 'Paris']
                          : history,
                      label: history.isEmpty
                          ? 'POPULAR CITIES'
                          : 'RECENT SEARCHES',
                      onCityTap: (city) async {
                        // Geocode history city before navigating
                        final suggestions = await ref.read(
                          citySuggestionsProvider(city).future,
                        );
                        if (suggestions.isNotEmpty && context.mounted) {
                          _selectSuggestion(suggestions.first);
                        }
                      },
                      onRemoveTap: history.isEmpty
                          ? null
                          : (city) => ref
                                .read(searchHistoryProvider.notifier)
                                .remove(city),
                    ),
                  ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SuggestionsDropdown extends ConsumerWidget {
  final String query;
  final void Function(CitySuggestion) onSelect;

  const _SuggestionsDropdown({required this.query, required this.onSelect});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suggestionsAsync = ref.watch(citySuggestionsProvider(query));

    return suggestionsAsync.when(
      loading: () => Container(
        margin: const EdgeInsets.only(top: 4),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF0D1B3E),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
        ),
        child: const Center(
          child: CircularProgressIndicator(
            color: AppTheme.primaryBlue,
            strokeWidth: 1.5,
          ),
        ),
      ),
      error: (_, _) => const SizedBox.shrink(),
      data: (suggestions) {
        if (suggestions.isEmpty) return const SizedBox.shrink();
        return Container(
          margin: const EdgeInsets.only(top: 4),
          decoration: BoxDecoration(
            color: const Color(0xFF0D1B3E),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
          ),
          child: Column(
            children: suggestions.asMap().entries.map((entry) {
              final i = entry.key;
              final suggestion = entry.value;
              final isLast = i == suggestions.length - 1;
              return GestureDetector(
                onTap: () => onSelect(suggestion),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    border: isLast
                        ? null
                        : Border(
                            bottom: BorderSide(
                              color: Colors.white.withValues(alpha: 0.06),
                            ),
                          ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 15,
                        color: AppTheme.primaryBlue.withValues(alpha: 0.7),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          suggestion.displayName,
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.8),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}

class _CityChips extends StatelessWidget {
  final List<String> cities;
  final String label;
  final void Function(String city) onCityTap;
  final void Function(String city)? onRemoveTap;

  const _CityChips({
    required this.cities,
    required this.label,
    required this.onCityTap,
    this.onRemoveTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.35),
            fontSize: 12,
            letterSpacing: 1.2,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: cities.map((city) {
            return GestureDetector(
              onTap: () => onCityTap(city),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.06),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.1),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      city,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.6),
                        fontSize: 13,
                      ),
                    ),
                    if (onRemoveTap != null) ...[
                      const SizedBox(width: 6),
                      GestureDetector(
                        onTap: () => onRemoveTap!(city),
                        child: Icon(
                          Icons.close_rounded,
                          size: 13,
                          color: Colors.white.withValues(alpha: 0.3),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
