
import 'package:calculador_flutter/core/app_colors.dart';
import 'package:calculador_flutter/screens/imc_home-screens.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CalculadoraIMCApp());
}

class CalculadoraIMCApp extends StatelessWidget {
  const CalculadoraIMCApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora IMC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Configuración del tema principal
        primarySwatch: MaterialColor(
          0xFFE91E63,
          <int, Color>{
            50: AppColors.primary.withOpacity(0.1),
            100: AppColors.primary.withOpacity(0.2),
            200: AppColors.primary.withOpacity(0.3),
            300: AppColors.primary.withOpacity(0.4),
            400: AppColors.primary.withOpacity(0.5),
            500: AppColors.primary,
            600: AppColors.primary.withOpacity(0.7),
            700: AppColors.primary.withOpacity(0.8),
            800: AppColors.primary.withOpacity(0.9),
            900: AppColors.primary,
          },
        ),
        
        // Configuración del tema oscuro
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.background,
        
        // Configuración de la AppBar
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.backgroundComponent,
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
        
        // Configuración de botones
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            elevation: 4,
            shadowColor: AppColors.primary.withOpacity(0.3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        
        // Configuración del slider
        sliderTheme: SliderThemeData(
          activeTrackColor: AppColors.primary,
          inactiveTrackColor: AppColors.primary.withOpacity(0.3),
          thumbColor: AppColors.primary,
          overlayColor: AppColors.primary.withOpacity(0.2),
          valueIndicatorColor: AppColors.primary,
          valueIndicatorTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        
        // Configuración de texto
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          titleLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      home: const ImcHomeScreen(),
    );
  }
}