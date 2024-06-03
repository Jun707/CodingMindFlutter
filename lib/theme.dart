import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor = const Color.fromRGBO(30, 144, 255, 1.0);
  static Color primaryAccent = const Color.fromRGBO(135, 206, 250, 1.0);
  static Color secondaryColor = const Color.fromRGBO(245, 245, 245, 1.0);
  static Color secondaryAccent = const Color.fromRGBO(220, 220, 220, 1.0);
  static Color titleColor = const Color.fromARGB(255, 12, 0, 0);
  static Color textColor = const Color.fromARGB(255, 12, 0, 0);
  static Color successColor = const Color.fromRGBO(9, 149, 110, 1);
  static Color highlightColor = const Color.fromRGBO(212, 172, 13, 1);
}

ThemeData primaryTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryAccent,
    ),
    scaffoldBackgroundColor: AppColors.secondaryColor,
    appBarTheme: AppBarTheme(
        backgroundColor: AppColors.secondaryAccent,
        foregroundColor: AppColors.textColor,
        surfaceTintColor: Colors.transparent,
        centerTitle: true),
    textTheme: TextTheme(
      bodyMedium:
          TextStyle(color: AppColors.textColor, fontSize: 16, letterSpacing: 1),
      headlineMedium: TextStyle(
          color: AppColors.titleColor, fontSize: 16, letterSpacing: 1),
      titleMedium: TextStyle(
          color: AppColors.titleColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          letterSpacing: 2),
    ),
    cardTheme: CardTheme(
        color: AppColors.secondaryColor.withOpacity(0.8),
        surfaceTintColor: Colors.transparent,
        margin: const EdgeInsets.only(bottom: 10)),
        
    inputDecorationTheme: InputDecorationTheme( 
      filled: true,
      fillColor: AppColors.primaryAccent.withOpacity(0.5),
      border:InputBorder.none,
      labelStyle: TextStyle(color: AppColors.textColor),
    ),
    
    dialogTheme: DialogTheme(
      backgroundColor: AppColors.primaryAccent,
      surfaceTintColor: AppColors.primaryAccent,
    )
    );

