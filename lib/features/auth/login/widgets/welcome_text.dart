import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      '${AppStrings.welcome}\n\n${AppStrings.welcomeMessage}',
      style: TextStyle(color: AppColors.textSecondary, fontSize: 16),
      textAlign: TextAlign.center,
    );
  }
}
