import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/glasses.dart';
import '../../../services/glasses_service.dart';
import '../../../services/cart_service.dart';
import 'glasses_state.dart';

class GlassesCubit extends Cubit<GlassesState> {
  final GlassesService _glassesService;
  final CartService _cartService;

  GlassesCubit(this._glassesService, this._cartService)
      : super(GlassesInitial());

  Future<void> loadGlassesByCategory(String category) async {
    try {
      emit(GlassesLoading());

      final glasses = await _glassesService.getGlassesByCategory(category);

      emit(GlassesLoaded(
        glasses: glasses,
        category: category,
      ));
    } catch (e) {
      emit(GlassesError('Failed to load glasses: ${e.toString()}'));
    }
  }

  Future<void> loadAllGlasses() async {
    try {
      emit(GlassesLoading());

      final glasses = await _glassesService.getAllGlasses();

      emit(GlassesLoaded(
        glasses: glasses,
        category: 'All',
      ));
    } catch (e) {
      emit(GlassesError('Failed to load glasses: ${e.toString()}'));
    }
  }

  Future<void> addToCart(Glasses glasses) async {
    try {
      await _cartService.addToCart(glasses);
      emit(GlassesItemAddedToCart('${glasses.name} added to cart'));

      // Re-emit the current state to keep the glasses list visible
      if (state is GlassesLoaded) {
        final currentState = state as GlassesLoaded;
        emit(GlassesLoaded(
          glasses: currentState.glasses,
          category: currentState.category,
        ));
      }
    } catch (e) {
      emit(GlassesError('Failed to add item to cart: ${e.toString()}'));
    }
  }
}
