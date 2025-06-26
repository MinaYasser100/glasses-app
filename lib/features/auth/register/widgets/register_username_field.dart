import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../viewmodel/register_cubit.dart';

class RegisterUsernameField extends StatefulWidget {
  const RegisterUsernameField({super.key});

  @override
  State<RegisterUsernameField> createState() => _RegisterUsernameFieldState();
}

class _RegisterUsernameFieldState extends State<RegisterUsernameField> {
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
          hintText: 'Username',
          icon: Icons.person,
          onChanged: (value) =>
              context.read<RegisterCubit>().updateUsername(value),
          errorText: state.usernameError,
          textInputAction: TextInputAction.next,
          onSubmitted: (_) => FocusScope.of(context).nextFocus(),
        );
      },
    );
  }
}
