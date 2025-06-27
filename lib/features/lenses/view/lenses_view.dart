import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../widgets/lenses_app_bar.dart';
import '../widgets/lenses_header.dart';
import '../widgets/lenses_list.dart';

class LensesView extends StatelessWidget {
  const LensesView({super.key, required this.onTap});
  final void Function(Map<String, dynamic> item) onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const LensesAppBar(),
      body: Column(
        children: [
          const LensesHeader(),
          Expanded(child: LensesList(
            onTap:  (item) {

              onTap(item);
            },
          )),
        ],
      ),
    );
  }
}
