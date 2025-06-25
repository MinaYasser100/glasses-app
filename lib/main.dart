import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glasses_app/cart/cart_page.dart';
import 'package:glasses_app/champer/champer_page.dart';
import 'package:glasses_app/glasses/glasses_page.dart';
import 'package:glasses_app/lenses/lenses_page.dart';
import 'package:glasses_app/login/ui/login_view.dart';
import 'package:glasses_app/places/places_page.dart';
import 'package:glasses_app/product/product_page.dart';
import 'package:glasses_app/register/manager/register_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 54, 85, 88),
          ),
          scaffoldBackgroundColor: Colors.white,
          primaryColor: const Color.fromARGB(255, 54, 85, 88),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              side: const BorderSide(color: Color.fromARGB(255, 54, 85, 88)),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
              elevation: 9,
            ),
          ),
        ),
        initialRoute: '/login',
        routes: {
          '/login': (context) => const LoginScreen(),
          '/product': (context) => const ProductPage(),
          '/places': (context) => const PlacesPage(),
          '/glasses': (context) => const GlassesPage(title: '', glasses: []),
          '/sunglasses': (context) => const GlassesPage(title: '', glasses: []),
          '/lenses': (context) => LensesPage(),
          '/champer': (context) => ChamperPage(),
          '/cart': (context) => const CartPage(cartItems: []),
        },
      ),
    );
  }
}
