import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../viewmodel/login_cubit.dart';

class LoginPasswordField extends StatelessWidget {
  final VoidCallback onSubmitted;

  const LoginPasswordField({
    super.key,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return CustomTextField(
          hintText: AppStrings.password,
          icon: Icons.lock,
          obscureText: state.obscurePassword,
          onChanged: (value) =>
              context.read<LoginCubit>().updatePassword(value),
          errorText: state.passwordError,
          textInputAction: TextInputAction.done,
          onSubmitted: (_) => onSubmitted(),
          suffixIcon: IconButton(
            icon: Icon(
              state.obscurePassword ? Icons.visibility_off : Icons.visibility,
              color: Colors.white,
            ),
            onPressed: () =>
                context.read<LoginCubit>().togglePasswordVisibility(),
          ),
        );
      },
    );
  }
}
