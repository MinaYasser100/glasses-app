import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glasses_app/register/manager/register_cubit.dart';
import 'package:glasses_app/register/ui/widgets/custom_text_filed.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 80, 136, 133),
        title: const Text(
          'Register',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: BlocBuilder<RegisterCubit, RegisterState>(
          builder: (context, state) {
            return ListView(
              shrinkWrap: true, // Make ListView take only needed space
              children: [
                CustomTextField(
                  focusNode: FocusNode(),
                  hintText: 'User name',
                  icon: Icons.person,
                  onChanged:
                      (value) =>
                          context.read<RegisterCubit>().updateUsername(value),
                  errorText: state.usernameError,
                  textInputAction: TextInputAction.next,
                  onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  focusNode: FocusNode(),
                  hintText: 'Email',
                  icon: Icons.email,
                  onChanged:
                      (value) =>
                          context.read<RegisterCubit>().updateEmail(value),
                  errorText: state.emailError,
                  textInputAction: TextInputAction.next,
                  onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  focusNode: FocusNode(),
                  hintText: 'Password',
                  icon: Icons.lock,
                  obscureText: state.obscurePassword,
                  onChanged:
                      (value) =>
                          context.read<RegisterCubit>().updatePassword(value),
                  errorText: state.passwordError,
                  textInputAction: TextInputAction.next,
                  onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      state.obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.white,
                    ),
                    onPressed:
                        () =>
                            context
                                .read<RegisterCubit>()
                                .togglePasswordVisibility(),
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  focusNode: FocusNode(),
                  hintText: 'Confirm Password',
                  icon: Icons.lock,
                  obscureText: state.obscureConfirmPassword,
                  onChanged:
                      (value) => context
                          .read<RegisterCubit>()
                          .updateConfirmPassword(value),
                  errorText: state.confirmPasswordError,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) {
                    if (context.read<RegisterCubit>().validateForm()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data…')),
                      );
                    }
                  },
                  suffixIcon: IconButton(
                    icon: Icon(
                      state.obscureConfirmPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.white,
                    ),
                    onPressed:
                        () =>
                            context
                                .read<RegisterCubit>()
                                .toggleConfirmPasswordVisibility(),
                  ),
                ),
                const SizedBox(height: 50),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (context.read<RegisterCubit>().validateForm()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data…')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(
                        200,
                        50,
                      ), // Ensure button width is reasonable
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(
                        color: Color.fromARGB(255, 54, 85, 88),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
