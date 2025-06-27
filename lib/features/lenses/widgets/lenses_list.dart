import 'package:flutter/material.dart';
import '../../../../core/constants/app_dimensions.dart';
import 'lens_card.dart';

class LensesList extends StatelessWidget {
  const LensesList({super.key, this.onTap});

  final Function(Map<String, dynamic> lens)? onTap;
  final List<Map<String, dynamic>> lensTypes = const [
    {
      'name': 'Single Vision Lenses',
      'description': 'For near or distance vision correction',
      'price': 'Starting from \$25',
      'icon': Icons.visibility,
    },
    {
      'name': 'Bifocal Lenses',
      'description': 'Two different powers in one lens',
      'price': 'Starting from \$45',
      'icon': Icons.remove_red_eye,
    },
    {
      'name': 'Progressive Lenses',
      'description': 'Seamless transition for all distances',
      'price': 'Starting from \$85',
      'icon': Icons.gradient,
    },
    {
      'name': 'Blue Light Blocking',
      'description': 'Protect your eyes from digital strain',
      'price': 'Starting from \$35',
      'icon': Icons.computer,
    },
    {
      'name': 'Photochromic Lenses',
      'description': 'Automatically adjust to light conditions',
      'price': 'Starting from \$65',
      'icon': Icons.wb_sunny,
    },
    {
      'name': 'Anti-Reflective Coating',
      'description': 'Reduce glare and reflections',
      'price': 'Starting from \$15',
      'icon': Icons.auto_awesome,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(AppDimensions.paddingMedium),
      itemCount: lensTypes.length,
      itemBuilder: (context, index) {
        final lens = lensTypes[index];
        return LensCard(
          name: lens['name'],
          description: lens['description'],
          price: 25.0, // Default price, can be extracted from price string
          icon: lens['icon'],
          features: const [], // Add features if needed
          onTap: () {
            onTap!(lens);
          },
        );
      },
    );
  }
}
