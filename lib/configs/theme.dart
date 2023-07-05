import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

class AppColors {
  static const Color primary = Color(0xFF005AC1);
  static const Color primaryVariant1 = Color(0xFF77CEE6);
  static const Color primaryVariant2 = Color(0xFF5695A6);
  static const Color primaryVariant3 = Color(0xFF2E5059);
  static const Color secondary = Color(0xFF575E71);
  static const Color secondaryVariant1 = Color(0xFF8FF28A);
  static const Color secondaryVariant2 = Color(0xFF6AB366);
  static const Color secondaryVariant3 = Color(0xFF447341);
  static const Color background = Color(0xFFFEFBFF);
  static const Color accent = Color(0xFFE2D647);
  static const Color alert = Color(0xFFE04848);
  static const Color black = Color(0xFF2B2B2B);
  static const Color gray = Color(0xFFDCE0E3);
  static const Color grayLight = Color(0xFFEDEEF0);
  static const Color grayMedium = Color(0xFF939393);
  static const Color grayDark = Color(0xFF666666);
  static const Color bisonHide = Color(0xFFC1B7A4);
  static const Color nevadar = Color(0xFF646E75);
  static const Color outline = Color(0xFF74777F);
}

ThemeData reserveTheme() {
  return ThemeData(
    useMaterial3: true,
    canvasColor: Colors.white,
    primaryColor: AppColors.secondary,
    colorScheme: _colorScheme(),
    appBarTheme: _appBarTheme(),
    bottomNavigationBarTheme: _bottomNavigationBarTheme(),
    floatingActionButtonTheme: _floatingActionButtonTheme(),
    tabBarTheme: _tabBarTheme(),
    cardTheme: _cardTheme(),
    dividerColor: AppColors.grayMedium,
    indicatorColor: AppColors.primary,
    popupMenuTheme: _popupMenuTheme(),
    secondaryHeaderColor: AppColors.nevadar,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: _buttonStyle(),
    ),
    outlinedButtonTheme: _outlinedButtonTheme(),
    inputDecorationTheme: _textFieldTheme(),
    iconTheme: _iconThemeData(),
  );
}

IconThemeData _iconThemeData() => const IconThemeData(
      color: AppColors.primary,
    );
OutlinedButtonThemeData _outlinedButtonTheme() => OutlinedButtonThemeData(
      style: ButtonStyle(
        side: MaterialStateProperty.all<BorderSide?>(
          const BorderSide(
            color: AppColors.primary,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );

InputDecorationTheme _textFieldTheme() => InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.grey.shade600),
      fillColor: const Color(0xFFDBE2F9),
      filled: true,
      contentPadding: const EdgeInsets.all(8),
      prefixIconColor: AppColors.primary,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade100),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade100),
      ),
    );

ButtonStyle _buttonStyle() => ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
ColorScheme _colorScheme() {
  return const ColorScheme(
    background: AppColors.background,
    primary: AppColors.primary,
    onPrimary: Colors.white,
    primaryContainer: Color(0xFFD8E2FF),
    onPrimaryContainer: Color(0xFF001A41),
    secondary: Color(0xFF575E71),
    onSecondary: Colors.white,
    secondaryContainer: Color(0xFFDBE2F9),
    onSecondaryContainer: Color(0xFF141B2C),
    onBackground: AppColors.primary,
    surface: Colors.white,
    onSurface: AppColors.grayDark,
    error: Color(0xFFBA1A1A),
    onError: Colors.white,
    brightness: Brightness.light,
    outline: AppColors.outline,
  );
}

AppBarTheme _appBarTheme() {
  return const AppBarTheme(
    backgroundColor: AppColors.primary,
    iconTheme: IconThemeData(color: Colors.white),
  );
}

BottomNavigationBarThemeData _bottomNavigationBarTheme() {
  return const BottomNavigationBarThemeData(
    selectedItemColor: AppColors.primary,
    unselectedItemColor: AppColors.grayDark,
    backgroundColor: Colors.white,
    showUnselectedLabels: true,
  );
}

FloatingActionButtonThemeData _floatingActionButtonTheme() {
  return const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary);
}

TabBarTheme _tabBarTheme() {
  return const TabBarTheme(
    labelColor: Colors.white,
    unselectedLabelColor: Color(0x88FFFFFF),
    indicatorSize: TabBarIndicatorSize.label,
  );
}

CardTheme _cardTheme() {
  return CardTheme(
    elevation: 3.0,
    color: const Color(0xFFFFFFFF),
    surfaceTintColor: Colors.white,
    shape: RoundedRectangleBorder(
      side: const BorderSide(color: Colors.white70, width: 1),
      borderRadius: BorderRadius.circular(12),
    ),
  );
}

PopupMenuThemeData _popupMenuTheme() {
  return const PopupMenuThemeData(
    textStyle: TextStyle(color: AppColors.grayDark),
  );
}

void setSystemUIOverlayStyleLight() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      systemNavigationBarColor: AppColors.grayLight,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
}
