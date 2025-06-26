import 'package:flutter/material.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_routes.dart';
import 'product_category_card.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        'title': 'Preservation glasses',
        'imagePath': 'images/preservation_glasses.jpg',
        'route': AppRoutes.glasses,
      },
      {
        'title': 'Sunglasses',
        'imagePath': 'images/sunglasses.jpg',
        'route': AppRoutes.sunglasses,
      },
      {
        'title': 'Medical glasses',
        'imagePath': 'images/medical_glasses.jpg',
        'route': AppRoutes.glasses,
      },
      {
        'title': 'Sports glasses',
        'imagePath': 'images/sports_glasses.jpg',
        'route': AppRoutes.glasses,
      },
      {
        'title': 'Reading glasses',
        'imagePath': 'images/reading_glasses.jpg',
        'route': AppRoutes.glasses,
      },
      {
        'title': 'Blue light glasses',
        'imagePath': 'images/blue_light_glasses.jpg',
        'route': AppRoutes.glasses,
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(AppDimensions.paddingMedium),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: AppDimensions.gridCrossAxisCount,
          childAspectRatio: AppDimensions.gridChildAspectRatio,
          crossAxisSpacing: AppDimensions.gridSpacing,
          mainAxisSpacing: AppDimensions.gridSpacing,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return ProductCategoryCard(
            title: category['title'] as String,
            imagePath: category['imagePath'] as String,
            onTap: () {
              Navigator.pushNamed(
                context,
                category['route'] as String,
                arguments: {
                  'title': category['title'],
                  'category': category['title'],
                },
              );
            },
          );
        },
      ),
    );
  }
}
