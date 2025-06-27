import 'package:flutter/material.dart';
import 'package:glasses_app/features/order/place_order_screen.dart';
import '../../../../core/constants/app_colors.dart';
import '../widgets/product_app_bar.dart';
import '../widgets/product_grid.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: ProductAppBar(),
      body: Column(
        children: [
          Expanded(child: ProductGrid()),
          // ElevatedButton(
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => PlaceOrderScreen(),
          //         ),
          //       );
          //     },
          //     child: Text("Place Order "))
        ],
      ),
    );
  }
}
