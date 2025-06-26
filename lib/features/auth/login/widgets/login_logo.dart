import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_strings.dart';

class LoginLogo extends StatelessWidget {
  const LoginLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: AppColors.primaryGradient,
          ),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(color: Colors.amber, offset: Offset(3, 3)),
            BoxShadow(color: Colors.amber, offset: Offset(-3, -3)),
          ],
        ),
        width: AppDimensions.logoSize,
        height: AppDimensions.logoSize,
        alignment: Alignment.center,
        child: const Text(
          AppStrings.login,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 27,
          ),
        ),
      ),
    );
  }
}
