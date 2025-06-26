import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../viewmodel/register_cubit.dart';
import 'register_username_field.dart';
import 'register_email_field.dart';
import 'register_password_field.dart';
import 'register_confirm_password_field.dart';
import 'register_submit_button.dart';
import 'login_navigation_button.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: AppDimensions.spacingMedium),
        const RegisterUsernameField(),
        const SizedBox(height: AppDimensions.spacingMedium),
        const RegisterEmailField(),
        const SizedBox(height: AppDimensions.spacingMedium),
        RegisterPasswordField(
          onSubmitted: () => FocusScope.of(context).nextFocus(),
        ),
        const SizedBox(height: AppDimensions.spacingMedium),
        RegisterConfirmPasswordField(
          onSubmitted: () => _handleRegister(context),
        ),
        const SizedBox(height: AppDimensions.spacingLarge),
        RegisterSubmitButton(
          onPressed: () => _handleRegister(context),
        ),
        const SizedBox(height: AppDimensions.spacingMedium),
        const LoginNavigationButton(),
      ],
    );
  }

  void _handleRegister(BuildContext context) {
    FocusScope.of(context).unfocus();
    context.read<RegisterCubit>().register();
  }
}
