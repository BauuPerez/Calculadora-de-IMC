import 'package:calculador_flutter/core/app_colors.dart';
import 'package:flutter/material.dart';


class TextStyles {
  // Estilo base para texto del cuerpo
  static const TextStyle bodyText = TextStyle(
    color: AppColors.textPrimary,
    fontFamily: 'Roboto',
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );
  
  // Estilo para títulos principales
  static const TextStyle headingLarge = TextStyle(
    color: AppColors.textPrimary,
    fontFamily: 'Roboto',
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  
  // Estilo para títulos medianos
  static const TextStyle headingMedium = TextStyle(
    color: AppColors.textPrimary,
    fontFamily: 'Roboto',
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  
  // Estilo para subtítulos
  static const TextStyle subtitle = TextStyle(
    color: AppColors.textSecondary,
    fontFamily: 'Roboto',
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
  
  // Estilo para números grandes (como el IMC)
  static const TextStyle numberLarge = TextStyle(
    color: AppColors.primary,
    fontFamily: 'Roboto',
    fontSize: 48,
    fontWeight: FontWeight.bold,
  );
  
  // Estilo para botones
  static const TextStyle button = TextStyle(
    color: Colors.white,
    fontFamily: 'Roboto',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.2,
  );
}