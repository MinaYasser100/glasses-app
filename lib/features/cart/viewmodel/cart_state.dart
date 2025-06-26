import 'package:equatable/equatable.dart';
import '../../../models/cart_item.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object?> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<CartItem> items;
  final double totalPrice;
  final int itemCount;

  const CartLoaded({
    required this.items,
    required this.totalPrice,
    required this.itemCount,
  });

  @override
  List<Object?> get props => [items, totalPrice, itemCount];
}

class CartError extends CartState {
  final String message;

  const CartError(this.message);

  @override
  List<Object?> get props => [message];
}

class CartItemAdded extends CartState {
  final String message;

  const CartItemAdded(this.message);

  @override
  List<Object?> get props => [message];
}

class CartItemRemoved extends CartState {
  final String message;

  const CartItemRemoved(this.message);

  @override
  List<Object?> get props => [message];
}
