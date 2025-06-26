import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../viewmodel/register_cubit.dart';

class RegisterPasswordField extends StatefulWidget {
  final VoidCallback onSubmitted;

  const RegisterPasswordField({
    super.key,
    required this.onSubmitted,
  });

  @override
  State<RegisterPasswordField> createState() => _RegisterPasswordFieldState();
}

class _RegisterPasswordFieldState extends State<RegisterPasswordField> {
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
          hintText: 'Password',
          icon: Icons.lock,
          obscureText: state.obscurePassword,
          onChanged: (value) =>
              context.read<RegisterCubit>().updatePassword(value),
          errorText: state.passwordError,
          textInputAction: TextInputAction.next,
          onSubmitted: (_) => widget.onSubmitted(),
          suffixIcon: IconButton(
            icon: Icon(
              state.obscurePassword ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: () =>
                context.read<RegisterCubit>().togglePasswordVisibility(),
          ),
        );
      },
    );
  }
}
