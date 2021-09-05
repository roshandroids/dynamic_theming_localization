import 'package:dynamic_theming_localization/theme/infrastructure/entities/theme_palatte.dart';
import 'package:dynamic_theming_localization/theme/infrastructure/repository/theme_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final themeController = StateNotifierProvider<ThemeController, ThemePalatte>(
    (ref) => ThemeController(ref.read));

class ThemeController extends StateNotifier<ThemePalatte> {
  ThemeController(this._read) : super(ThemePalatte.lightThemePalatte);
  final Reader _read;

  IThemeRepository get _themeRepo => _read(themeRepository);
  Future<void> fetchTheme() async {
    try {
      final theme = await _themeRepo.fetchTheme();

      state = theme.fold(
        (success) => success,
        (failure) => ThemePalatte.lightThemePalatte,
      );
    } catch (e) {
      state = ThemePalatte.lightThemePalatte;
    }
  }

  Future<void> changeTheme(bool isDarkTheme) async {
    try {
      final theme = await _themeRepo.changeTheme(isDarkTheme: isDarkTheme);
      state = theme.fold(
        (success) => success,
        (failure) => ThemePalatte.lightThemePalatte,
      );
      state = isDarkTheme
          ? ThemePalatte.darkThemePalatte
          : ThemePalatte.lightThemePalatte;
    } catch (e) {
      state = ThemePalatte.lightThemePalatte;
    }
  }
}
