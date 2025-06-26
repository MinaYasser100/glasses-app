import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/widgets/common_widgets.dart' as CommonWidgets;
import '../viewmodel/cart_cubit.dart';
import '../viewmodel/cart_state.dart';
import 'cart_item_widget.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const CommonWidgets.LoadingWidget();
        }

        if (state is CartError) {
          return CommonWidgets.ErrorWidget(
            message: state.message,
            onRetry: () => context.read<CartCubit>().loadCart(),
          );
        }

        if (state is CartLoaded) {
          if (state.items.isEmpty) {
            return const CommonWidgets.EmptyStateWidget(
              message: 'Your cart is empty',
              icon: Icons.shopping_cart_outlined,
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(AppDimensions.paddingMedium),
            itemCount: state.items.length,
            separatorBuilder: (context, index) => const SizedBox(
              height: AppDimensions.spacingMedium,
            ),
            itemBuilder: (context, index) {
              return CartItemWidget(
                item: state.items[index],
                onQuantityChanged: (newQuantity) {
                  context.read<CartCubit>().updateQuantity(
                        state.items[index].id,
                        newQuantity,
                      );
                },
                onRemove: () {
                  context
                      .read<CartCubit>()
                      .removeFromCart(state.items[index].id);
                },
              );
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
