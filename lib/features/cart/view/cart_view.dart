import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../widgets/cart_app_bar.dart';
import '../widgets/cart_items_list.dart';
import '../widgets/cart_summary.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CartAppBar(),
      body: const Column(
        children: [
          Expanded(child: CartItemsList()),
          CartSummary(),
        ],
      ),
    );
  }
}
