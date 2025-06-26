import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';

class LensesHeader extends StatelessWidget {
  const LensesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDimensions.paddingLarge),
      color: AppColors.accent.withOpacity(0.1),
      child: const Column(
        children: [
          Icon(
            Icons.remove_red_eye_outlined,
            size: 48,
            color: AppColors.accent,
          ),
          SizedBox(height: AppDimensions.paddingSmall),
          Text(
            'Choose Your Perfect Lenses',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppDimensions.paddingSmall),
          Text(
            'Select from our wide range of lens options to enhance your vision and comfort',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
