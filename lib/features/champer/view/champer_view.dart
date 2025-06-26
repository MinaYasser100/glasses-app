import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../widgets/champer_app_bar.dart';
import '../widgets/champer_content.dart';

class ChamperView extends StatelessWidget {
  const ChamperView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      appBar: ChamperAppBar(),
      body: ChamperContent(),
    );
  }
}
