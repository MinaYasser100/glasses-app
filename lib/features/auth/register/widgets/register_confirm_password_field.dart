import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../viewmodel/register_cubit.dart';

class RegisterConfirmPasswordField extends StatefulWidget {
  final VoidCallback onSubmitted;

  const RegisterConfirmPasswordField({
    super.key,
    required this.onSubmitted,
  });

  @override
  State<RegisterConfirmPasswordField> createState() =>
      _RegisterConfirmPasswordFieldState();
}

class _RegisterConfirmPasswordFieldState
    extends State<RegisterConfirmPasswordField> {
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return CustomTextField(
          focusNode: _focusNode,
          hintText: 'Confirm Password',
          icon: Icons.lock,
          obscureText: state.obscureConfirmPassword,
          onChanged: (value) =>
              context.read<RegisterCubit>().updateConfirmPassword(value),
          errorText: state.confirmPasswordError,
          textInputAction: TextInputAction.done,
          onSubmitted: (_) => widget.onSubmitted(),
          suffixIcon: IconButton(
            icon: Icon(
              state.obscureConfirmPassword
                  ? Icons.visibility_off
                  : Icons.visibility,
            ),
            onPressed: () =>
                context.read<RegisterCubit>().toggleConfirmPasswordVisibility(),
          ),
        );
      },
    );
  }
}
