import 'package:equatable/equatable.dart';

class Glasses extends Equatable {
  final String id;
  final String image;
  final double price;
  final String name;
  final String category;
  final String? description;

  const Glasses({
    required this.id,
    required this.image,
    required this.price,
    required this.name,
    required this.category,
    this.description,
  });

  factory Glasses.fromJson(Map<String, dynamic> json) {
    return Glasses(
      id: json['id'] ?? '',
      image: json['image'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      name: json['name'] ?? '',
      category: json['category'] ?? '',
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'price': price,
      'name': name,
      'category': category,
      'description': description,
    };
  }

  Glasses copyWith({
    String? id,
    String? image,
    double? price,
    String? name,
    String? category,
    String? description,
  }) {
    return Glasses(
      id: id ?? this.id,
      image: image ?? this.image,
      price: price ?? this.price,
      name: name ?? this.name,
      category: category ?? this.category,
      description: description ?? this.description,
    );
  }

  @override
  List<Object?> get props => [id, image, price, name, category, description];
}
