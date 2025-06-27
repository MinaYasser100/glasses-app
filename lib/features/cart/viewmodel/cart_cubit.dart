import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glasses_app/models/cart_item.dart';
import '../../../models/glasses.dart';
import '../../../services/cart_service.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartService _cartService;

  CartCubit(this._cartService) : super(CartInitial());

  Future<void> loadCart() async {
    try {
      emit(CartLoading());

      // Dummy glasses object (customize fields as needed)
      final dummyGlasses = Glasses(
        id: "1",
        name: 'Stylish Sunglasses',
        price: 320.0,
        description: 'Elegant sunglasses with black frame and beachy style.',
        image: '', category: '',
      );

      // Dummy cart item
      final dummyItem = CartItem(
        id: "1",
        glasses: dummyGlasses,
        quantity: 2,
        addedAt: DateTime.now(),
      );

      // Emit dummy state
      emit(CartLoaded(
        items: [],
        totalPrice: dummyGlasses.price * 2,
        itemCount: 2,
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
