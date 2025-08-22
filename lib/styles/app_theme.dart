import 'package:flutter/material.dart';

class AppThemeData {
  const AppThemeData({this.extensions});
  final Iterable<ThemeExtension<dynamic>>? extensions;

  ThemeData get theme => ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.standard,
    materialTapTargetSize: MaterialTapTargetSize.padded,
    extensions: [if (extensions != null) ...extensions!],
    brightness: Brightness.dark,
    cardTheme: CardThemeData(color: const Color(0xFF0F172A)),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: const Color(0xFF0F172A),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF064E3B),
      brightness: Brightness.dark,
      surface: const Color(0xFF020617),
      // onSurfaceVariant: const Color(0xFF059669),
      // secondary: const Color(0xFF059669),
      // onSecondary: const Color(0xFFECFDF5),
      primaryContainer: const Color(0xFF047857),
      onPrimaryContainer: const Color(0xFFECFDF5),
      onSurface: const Color(0xFFECFDF5),
      primary: const Color(0xFFECFDF5),
      onPrimary: const Color(0xFF047857),
      outline: const Color(0xFF059669),
      surfaceContainer: const Color(0xFF0F172A),
      surfaceContainerHigh: const Color(0xFF059669),
      surfaceContainerHighest: const Color(0xFF064E3B),
      surfaceContainerLow: const Color(0xFF047857),
      surfaceContainerLowest: const Color(0xFF065F46),
      secondaryContainer: null,
      onSecondaryContainer: null,
    ),
    splashColor: const Color(0xFF065F46),
  );

  ThemeData? get darkTheme => ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.standard,
    materialTapTargetSize: MaterialTapTargetSize.padded,
    extensions: [if (extensions != null) ...extensions!],
    brightness: Brightness.dark,
    cardTheme: CardThemeData(color: const Color(0xFF0F172A)),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: const Color(0xFF0F172A),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF064E3B),
      brightness: Brightness.dark,
      surface: const Color(0xFF020617),
      primaryContainer: const Color(0xFF047857),
      onPrimaryContainer: const Color(0xFFECFDF5),
      onSurface: const Color(0xFFECFDF5),
      primary: const Color(0xFFECFDF5),
      onPrimary: const Color(0xFF047857),
      outline: const Color(0xFF059669),
      surfaceContainer: const Color(0xFF0F172A),
      surfaceContainerHigh: const Color(0xFF059669),
      surfaceContainerHighest: const Color(0xFF064E3B),
      surfaceContainerLow: const Color(0xFF047857),
      surfaceContainerLowest: const Color(0xFF065F46),
      secondaryContainer: null,
      onSecondaryContainer: null,
    ),
    splashColor: const Color(0xFF065F46),
  );
}
