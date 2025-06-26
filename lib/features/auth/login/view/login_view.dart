import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../viewmodel/login_cubit.dart';
import '../widgets/login_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(AppDimensions.paddingLarge),
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              // Handle login success/error states here
            },
            builder: (context, state) {
              return const LoginForm();
            },
          ),
        ),
      ),
    );
  }
}
