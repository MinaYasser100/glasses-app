import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_routes.dart';

class RegisterNavigationButton extends StatelessWidget {
  const RegisterNavigationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.register);
        },
        child: const Text(
          AppStrings.registerNow,
          style: TextStyle(color: AppColors.accent),
        ),
      ),
    );
  }
}
