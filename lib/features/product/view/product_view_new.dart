import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../widgets/product_app_bar.dart';
import '../widgets/product_grid.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      appBar: ProductAppBar(),
      body: ProductGrid(),
    );
  }
}
