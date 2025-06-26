import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/custom_button.dart';
import '../viewmodel/register_cubit.dart';

class RegisterSubmitButton extends StatelessWidget {
  final VoidCallback onPressed;

  const RegisterSubmitButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return CustomElevatedButton(
          text: AppStrings.register,
          onPressed: onPressed,
          isLoading: state.isLoading,
        );
      },
    );
  }
}
