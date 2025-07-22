import 'package:flutter/material.dart';

class ResponsiveUtils {
  static bool isMobile(BuildContext context) => 
      MediaQuery.of(context).size.width < 600;
  
  static bool isTablet(BuildContext context) => 
      MediaQuery.of(context).size.width >= 600 && 
      MediaQuery.of(context).size.width < 1200;
  
  static bool isDesktop(BuildContext context) => 
      MediaQuery.of(context).size.width >= 1200;

  static double getScreenWidth(BuildContext context) => 
      MediaQuery.of(context).size.width;
  
  static double getScreenHeight(BuildContext context) => 
      MediaQuery.of(context).size.height;

  // Paddings responsivos
  static EdgeInsets getHorizontalPadding(BuildContext context) {
    if (isDesktop(context)) return EdgeInsets.symmetric(horizontal: 32);
    if (isTablet(context)) return EdgeInsets.symmetric(horizontal: 24);
    return EdgeInsets.symmetric(horizontal: 16);
  }

  // Espaciado vertical responsivo
  static double getVerticalSpacing(BuildContext context) {
    if (isDesktop(context)) return 24;
    if (isTablet(context)) return 20;
    return 16;
  }
}