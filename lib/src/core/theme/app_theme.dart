import 'package:flutter/material.dart';

// Naming convention:
// color scheme: AppColors.light.primary, AppColors.dark.secondary
// text theme: AppTextStyles.textTheme.headlineLarge (references Material's TextTheme)
// specific text styles: AppTextStyles.displayLarge (custom definition if needed)

class AppColors {
  // Light Theme Colors
  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF6200EE), // Example: Purple
    onPrimary: Colors.white,
    primaryContainer: Color(0xFFBB86FC),
    onPrimaryContainer: Colors.black,
    secondary: Color(0xFF03DAC6), // Example: Teal
    onSecondary: Colors.black,
    secondaryContainer: Color(0xFF66FFF9),
    onSecondaryContainer: Colors.black,
    tertiary: Color(0xFF018786), // Another accent
    onTertiary: Colors.white,
    tertiaryContainer: Color(0xFFA4F1A4),
    onTertiaryContainer: Colors.black,
    error: Color(0xFFB00020),
    onError: Colors.white,
    errorContainer: Color(0xFFFCD8DF),
    onErrorContainer: Colors.black,
    background: Color(0xFFFFFFFF), // Standard white
    onBackground: Colors.black,
    surface: Color(0xFFFFFFFF), // Standard white
    onSurface: Colors.black,
    surfaceVariant: Color(0xFFE0E0E0),
    onSurfaceVariant: Colors.black,
    outline: Color(0xFFBDBDBD),
    outlineVariant: Color(0xFFCCCCCC),
    shadow: Colors.black,
    scrim: Colors.black.withOpacity(0.5),
    inverseSurface: Color(0xFF303030), // For elements on dark background in light theme
    onInverseSurface: Colors.white,
    inversePrimary: Color(0xFFD0BCFF), // For elements needing primary inversion
    surfaceTint: Color(0xFF6200EE), // Typically same as primary
  );

  // Dark Theme Colors
  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFBB86FC), // Example: Light Purple
    onPrimary: Colors.black,
    primaryContainer: Color(0xFF6200EE),
    onPrimaryContainer: Colors.white,
    secondary: Color(0xFF03DAC6), // Example: Teal (often same for dark)
    onSecondary: Colors.black,
    secondaryContainer: Color(0xFF003E3B),
    onSecondaryContainer: Colors.white,
    tertiary: Color(0xFF66FFF9), // Lighter teal/cyan
    onTertiary: Colors.black,
    tertiaryContainer: Color(0xFF018786),
    onTertiaryContainer: Colors.white,
    error: Color(0xFFCF6679), // Standard dark theme error
    onError: Colors.black,
    errorContainer: Color(0xFFB00020),
    onErrorContainer: Colors.white,
    background: Color(0xFF121212), // Standard dark
    onBackground: Colors.white,
    surface: Color(0xFF1E1E1E), // Slightly lighter dark for cards/surfaces
    onSurface: Colors.white,
    surfaceVariant: Color(0xFF303030),
    onSurfaceVariant: Colors.white,
    outline: Color(0xFF8A8A8A),
    outlineVariant: Color(0xFF525252),
    shadow: Colors.black, // Shadow is often less visible in dark theme
    scrim: Colors.black.withOpacity(0.5),
    inverseSurface: Color(0xFFE0E0E0), // For elements on light background in dark theme
    onInverseSurface: Colors.black,
    inversePrimary: Color(0xFF4A00E0), // For elements needing primary inversion
    surfaceTint: Color(0xFFBB86FC), // Typically same as primary
  );
}

class AppTextStyles {
  // Using GoogleFonts can be an option here, but for simplicity, stick to default font
  // or define specific font families if added to pubspec.yaml and assets.
  // For this example, we'll use the default Flutter font (Roboto/San Francisco).

  static const TextTheme _textTheme = TextTheme(
    // Display
    displayLarge: TextStyle(fontSize: 57, fontWeight: FontWeight.w400, letterSpacing: -0.25),
    displayMedium: TextStyle(fontSize: 45, fontWeight: FontWeight.w400, letterSpacing: 0),
    displaySmall: TextStyle(fontSize: 36, fontWeight: FontWeight.w400, letterSpacing: 0),

    // Headline
    headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w400, letterSpacing: 0),
    headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w400, letterSpacing: 0),
    headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, letterSpacing: 0),

    // Title
    titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, letterSpacing: 0.15), // Medium weight for titles
    titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.15),
    titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),

    // Label
    labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1), // Medium weight for emphasis
    labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 0.5),
    labelSmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, letterSpacing: 0.5),

    // Body
    bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
    bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
    bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  );

  // Helper method to apply color to the text theme for light mode
  static TextTheme get lightTextTheme {
    return _textTheme.apply(
      bodyColor: AppColors.lightColorScheme.onBackground,
      displayColor: AppColors.lightColorScheme.onBackground,
      // decorationColor can also be set if needed
    );
  }

  // Helper method to apply color to the text theme for dark mode
  static TextTheme get darkTextTheme {
    return _textTheme.apply(
      bodyColor: AppColors.darkColorScheme.onBackground,
      displayColor: AppColors.darkColorScheme.onBackground,
    );
  }
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: AppColors.lightColorScheme,
      textTheme: AppTextStyles.lightTextTheme,
      scaffoldBackgroundColor: AppColors.lightColorScheme.background,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.lightColorScheme.primary,
        foregroundColor: AppColors.lightColorScheme.onPrimary, // For title and icons
        elevation: 4.0,
        titleTextStyle: AppTextStyles.lightTextTheme.titleLarge?.copyWith(color: AppColors.lightColorScheme.onPrimary),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.lightColorScheme.primary,
          foregroundColor: AppColors.lightColorScheme.onPrimary,
          textStyle: AppTextStyles.lightTextTheme.labelLarge,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.lightColorScheme.surfaceVariant.withOpacity(0.5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: AppColors.lightColorScheme.primary, width: 2.0),
        ),
        labelStyle: AppTextStyles.lightTextTheme.bodyMedium?.copyWith(color: AppColors.lightColorScheme.onSurfaceVariant),
        hintStyle: AppTextStyles.lightTextTheme.bodyMedium?.copyWith(color: AppColors.lightColorScheme.onSurfaceVariant.withOpacity(0.7)),
      ),
      useMaterial3: true,
      // Add other component themes as needed
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: AppColors.darkColorScheme,
      textTheme: AppTextStyles.darkTextTheme,
      scaffoldBackgroundColor: AppColors.darkColorScheme.background,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.darkColorScheme.surface, // Or primary for more pop
        foregroundColor: AppColors.darkColorScheme.onSurface, // For title and icons
        elevation: 4.0,
        titleTextStyle: AppTextStyles.darkTextTheme.titleLarge?.copyWith(color: AppColors.darkColorScheme.onSurface),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.darkColorScheme.primary,
          foregroundColor: AppColors.darkColorScheme.onPrimary,
          textStyle: AppTextStyles.darkTextTheme.labelLarge,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkColorScheme.surfaceVariant.withOpacity(0.5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: AppColors.darkColorScheme.primary, width: 2.0),
        ),
        labelStyle: AppTextStyles.darkTextTheme.bodyMedium?.copyWith(color: AppColors.darkColorScheme.onSurfaceVariant),
        hintStyle: AppTextStyles.darkTextTheme.bodyMedium?.copyWith(color: AppColors.darkColorScheme.onSurfaceVariant.withOpacity(0.7)),
      ),
      useMaterial3: true,
      // Add other component themes as needed
    );
  }
}
