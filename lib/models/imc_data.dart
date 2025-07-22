import 'dart:ui';

import 'package:flutter/material.dart';

class ImcData {
  final double height;
  final double weight;
  final int age;
  final String gender;

  ImcData({
    required this.height,
    required this.weight,
    required this.age,
    required this.gender,
  });

  double calculateIMC() {
    final heightInMeters = height / 100;
    return weight / (heightInMeters * heightInMeters);
  }

  String getIMCCategory() {
    final imc = calculateIMC();
    if (imc < 18.5) return "Bajo peso";
    if (imc < 25) return "Peso normal";
    if (imc < 30) return "Sobrepeso";
    return "Obesidad";
  }

  Color getIMCColor() {
    final imc = calculateIMC();
    if (imc < 18.5) return Colors.blue;
    if (imc < 25) return Colors.green;
    if (imc < 30) return Colors.orange;
    return Colors.red;
  }
}