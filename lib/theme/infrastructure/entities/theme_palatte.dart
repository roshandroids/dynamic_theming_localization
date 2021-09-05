import 'package:flutter/material.dart';

enum ThemeType { dark, light }

class ThemePalatte {
  const ThemePalatte({
    required this.themeType,
    required this.brightness,
    required this.themeMode,
    required this.textTheme,
    required this.scaffoldBackground,
    required this.borderColor,
    required this.textColor,
    required this.iconColor,
  });
  final ThemeType themeType;
  final TextTheme textTheme;
  final Brightness brightness;
  final ThemeMode themeMode;
  final Color scaffoldBackground;
  final Color iconColor;
  final Color borderColor;
  final Color textColor;
  /*Material color generator for text theme*/

  static const int _textColor = 0xFF6B7280;
  static const MaterialColor textSwatch = MaterialColor(
    _textColor,
    <int, Color>{
      50: Color(0xFFF9FAFB),
      100: Color(0xFFF3F4F6),
      200: Color(0xFFE5E7EB),
      300: Color(0xFFD1D5DB),
      400: Color(0xFF9CA3AF),
      500: Color(_textColor),
      600: Color(0xFF4B5563),
      700: Color(0xFF374151),
      800: Color(0xFF1F2937),
      900: Color(0xFF111827),
    },
  );
  /*Getter to get Palatte for light theme*/
  static ThemePalatte get lightThemePalatte => ThemePalatte(
        iconColor: Colors.blueAccent,
        textColor: textSwatch.shade600,
        borderColor: textSwatch.shade700,
        scaffoldBackground: textSwatch.shade100,
        textTheme: TextTheme(
          headline1: TextStyle(
            color: textSwatch.shade700,
            fontWeight: FontWeight.w300,
          ),
          headline2: TextStyle(
            color: textSwatch.shade600,
          ),
          headline3: TextStyle(
            color: textSwatch.shade700,
          ),
          headline4: TextStyle(
            color: textSwatch.shade700,
          ),
          headline5: TextStyle(
            color: textSwatch.shade600,
          ),
          headline6: TextStyle(
            color: textSwatch.shade700,
          ),
          subtitle1: TextStyle(
            color: textSwatch.shade700,
          ),
          subtitle2: TextStyle(
            color: textSwatch.shade600,
          ),
          bodyText1: TextStyle(
            color: textSwatch.shade700,
          ),
          bodyText2: TextStyle(
            color: textSwatch.shade500,
          ),
          button: TextStyle(
            color: textSwatch.shade500,
          ),
          caption: TextStyle(
            color: textSwatch.shade500,
          ),
          overline: TextStyle(
            color: textSwatch.shade500,
          ),
        ),
        brightness: Brightness.light,
        themeType: ThemeType.light,
        themeMode: ThemeMode.light,
      );
  /*Getter to get Palatte for light theme*/
  static ThemePalatte get darkThemePalatte => ThemePalatte(
        iconColor: Colors.lightBlueAccent,
        textColor: textSwatch.shade100,
        borderColor: textSwatch.shade200,
        scaffoldBackground: const Color(0xFF1F2937),
        brightness: Brightness.dark,
        themeType: ThemeType.dark,
        themeMode: ThemeMode.dark,
        textTheme: TextTheme(
          headline1: TextStyle(
            color: textSwatch.shade200,
            fontWeight: FontWeight.w300,
          ),
          headline2: TextStyle(
            color: textSwatch.shade300,
          ),
          headline3: TextStyle(
            color: textSwatch.shade200,
          ),
          headline4: TextStyle(
            color: textSwatch.shade200,
          ),
          headline5: TextStyle(
            color: textSwatch.shade300,
          ),
          headline6: TextStyle(
            color: textSwatch.shade200,
          ),
          subtitle1: TextStyle(
            color: textSwatch.shade200,
          ),
          subtitle2: TextStyle(
            color: textSwatch.shade300,
          ),
          bodyText1: TextStyle(
            color: textSwatch.shade300,
          ),
          bodyText2: TextStyle(
            color: textSwatch.shade200,
          ),
          button: TextStyle(
            color: textSwatch.shade400,
          ),
          caption: TextStyle(
            color: textSwatch.shade400,
          ),
          overline: TextStyle(
            color: textSwatch.shade400,
          ),
        ),
      );
}
