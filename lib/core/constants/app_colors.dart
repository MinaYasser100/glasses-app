import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color.fromARGB(255, 54, 85, 88);
  static const Color accent = Color.fromARGB(255, 7, 146, 130);
  static const Color background = Colors.white;
  static const Color surface = Colors.white;
  static const Color error = Colors.red;
  static const Color success = Colors.green;
  static const Color warning = Colors.amber;
  static const Color textPrimary = Color.fromARGB(255, 7, 146, 130);
  static const Color textSecondary = Colors.grey;
  static const Color textOnPrimary = Colors.white;
  static const Color shadow = Colors.grey;

  // Gradient colors
  static const List<Color> primaryGradient = [
    Color.fromARGB(255, 54, 85, 88),
    Color.fromARGB(255, 43, 73, 77),
  ];

  static const List<Color> accentGradient = [
    Color.fromARGB(255, 7, 146, 130),
    Color.fromARGB(255, 71, 112, 110),
  ];
}
