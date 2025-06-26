import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/app_colors.dart';
import '../viewmodel/glasses_cubit.dart';
import '../viewmodel/glasses_state.dart';
import '../widgets/glasses_app_bar.dart';
import '../widgets/glasses_header.dart';
import '../widgets/glasses_grid.dart';

class GlassesView extends StatelessWidget {
  final String title;
  final String category;

  const GlassesView({
    super.key,
    required this.title,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: GlassesAppBar(title: title),
      body: BlocListener<GlassesCubit, GlassesState>(
        listener: (context, state) {
          if (state is GlassesItemAddedToCart) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: AppColors.success,
              ),
            );
          } else if (state is GlassesError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: AppColors.error,
              ),
            );
          }
        },
        child: Column(
          children: [
            GlassesHeader(category: category),
            Expanded(
              child: GlassesGrid(category: category),
            ),
          ],
        ),
      ),
    );
  }
}
