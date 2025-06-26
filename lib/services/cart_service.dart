import '../models/cart_item.dart';
import '../models/glasses.dart';

class CartService {
  static final List<CartItem> _cartItems = [];

  Future<List<CartItem>> getCartItems() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return List.from(_cartItems);
  }

  Future<void> addToCart(Glasses glasses, {int quantity = 1}) async {
    await Future.delayed(const Duration(milliseconds: 300));

    final existingItemIndex = _cartItems.indexWhere(
      (item) => item.glasses.id == glasses.id,
    );

    if (existingItemIndex != -1) {
      // Update quantity if item already exists
      final existingItem = _cartItems[existingItemIndex];
      final updatedItem = existingItem.copyWith(
        quantity: existingItem.quantity + quantity,
      );
      _cartItems[existingItemIndex] = updatedItem;
    } else {
      // Add new item
      final cartItem = CartItem(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        glasses: glasses,
        quantity: quantity,
        addedAt: DateTime.now(),
      );
      _cartItems.add(cartItem);
    }
  }

  Future<void> removeFromCart(String itemId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _cartItems.removeWhere((item) => item.id == itemId);
  }

  Future<void> updateQuantity(String itemId, int quantity) async {
    await Future.delayed(const Duration(milliseconds: 300));

    if (quantity <= 0) {
      await removeFromCart(itemId);
      return;
    }

    final itemIndex = _cartItems.indexWhere((item) => item.id == itemId);
    if (itemIndex != -1) {
      final updatedItem = _cartItems[itemIndex].copyWith(quantity: quantity);
      _cartItems[itemIndex] = updatedItem;
    }
  }

  Future<void> clearCart() async {
    await Future.delayed(const Duration(milliseconds: 300));
    _cartItems.clear();
  }

  Future<double> getTotalPrice() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _cartItems.fold<double>(
        0.0, (total, item) => total + item.totalPrice);
  }

  Future<int> getItemCount() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _cartItems.fold<int>(0, (total, item) => total + item.quantity);
  }
}
