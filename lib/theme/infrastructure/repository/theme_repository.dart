import 'package:dartz/dartz.dart';
import 'package:dynamic_theming_localization/failures/failure.dart';
import 'package:dynamic_theming_localization/theme/infrastructure/entities/theme_palatte.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeRepository = Provider<IThemeRepository>((ref) {
  return ThemeRepository();
});

abstract class IThemeRepository {
  Future<Either<ThemePalatte, Failure>> fetchTheme();

  Future<Either<ThemePalatte, Failure>> changeTheme({
    required bool isDarkTheme,
  });
}

class ThemeRepository implements IThemeRepository {
  @override
  Future<Either<ThemePalatte, Failure>> fetchTheme() async {
    final prefs = await SharedPreferences.getInstance();

    try {
      final isDarkTheme = prefs.getBool('isDarkTheme');
      return Left(isDarkTheme != null && isDarkTheme
          ? ThemePalatte.darkThemePalatte
          : ThemePalatte.lightThemePalatte);
    } catch (e) {
      return const Right(
        Failure('couldn\'t update theme'),
      );
    }
  }

  @override
  Future<Either<ThemePalatte, Failure>> changeTheme({
    required bool isDarkTheme,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      await prefs.setBool('isDarkTheme', isDarkTheme);
      return Left(
        isDarkTheme
            ? ThemePalatte.darkThemePalatte
            : ThemePalatte.lightThemePalatte,
      );
    } catch (e) {
      return const Right(
        Failure('couldn\'t update theme'),
      );
    }
  }
}
