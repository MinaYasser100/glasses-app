import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/widgets/common_widgets.dart' as CommonWidgets;
import '../viewmodel/glasses_cubit.dart';
import '../viewmodel/glasses_state.dart';
import 'glasses_item_widget.dart';

class GlassesList extends StatelessWidget {
  const GlassesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlassesCubit, GlassesState>(
      builder: (context, state) {
        if (state is GlassesLoading) {
          return const CommonWidgets.LoadingWidget();
        }

        if (state is GlassesError) {
          return CommonWidgets.ErrorWidget(
            message: state.message,
            onRetry: () => context.read<GlassesCubit>().loadAllGlasses(),
          );
        }

        if (state is GlassesLoaded) {
          if (state.glasses.isEmpty) {
            return const CommonWidgets.EmptyStateWidget(
                message: 'No glasses found');
          }

          return Padding(
            padding: const EdgeInsets.all(AppDimensions.paddingMedium),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: AppDimensions.gridCrossAxisCount,
                childAspectRatio: AppDimensions.gridChildAspectRatio,
                crossAxisSpacing: AppDimensions.gridSpacing,
                mainAxisSpacing: AppDimensions.gridSpacing,
              ),
              itemCount: state.glasses.length,
              itemBuilder: (context, index) {
                return GlassesItemWidget(
                  glasses: state.glasses[index],
                  onAddToCart: () {
                    context
                        .read<GlassesCubit>()
                        .addToCart(state.glasses[index]);
                  },
                );
              },
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
