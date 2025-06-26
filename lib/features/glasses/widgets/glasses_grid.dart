import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/widgets/common_widgets.dart';
import '../viewmodel/glasses_cubit.dart';
import '../viewmodel/glasses_state.dart';
import 'glasses_item_widget.dart';

class GlassesGrid extends StatelessWidget {
  final String category;

  const GlassesGrid({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlassesCubit, GlassesState>(
      builder: (context, state) {
        if (state is GlassesLoading) {
          return const LoadingWidget(message: 'Loading glasses...');
        }

        if (state is GlassesError) {
          return EmptyStateWidget(
            message: state.message,
            icon: Icons.error_outline,
            onRetry: () =>
                context.read<GlassesCubit>().loadGlassesByCategory(category),
            retryText: 'Retry',
          );
        }

        if (state is GlassesLoaded) {
          if (state.glasses.isEmpty) {
            return const EmptyStateWidget(
              message: 'No glasses available',
              icon: Icons.remove_red_eye_outlined,
            );
          }

          return GridView.builder(
            padding: const EdgeInsets.all(AppDimensions.paddingSmall),
            itemCount: state.glasses.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: AppDimensions.gridCrossAxisCount,
              childAspectRatio: AppDimensions.gridChildAspectRatio,
              crossAxisSpacing: AppDimensions.gridSpacing,
              mainAxisSpacing: AppDimensions.gridSpacing,
              mainAxisExtent: AppDimensions.cardHeight,
            ),
            itemBuilder: (context, index) {
              final glasses = state.glasses[index];
              return GlassesItemWidget(
                glasses: glasses,
                onAddToCart: () =>
                    context.read<GlassesCubit>().addToCart(glasses),
              );
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
