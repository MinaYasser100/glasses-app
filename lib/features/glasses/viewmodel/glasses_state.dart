import 'package:equatable/equatable.dart';
import '../../../models/glasses.dart';

abstract class GlassesState extends Equatable {
  const GlassesState();

  @override
  List<Object?> get props => [];
}

class GlassesInitial extends GlassesState {}

class GlassesLoading extends GlassesState {}

class GlassesLoaded extends GlassesState {
  final List<Glasses> glasses;
  final String category;

  const GlassesLoaded({
    required this.glasses,
    required this.category,
  });

  @override
  List<Object?> get props => [glasses, category];
}

class GlassesError extends GlassesState {
  final String message;

  const GlassesError(this.message);

  @override
  List<Object?> get props => [message];
}

class GlassesItemAddedToCart extends GlassesState {
  final String message;

  const GlassesItemAddedToCart(this.message);

  @override
  List<Object?> get props => [message];
}
