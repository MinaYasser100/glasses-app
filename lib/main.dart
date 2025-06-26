import 'package:flutter/material.dart';

// Core imports
import 'package:glasses_app/core/theme/app_theme.dart';
import 'package:glasses_app/core/constants/app_routes.dart';
import 'package:glasses_app/core/router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Glasses App',
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.login,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
