import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../viewmodel/register_cubit.dart';

class RegisterEmailField extends StatefulWidget {
  const RegisterEmailField({super.key});

  @override
  State<RegisterEmailField> createState() => _RegisterEmailFieldState();
}

class _RegisterEmailFieldState extends State<RegisterEmailField> {
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
          hintText: 'Email',
          icon: Icons.email,
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) =>
              context.read<RegisterCubit>().updateEmail(value),
          errorText: state.emailError,
          textInputAction: TextInputAction.next,
          onSubmitted: (_) => FocusScope.of(context).nextFocus(),
        );
      },
    );
  }
}
