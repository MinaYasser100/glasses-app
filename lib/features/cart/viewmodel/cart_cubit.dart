import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/glasses.dart';
import '../../../services/cart_service.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartService _cartService;

  CartCubit(this._cartService) : super(CartInitial());

  Future<void> loadCart() async {
    try {
      emit(CartLoading());

      final items = await _cartService.getCartItems();
      final totalPrice = await _cartService.getTotalPrice();
      final itemCount = await _cartService.getItemCount();

      emit(CartLoaded(
        items: items,
        totalPrice: totalPrice,
        itemCount: itemCount,
      ));
    } catch (e) {
      emit(CartError('Failed to load cart: ${e.toString()}'));
    }
  }

  Future<void> addToCart(Glasses glasses, {int quantity = 1}) async {
    try {
      await _cartService.addToCart(glasses, quantity: quantity);
      emit(CartItemAdded('${glasses.name} added to cart'));

      // Reload cart to get updated state
      await loadCart();
    } catch (e) {
      emit(CartError('Failed to add item to cart: ${e.toString()}'));
    }
  }

  Future<void> removeFromCart(String itemId) async {
    try {
      await _cartService.removeFromCart(itemId);
      emit(CartItemRemoved('Item removed from cart'));

      // Reload cart to get updated state
      await loadCart();
    } catch (e) {
      emit(CartError('Failed to remove item from cart: ${e.toString()}'));
    }
  }

  Future<void> updateQuantity(String itemId, int quantity) async {
    try {
      await _cartService.updateQuantity(itemId, quantity);

      // Reload cart to get updated state
      await loadCart();
    } catch (e) {
      emit(CartError('Failed to update quantity: ${e.toString()}'));
    }
  }

  Future<void> clearCart() async {
    try {
      await _cartService.clearCart();

      // Reload cart to get updated state
      await loadCart();
    } catch (e) {
      emit(CartError('Failed to clear cart: ${e.toString()}'));
    }
  }
}
