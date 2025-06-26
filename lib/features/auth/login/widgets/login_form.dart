import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_routes.dart';
import '../viewmodel/login_cubit.dart';
import 'login_logo.dart';
import 'welcome_text.dart';
import 'login_email_field.dart';
import 'login_password_field.dart';
import 'forgot_password_button.dart';
import 'login_button.dart';
import 'register_navigation_button.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: AppDimensions.paddingXLarge),
        const LoginLogo(),
        const SizedBox(height: AppDimensions.paddingXLarge),
        const WelcomeText(),
        const SizedBox(height: AppDimensions.paddingXLarge),
        const LoginEmailField(),
        const SizedBox(height: AppDimensions.paddingLarge),
        LoginPasswordField(
          onSubmitted: () => _handleLogin(context),
        ),
        const SizedBox(height: AppDimensions.paddingXLarge),
        const ForgotPasswordButton(),
        const SizedBox(height: AppDimensions.paddingXLarge),
        LoginButton(
          onPressed: () => _handleLogin(context),
        ),
        const SizedBox(height: AppDimensions.paddingMedium),
        const RegisterNavigationButton(),
      ],
    );
  }

  void _handleLogin(BuildContext context) {
    if (context.read<LoginCubit>().validateForm()) {
      // Navigate to product page on successful login
      Navigator.pushReplacementNamed(context, AppRoutes.product);
    }
  }
}
