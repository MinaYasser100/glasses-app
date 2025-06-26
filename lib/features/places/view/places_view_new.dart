import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../widgets/places_app_bar.dart';
import '../widgets/places_list_widget.dart';

class PlacesView extends StatelessWidget {
  const PlacesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      appBar: PlacesAppBar(),
      body: PlacesList(),
    );
  }
}
