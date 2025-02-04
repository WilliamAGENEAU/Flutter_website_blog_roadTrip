import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff904a4a),
      surfaceTint: Color(0xff904a4a),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffdad8),
      onPrimaryContainer: Color(0xff733334),
      secondary: Color(0xff775655),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffffdad8),
      onSecondaryContainer: Color(0xff5d3f3e),
      tertiary: Color(0xff745a2f),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffdeac),
      onTertiaryContainer: Color(0xff5a4319),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffff8f7),
      onSurface: Color(0xff231919),
      onSurfaceVariant: Color(0xff524342),
      outline: Color(0xff857372),
      outlineVariant: Color(0xffd7c1c0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382e2d),
      inversePrimary: Color(0xffffb3b1),
      primaryFixed: Color(0xffffdad8),
      onPrimaryFixed: Color(0xff3b080c),
      primaryFixedDim: Color(0xffffb3b1),
      onPrimaryFixedVariant: Color(0xff733334),
      secondaryFixed: Color(0xffffdad8),
      onSecondaryFixed: Color(0xff2c1515),
      secondaryFixedDim: Color(0xffe6bdbb),
      onSecondaryFixedVariant: Color(0xff5d3f3e),
      tertiaryFixed: Color(0xffffdeac),
      onTertiaryFixed: Color(0xff281900),
      tertiaryFixedDim: Color(0xffe4c18d),
      onTertiaryFixedVariant: Color(0xff5a4319),
      surfaceDim: Color(0xffe8d6d5),
      surfaceBright: Color(0xfffff8f7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff0ef),
      surfaceContainer: Color(0xfffceae9),
      surfaceContainerHigh: Color(0xfff6e4e3),
      surfaceContainerHighest: Color(0xfff0dedd),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff5e2324),
      surfaceTint: Color(0xff904a4a),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffa15858),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff4a2f2e),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff876564),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff48320a),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff84693c),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f7),
      onSurface: Color(0xff170f0f),
      onSurfaceVariant: Color(0xff413332),
      outline: Color(0xff5f4f4e),
      outlineVariant: Color(0xff7b6968),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382e2d),
      inversePrimary: Color(0xffffb3b1),
      primaryFixed: Color(0xffa15858),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff844141),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff876564),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff6c4d4c),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff84693c),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff6a5126),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd4c3c2),
      surfaceBright: Color(0xfffff8f7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff0ef),
      surfaceContainer: Color(0xfff6e4e3),
      surfaceContainerHigh: Color(0xffebd9d8),
      surfaceContainerHighest: Color(0xffdfcecd),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff51191b),
      surfaceTint: Color(0xff904a4a),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff763536),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff3f2525),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff604141),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff3c2802),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff5d451c),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f7),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff362928),
      outlineVariant: Color(0xff554545),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382e2d),
      inversePrimary: Color(0xffffb3b1),
      primaryFixed: Color(0xff763536),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff591f21),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff604141),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff472b2b),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff5d451c),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff442f07),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc5b5b4),
      surfaceBright: Color(0xfffff8f7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffffedeb),
      surfaceContainer: Color(0xfff0dedd),
      surfaceContainerHigh: Color(0xffe2d0cf),
      surfaceContainerHighest: Color(0xffd4c3c2),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb3b1),
      surfaceTint: Color(0xffffb3b1),
      onPrimary: Color(0xff571d1f),
      primaryContainer: Color(0xff733334),
      onPrimaryContainer: Color(0xffffdad8),
      secondary: Color(0xffe6bdbb),
      onSecondary: Color(0xff442929),
      secondaryContainer: Color(0xff5d3f3e),
      onSecondaryContainer: Color(0xffffdad8),
      tertiary: Color(0xffe4c18d),
      onTertiary: Color(0xff412d05),
      tertiaryContainer: Color(0xff5a4319),
      onTertiaryContainer: Color(0xffffdeac),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff1a1111),
      onSurface: Color(0xfff0dedd),
      onSurfaceVariant: Color(0xffd7c1c0),
      outline: Color(0xffa08c8b),
      outlineVariant: Color(0xff524342),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff0dedd),
      inversePrimary: Color(0xff904a4a),
      primaryFixed: Color(0xffffdad8),
      onPrimaryFixed: Color(0xff3b080c),
      primaryFixedDim: Color(0xffffb3b1),
      onPrimaryFixedVariant: Color(0xff733334),
      secondaryFixed: Color(0xffffdad8),
      onSecondaryFixed: Color(0xff2c1515),
      secondaryFixedDim: Color(0xffe6bdbb),
      onSecondaryFixedVariant: Color(0xff5d3f3e),
      tertiaryFixed: Color(0xffffdeac),
      onTertiaryFixed: Color(0xff281900),
      tertiaryFixedDim: Color(0xffe4c18d),
      onTertiaryFixedVariant: Color(0xff5a4319),
      surfaceDim: Color(0xff1a1111),
      surfaceBright: Color(0xff423736),
      surfaceContainerLowest: Color(0xff140c0c),
      surfaceContainerLow: Color(0xff231919),
      surfaceContainer: Color(0xff271d1d),
      surfaceContainerHigh: Color(0xff322827),
      surfaceContainerHighest: Color(0xff3d3232),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffd2d0),
      surfaceTint: Color(0xffffb3b1),
      onPrimary: Color(0xff481315),
      primaryContainer: Color(0xffcb7a79),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffed2d0),
      onSecondary: Color(0xff381f1e),
      secondaryContainer: Color(0xffad8886),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffbd7a1),
      onTertiary: Color(0xff352200),
      tertiaryContainer: Color(0xffaa8c5c),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff1a1111),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffeed7d6),
      outline: Color(0xffc2adac),
      outlineVariant: Color(0xff9f8c8b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff0dedd),
      inversePrimary: Color(0xff743435),
      primaryFixed: Color(0xffffdad8),
      onPrimaryFixed: Color(0xff2c0104),
      primaryFixedDim: Color(0xffffb3b1),
      onPrimaryFixedVariant: Color(0xff5e2324),
      secondaryFixed: Color(0xffffdad8),
      onSecondaryFixed: Color(0xff200b0b),
      secondaryFixedDim: Color(0xffe6bdbb),
      onSecondaryFixedVariant: Color(0xff4a2f2e),
      tertiaryFixed: Color(0xffffdeac),
      onTertiaryFixed: Color(0xff1a0f00),
      tertiaryFixedDim: Color(0xffe4c18d),
      onTertiaryFixedVariant: Color(0xff48320a),
      surfaceDim: Color(0xff1a1111),
      surfaceBright: Color(0xff4d4241),
      surfaceContainerLowest: Color(0xff0d0606),
      surfaceContainerLow: Color(0xff251b1b),
      surfaceContainer: Color(0xff2f2525),
      surfaceContainerHigh: Color(0xff3b3030),
      surfaceContainerHighest: Color(0xff463b3a),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffecea),
      surfaceTint: Color(0xffffb3b1),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffffadac),
      onPrimaryContainer: Color(0xff220002),
      secondary: Color(0xffffecea),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffe2b9b7),
      onSecondaryContainer: Color(0xff190606),
      tertiary: Color(0xffffedd7),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffe0be89),
      onTertiaryContainer: Color(0xff130900),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff1a1111),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffffecea),
      outlineVariant: Color(0xffd3bebd),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff0dedd),
      inversePrimary: Color(0xff743435),
      primaryFixed: Color(0xffffdad8),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffffb3b1),
      onPrimaryFixedVariant: Color(0xff2c0104),
      secondaryFixed: Color(0xffffdad8),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffe6bdbb),
      onSecondaryFixedVariant: Color(0xff200b0b),
      tertiaryFixed: Color(0xffffdeac),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffe4c18d),
      onTertiaryFixedVariant: Color(0xff1a0f00),
      surfaceDim: Color(0xff1a1111),
      surfaceBright: Color(0xff594d4d),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff271d1d),
      surfaceContainer: Color(0xff382e2d),
      surfaceContainerHigh: Color(0xff443938),
      surfaceContainerHighest: Color(0xff504443),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
