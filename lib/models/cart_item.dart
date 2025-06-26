import 'package:equatable/equatable.dart';
import 'glasses.dart';

class CartItem extends Equatable {
  final String id;
  final Glasses glasses;
  final int quantity;
  final DateTime addedAt;

  const CartItem({
    required this.id,
    required this.glasses,
    required this.quantity,
    required this.addedAt,
  });

  double get totalPrice => glasses.price * quantity;

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'] ?? '',
      glasses: Glasses.fromJson(json['glasses'] ?? {}),
      quantity: json['quantity'] ?? 1,
      addedAt: DateTime.fromMillisecondsSinceEpoch(json['addedAt'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'glasses': glasses.toJson(),
      'quantity': quantity,
      'addedAt': addedAt.millisecondsSinceEpoch,
    };
  }

  CartItem copyWith({
    String? id,
    Glasses? glasses,
    int? quantity,
    DateTime? addedAt,
  }) {
    return CartItem(
      id: id ?? this.id,
      glasses: glasses ?? this.glasses,
      quantity: quantity ?? this.quantity,
      addedAt: addedAt ?? this.addedAt,
    );
  }

  @override
  List<Object?> get props => [id, glasses, quantity, addedAt];
}
