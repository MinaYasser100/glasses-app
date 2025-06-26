import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_strings.dart';

class GlassesHeader extends StatelessWidget {
  final String category;

  const GlassesHeader({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.paddingMedium),
      child: Column(
        children: [
          Image.asset(
            category.toLowerCase().contains('preservation')
                ? 'images/efa4a2012571ece9d62e59ed68ea4e4c6025eea6.jpg'
                : 'images/1af4ef222a502d4eb32a6da3b10ed701c4117327.jpg',
            height: AppDimensions.productImageHeight,
            width: AppDimensions.productImageWidth,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: AppDimensions.productImageHeight,
                width: AppDimensions.productImageWidth,
                color: AppColors.textSecondary.withOpacity(0.3),
                child: const Icon(
                  Icons.image_not_supported,
                  size: 40,
                  color: AppColors.textSecondary,
                ),
              );
            },
          ),
          const SizedBox(height: AppDimensions.paddingMedium),
          const Text(
            AppStrings.checkOurProducts,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
