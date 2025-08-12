import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// AppTheme provides light and dark theme configurations with Material 3 support
/// Generated with Flutter Theme Generator
class AppTheme {
  AppTheme._();

  /// Light theme configuration
  static ThemeData get lightTheme {
    return theme(lightScheme());
  }

  /// Dark theme configuration
  static ThemeData get darkTheme {
    return theme(darkScheme());
  }

  /// Light medium contrast theme
  static ThemeData get lightMediumContrast {
    return theme(lightMediumContrastScheme());
  }

  /// Light high contrast theme
  static ThemeData get lightHighContrast {
    return theme(lightHighContrastScheme());
  }

  /// Dark medium contrast theme
  static ThemeData get darkMediumContrast {
    return theme(darkMediumContrastScheme());
  }

  /// Dark high contrast theme
  static ThemeData get darkHighContrast {
    return theme(darkHighContrastScheme());
  }

  /// Light color scheme
  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF55dd97),
      surfaceTint: Color(0xFF559bdd),
      onPrimary: Color(0xFF000000),
      primaryContainer: Color(0xFFa5ebff),
      onPrimaryContainer: Color(0xFF2d73b5),
      secondary: Color(0xFF00d5ff),
      onSecondary: Color(0xFF000000),
      secondaryContainer: Color(0xFFff98e9),
      onSecondaryContainer: Color(0xFFc42071),
      tertiary: Color(0xFF10B981),
      onTertiary: Color(0xFF000000),
      tertiaryContainer: Color(0xFF60ffd1),
      onTertiaryContainer: Color(0xFF009159),
      error: Color(0xFFBA1A1A),
      onError: Color(0xFFFFFFFF),
      errorContainer: Color(0xFFFFDAD6),
      onErrorContainer: Color(0xFF93000A),
      surface: Color(0xFFFFFBFE),
      onSurface: Color(0xFF1C1B1F),
      onSurfaceVariant: Color(0xFF49454F),
      outline: Color(0xFF79747E),
      outlineVariant: Color(0xFFCAC4D0),
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFF313033),
      onInverseSurface: Color(0xFFF4EFF4),
      inversePrimary: Color(0xFF4187c9),
      primaryFixed: Color(0xFFa5ebff),
      onPrimaryFixed: Color(0xFF195fa1),
      primaryFixedDim: Color(0xFF91d7ff),
      onPrimaryFixedVariant: Color(0xFF4187c9),
      secondaryFixed: Color(0xFFff98e9),
      onSecondaryFixed: Color(0xFFb00c5d),
      secondaryFixedDim: Color(0xFFff84d5),
      onSecondaryFixedVariant: Color(0xFFd83485),
      tertiaryFixed: Color(0xFF60ffd1),
      onTertiaryFixed: Color(0xFF007d45),
      tertiaryFixedDim: Color(0xFF4cf5bd),
      onTertiaryFixedVariant: Color(0xFF00a56d),
      surfaceDim: Color(0xFFE6E0E9),
      surfaceBright: Color(0xFFFFFBFE),
      surfaceContainerLowest: Color(0xFFFFFFFF),
      surfaceContainerLow: Color(0xFFF7F2FA),
      surfaceContainer: Color(0xFFF3EDF7),
      surfaceContainerHigh: Color(0xFFECE6F0),
      surfaceContainerHighest: Color(0xFFE6E0E9),
    );
  }

  /// Light medium contrast color scheme
  static ColorScheme lightMediumContrastScheme() {
    return ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF41c983),
      surfaceTint: Color(0xFF559bdd),
      onPrimary: Color(0xFF000000),
      primaryContainer: Color(0xFF9be1f5),
      onPrimaryContainer: Color(0xFF000000),
      secondary: Color(0xFF00c1eb),
      onSecondary: Color(0xFF000000),
      secondaryContainer: Color(0xFFf58edf),
      onSecondaryContainer: Color(0xFF000000),
      tertiary: Color(0xFF00a56d),
      onTertiary: Color(0xFF000000),
      tertiaryContainer: Color(0xFF56f5c7),
      onTertiaryContainer: Color(0xFF000000),
      error: Color(0xFFa60606),
      onError: Color(0xFFFFFFFF),
      errorContainer: Color(0xFFebc6c2),
      onErrorContainer: Color(0xFFFFFFFF),
      surface: Color(0xFFFFFBFE),
      onSurface: Color(0xFF121115),
      onSurfaceVariant: Color(0xFF3f3b45),
      outline: Color(0xFF65606a),
      outlineVariant: Color(0xFFc0bac6),
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFF313033),
      onInverseSurface: Color(0xFFF4EFF4),
      inversePrimary: Color(0xFF4187c9),
      primaryFixed: Color(0xFF9be1f5),
      onPrimaryFixed: Color(0xFF000000),
      primaryFixedDim: Color(0xFF7dc3eb),
      onPrimaryFixedVariant: Color(0xFF000000),
      secondaryFixed: Color(0xFFf58edf),
      onSecondaryFixed: Color(0xFF000000),
      secondaryFixedDim: Color(0xFFeb70c1),
      onSecondaryFixedVariant: Color(0xFF000000),
      tertiaryFixed: Color(0xFF56f5c7),
      onTertiaryFixed: Color(0xFF000000),
      tertiaryFixedDim: Color(0xFF38e1a9),
      onTertiaryFixedVariant: Color(0xFF000000),
      surfaceDim: Color(0xFFdcd6df),
      surfaceBright: Color(0xFFFFFBFE),
      surfaceContainerLowest: Color(0xFFFFFFFF),
      surfaceContainerLow: Color(0xFFF7F2FA),
      surfaceContainer: Color(0xFFF3EDF7),
      surfaceContainerHigh: Color(0xFFe7e1eb),
      surfaceContainerHighest: Color(0xFFdcd6df),
    );
  }

  /// Light high contrast color scheme
  static ColorScheme lightHighContrastScheme() {
    return ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF2db56f),
      surfaceTint: Color(0xFF559bdd),
      onPrimary: Color(0xFF000000),
      primaryContainer: Color(0xFF87cde1),
      onPrimaryContainer: Color(0xFF000000),
      secondary: Color(0xFF00add7),
      onSecondary: Color(0xFF000000),
      secondaryContainer: Color(0xFFe17acb),
      onSecondaryContainer: Color(0xFF000000),
      tertiary: Color(0xFF009159),
      onTertiary: Color(0xFF000000),
      tertiaryContainer: Color(0xFF42e1b3),
      onTertiaryContainer: Color(0xFF000000),
      error: Color(0xFF920000),
      onError: Color(0xFFFFFFFF),
      errorContainer: Color(0xFFd7b2ae),
      onErrorContainer: Color(0xFFFFFFFF),
      surface: Color(0xFFFFFBFE),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff000000),
      outlineVariant: Color(0xFF98929e),
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFF313033),
      onInverseSurface: Color(0xFFF4EFF4),
      inversePrimary: Color(0xFF4187c9),
      primaryFixed: Color(0xFF87cde1),
      onPrimaryFixed: Color(0xFF000000),
      primaryFixedDim: Color(0xFF69afd7),
      onPrimaryFixedVariant: Color(0xFF000000),
      secondaryFixed: Color(0xFFe17acb),
      onSecondaryFixed: Color(0xFF000000),
      secondaryFixedDim: Color(0xFFd75cad),
      onSecondaryFixedVariant: Color(0xFF000000),
      tertiaryFixed: Color(0xFF42e1b3),
      onTertiaryFixed: Color(0xFF000000),
      tertiaryFixedDim: Color(0xFF24cd95),
      onTertiaryFixedVariant: Color(0xFF000000),
      surfaceDim: Color(0xFFd2ccd5),
      surfaceBright: Color(0xFFFFFBFE),
      surfaceContainerLowest: Color(0xFFFFFFFF),
      surfaceContainerLow: Color(0xFFf2edf5),
      surfaceContainer: Color(0xFFe9e3ed),
      surfaceContainerHigh: Color(0xFFddd7e1),
      surfaceContainerHighest: Color(0xFFd2ccd5),
    );
  }

  /// Dark color scheme
  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF4becb6),
      surfaceTint: Color(0xFF4187c9),
      onPrimary: Color(0xFF054b8d),
      primaryContainer: Color(0xFF195fa1),
      onPrimaryContainer: Color(0xFFa5ebff),
      secondary: Color(0xFF00d5ff),
      onSecondary: Color(0xFF9c0049),
      secondaryContainer: Color(0xFFb00c5d),
      onSecondaryContainer: Color(0xFFff98e9),
      tertiary: Color(0xFF00a56d),
      onTertiary: Color(0xFF006931),
      tertiaryContainer: Color(0xFF007d45),
      onTertiaryContainer: Color(0xFF60ffd1),
      error: Color(0xFFFFB4AB),
      onError: Color(0xFF690005),
      errorContainer: Color(0xFF93000A),
      onErrorContainer: Color(0xFFFFDAD6),
      surface: Color(0xFF160e12),
      onSurface: Color(0xFFE6E0E9),
      onSurfaceVariant: Color(0xFFCAC4D0),
      outline: Color(0xFF938F99),
      outlineVariant: Color(0xFF49454F),
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFFE6E0E9),
      onInverseSurface: Color(0xFF313033),
      inversePrimary: Color(0xFF559bdd),
      primaryFixed: Color(0xFFa5ebff),
      onPrimaryFixed: Color(0xFF195fa1),
      primaryFixedDim: Color(0xFF91d7ff),
      onPrimaryFixedVariant: Color(0xFF4187c9),
      secondaryFixed: Color(0xFFff98e9),
      onSecondaryFixed: Color(0xFFb00c5d),
      secondaryFixedDim: Color(0xFFff84d5),
      onSecondaryFixedVariant: Color(0xFFd83485),
      tertiaryFixed: Color(0xFF60ffd1),
      onTertiaryFixed: Color(0xFF007d45),
      tertiaryFixedDim: Color(0xFF4cf5bd),
      onTertiaryFixedVariant: Color(0xFF00a56d),
      surfaceDim: Color(0xFF10090D),
      surfaceBright: Color(0xFF362F33),
      surfaceContainerLowest: Color(0xFF0B0509),
      surfaceContainerLow: Color(0xFF1D1418),
      surfaceContainer: Color(0xFF211A1E),
      surfaceContainerHigh: Color(0xFF2B2329),
      surfaceContainerHighest: Color(0xFF362F33),
    );
  }

  /// Dark medium contrast color scheme
  static ColorScheme darkMediumContrastScheme() {
    return ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF5fffca),
      surfaceTint: Color(0xFF4187c9),
      onPrimary: Color(0xFF004183),
      primaryContainer: Color(0xFF2369ab),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xFF14e9ff),
      onSecondary: Color(0xFF92003f),
      secondaryContainer: Color(0xFFba1667),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xFF14b981),
      onTertiary: Color(0xFF005f27),
      tertiaryContainer: Color(0xFF0a874f),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xFFffc8bf),
      onError: Color(0xFF5f0000),
      errorContainer: Color(0xFFa7141e),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xFF160e12),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xFFd4ceda),
      outline: Color(0xFF9d99a3),
      outlineVariant: Color(0xFF4e4a54),
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFFE6E0E9),
      onInverseSurface: Color(0xFF313033),
      inversePrimary: Color(0xFF4187c9),
      primaryFixed: Color(0xFFa5ebff),
      onPrimaryFixed: Color(0xFF054b8d),
      primaryFixedDim: Color(0xFF91d7ff),
      onPrimaryFixedVariant: Color(0xFF2d73b5),
      secondaryFixed: Color(0xFFff98e9),
      onSecondaryFixed: Color(0xFF9c0049),
      secondaryFixedDim: Color(0xFFff84d5),
      onSecondaryFixedVariant: Color(0xFFc42071),
      tertiaryFixed: Color(0xFF60ffd1),
      onTertiaryFixed: Color(0xFF006931),
      tertiaryFixedDim: Color(0xFF4cf5bd),
      onTertiaryFixedVariant: Color(0xFF009159),
      surfaceDim: Color(0xFF10090D),
      surfaceBright: Color(0xFF40393d),
      surfaceContainerLowest: Color(0xFF060004),
      surfaceContainerLow: Color(0xFF22191d),
      surfaceContainer: Color(0xFF2b2428),
      surfaceContainerHigh: Color(0xFF3a3238),
      surfaceContainerHighest: Color(0xFF4a4347),
    );
  }

  /// Dark high contrast color scheme
  static ColorScheme darkHighContrastScheme() {
    return ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF73ffde),
      surfaceTint: Color(0xFF4187c9),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xFF377dbf),
      onPrimaryContainer: Color(0xFF91d7eb),
      secondary: Color(0xFF28fdff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xFFce2a7b),
      onSecondaryContainer: Color(0xFFeb84d5),
      tertiary: Color(0xFF28cd95),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xFF1e9b63),
      onTertiaryContainer: Color(0xFF4cebbd),
      error: Color(0xFFffdcd3),
      onError: Color(0xff000000),
      errorContainer: Color(0xFFbb2832),
      onErrorContainer: Color(0xFFebc6c2),
      surface: Color(0xFF160e12),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xFFb1adb7),
      outlineVariant: Color(0xFF5d5963),
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFFE6E0E9),
      onInverseSurface: Color(0xFF313033),
      inversePrimary: Color(0xFF2d73b5),
      primaryFixed: Color(0xFFa5ebff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xFF91d7ff),
      onPrimaryFixedVariant: Color(0xFF195fa1),
      secondaryFixed: Color(0xFFff98e9),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xFFff84d5),
      onSecondaryFixedVariant: Color(0xFFb00c5d),
      tertiaryFixed: Color(0xFF60ffd1),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xFF4cf5bd),
      onTertiaryFixedVariant: Color(0xFF007d45),
      surfaceDim: Color(0xFF10090D),
      surfaceBright: Color(0xFF544d51),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xFF22191d),
      surfaceContainer: Color(0xFF352e32),
      surfaceContainerHigh: Color(0xFF494147),
      surfaceContainerHighest: Color(0xFF5e575b),
    );
  }

  /// Main theme function
  static ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: _textTheme,
    appBarTheme: colorScheme.brightness == Brightness.light
        ? _lightAppBarTheme
        : _darkAppBarTheme,
    elevatedButtonTheme: _elevatedButtonTheme,
    textButtonTheme: _textButtonTheme,
    outlinedButtonTheme: _outlinedButtonTheme,
    inputDecorationTheme: _inputDecorationTheme,
    cardTheme: _cardTheme,
    chipTheme: _chipTheme,
    progressIndicatorTheme: _progressIndicatorTheme,
    dividerTheme: _dividerTheme,
    bottomNavigationBarTheme: _bottomNavigationBarTheme,
    tabBarTheme: _tabBarTheme,
    switchTheme: _switchTheme,
    checkboxTheme: _checkboxTheme,
    radioTheme: _radioTheme,
    sliderTheme: _sliderTheme,
    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,
  );

  /// Helper method to safely get responsive font size
  static double _getFontSize(double size) {
    try {
      return size.sp;
    } catch (e) {
      // Fallback to regular size if ScreenUtil is not initialized
      return size;
    }
  }

  /// Helper method to safely get responsive width
  static double _getWidth(double width) {
    try {
      return width.w;
    } catch (e) {
      // Fallback to regular size if ScreenUtil is not initialized
      return width;
    }
  }

  /// Helper method to safely get responsive height
  static double _getHeight(double height) {
    try {
      return height.h;
    } catch (e) {
      // Fallback to regular size if ScreenUtil is not initialized
      return height;
    }
  }

  /// Helper method to safely get responsive radius
  static double _getRadius(double radius) {
    try {
      return radius.r;
    } catch (e) {
      // Fallback to regular size if ScreenUtil is not initialized
      return radius;
    }
  }

  /// Text theme
  static TextTheme get _textTheme => TextTheme(
    displayLarge: TextStyle(
      fontSize: _getFontSize(57),
      fontWeight: FontWeight.w400,
      letterSpacing: -0.25,
      height: 1.1228070175438596,
    ),
    displayMedium: TextStyle(
      fontSize: _getFontSize(45),
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      height: 1.1555555555555554,
    ),
    displaySmall: TextStyle(
      fontSize: _getFontSize(36),
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      height: 1.2222222222222223,
    ),
    headlineLarge: TextStyle(
      fontSize: _getFontSize(32),
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      height: 1.25,
    ),
    headlineMedium: TextStyle(
      fontSize: _getFontSize(28),
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      height: 1.2857142857142858,
    ),
    headlineSmall: TextStyle(
      fontSize: _getFontSize(24),
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      height: 1.3333333333333333,
    ),
    titleLarge: TextStyle(
      fontSize: _getFontSize(22),
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      height: 1.2727272727272727,
    ),
    titleMedium: TextStyle(
      fontSize: _getFontSize(16),
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      height: 1.5,
    ),
    titleSmall: TextStyle(
      fontSize: _getFontSize(14),
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      height: 1.4285714285714286,
    ),
    bodyLarge: TextStyle(
      fontSize: _getFontSize(16),
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
      height: 1.5,
    ),
    bodyMedium: TextStyle(
      fontSize: _getFontSize(14),
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      height: 1.4285714285714286,
    ),
    bodySmall: TextStyle(
      fontSize: _getFontSize(12),
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
      height: 1.3333333333333333,
    ),
    labelLarge: TextStyle(
      fontSize: _getFontSize(14),
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      height: 1.4285714285714286,
    ),
    labelMedium: TextStyle(
      fontSize: _getFontSize(12),
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      height: 1.3333333333333333,
    ),
    labelSmall: TextStyle(
      fontSize: _getFontSize(11),
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      height: 1.4545454545454546,
    ),
  );

  /// Light app bar theme
  static AppBarTheme get _lightAppBarTheme => AppBarTheme(
    elevation: 1,
    centerTitle: false,
    titleSpacing: _getWidth(16),
    backgroundColor: const Color(0xFFFFFBFE),
    foregroundColor: const Color(0xFF1C1B1F),
    surfaceTintColor: const Color(0xFF55dd97),
  );

  /// Dark app bar theme
  static AppBarTheme get _darkAppBarTheme => AppBarTheme(
    elevation: 1,
    centerTitle: false,
    titleSpacing: _getWidth(16),
    backgroundColor: const Color(0xFF160e12),
    foregroundColor: const Color(0xFFE6E0E9),
    surfaceTintColor: const Color(0xFF4becb6),
  );

  /// Elevated button theme
  static ElevatedButtonThemeData get _elevatedButtonTheme =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 3,
          padding: EdgeInsets.symmetric(
            horizontal: _getWidth(24),
            vertical: _getHeight(16),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_getRadius(12)),
          ),
        ),
      );

  /// Text button theme
  static TextButtonThemeData get _textButtonTheme => TextButtonThemeData(
    style: TextButton.styleFrom(
      padding: EdgeInsets.symmetric(
        horizontal: _getWidth(24),
        vertical: _getHeight(16),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_getRadius(12)),
      ),
    ),
  );

  /// Outlined button theme
  static OutlinedButtonThemeData get _outlinedButtonTheme =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: _getWidth(24),
            vertical: _getHeight(16),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_getRadius(12)),
          ),
        ),
      );

  /// Input decoration theme
  static InputDecorationTheme get _inputDecorationTheme => InputDecorationTheme(
    filled: true,
    contentPadding: EdgeInsets.symmetric(
      horizontal: _getWidth(16),
      vertical: _getHeight(16),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_getRadius(12)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_getRadius(12)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_getRadius(12)),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_getRadius(12)),
    ),
  );

  /// Card theme
  static CardThemeData get _cardTheme => CardThemeData(
    elevation: 1,
    margin: EdgeInsets.all(_getWidth(8)),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(_getRadius(16)),
    ),
  );

  /// Chip theme
  static ChipThemeData get _chipTheme => ChipThemeData(
    padding: EdgeInsets.symmetric(
      horizontal: _getWidth(8),
      vertical: _getHeight(4),
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(_getRadius(9999)),
    ),
  );

  /// Progress indicator theme
  static const ProgressIndicatorThemeData _progressIndicatorTheme =
      ProgressIndicatorThemeData(linearTrackColor: Colors.transparent);

  /// Divider theme
  static const DividerThemeData _dividerTheme = DividerThemeData(
    thickness: 1,
    space: 4,
  );

  /// Bottom navigation bar theme
  static const BottomNavigationBarThemeData _bottomNavigationBarTheme =
      BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        elevation: 6,
      );

  /// Tab bar theme
  static TabBarThemeData get _tabBarTheme => const TabBarThemeData(
    labelPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  );

  /// Switch theme
  static SwitchThemeData get _switchTheme => SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return lightScheme().primary;
      }
      return null;
    }),
  );

  /// Checkbox theme
  static CheckboxThemeData get _checkboxTheme => CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(_getRadius(4)),
    ),
  );

  /// Radio theme
  static const RadioThemeData _radioTheme = RadioThemeData();

  /// Slider theme
  static const SliderThemeData _sliderTheme = SliderThemeData();
}

/// Custom theme colors extension
extension CustomColors on ColorScheme {
  Color get success => const Color(0xFF2E7D32);
  Color get warning => const Color(0xFFF57C00);
  Color get info => const Color(0xFF1976D2);
}
