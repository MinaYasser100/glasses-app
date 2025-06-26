import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../widgets/lenses_app_bar.dart';
import '../widgets/lenses_header.dart';
import '../widgets/lenses_list.dart';

class LensesView extends StatelessWidget {
  const LensesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      appBar: LensesAppBar(),
      body: Column(
        children: [
          LensesHeader(),
          Expanded(child: LensesList()),
        ],
      ),
    );
  }
}
