import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constants/app_routes.dart';
import '../../features/auth/login/view/login_view.dart';
import '../../features/auth/register/view/register_view.dart';
import '../../features/product/view/product_view.dart';
import '../../features/glasses/view/glasses_view.dart';
import '../../features/cart/view/cart_view.dart';
import '../../features/places/view/places_view.dart';
import '../../features/lenses/view/lenses_view.dart';
import '../../features/champer/view/champer_view.dart';
import '../../features/cart/viewmodel/cart_cubit.dart';
import '../../features/glasses/viewmodel/glasses_cubit.dart';
import '../../services/glasses_service.dart';
import '../../services/cart_service.dart';

class AppRouter {
  static final GlassesService _glassesService = GlassesService();
  static final CartService _cartService = CartService();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginView());

      case AppRoutes.register:
        return MaterialPageRoute(builder: (_) => const RegisterView());

      case AppRoutes.product:
        return MaterialPageRoute(builder: (_) => const ProductView());

      case AppRoutes.glasses:
      case AppRoutes.sunglasses:
        final args = settings.arguments as Map<String, dynamic>?;
        final title = args?['title'] ?? 'Glasses';
        final category = args?['category'] ?? 'Preservation glasses';

        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (_) => GlassesCubit(_glassesService, _cartService)
              ..loadGlassesByCategory(category),
            child: GlassesView(title: title, category: category),
          ),
        );

      case AppRoutes.cart:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (_) => CartCubit(_cartService)..loadCart(),
            child: const CartView(),
          ),
        );

      case AppRoutes.places:
        return MaterialPageRoute(builder: (_) => const PlacesView());

      case AppRoutes.lenses:
        final args = settings.arguments as Function()?;
        return MaterialPageRoute(
            builder: (_) => LensesView(
                  onTap: (Map<String, dynamic> item) {},
                ));

      case AppRoutes.champer:
        return MaterialPageRoute(builder: (_) => const ChamperView());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Page not found')),
          ),
        );
    }
  }
}
