import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glasses_app/login/manager/login_cubit.dart';
import 'package:glasses_app/register/ui/register_screen.dart';
import 'package:glasses_app/register/ui/widgets/custom_text_filed.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return ListView(
                children: [
                  const SizedBox(height: 30),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 43, 73, 77),
                      shape: BoxShape.circle,
                      boxShadow: const [
                        BoxShadow(color: Colors.amber, offset: Offset(3, 3)),
                        BoxShadow(color: Colors.amber, offset: Offset(-3, -3)),
                      ],
                    ),
                    width: 110,
                    height: 110,
                    alignment: Alignment.center,
                    child: const Text(
                      'Log in',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 27,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'WELCOME\n\nwe are excited to have you back, can not wait to see what you have been up to since you last logged in',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    focusNode: FocusNode(),
                    hintText: 'EMAIL',
                    icon: Icons.email,
                    onChanged:
                        (value) =>
                            context.read<LoginCubit>().updateEmail(value),
                    errorText: state.emailError,
                    textInputAction: TextInputAction.next,
                    onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    focusNode: FocusNode(),
                    hintText: 'PASSWORD',
                    icon: Icons.lock,
                    obscureText: state.obscurePassword,
                    onChanged:
                        (value) =>
                            context.read<LoginCubit>().updatePassword(value),
                    errorText: state.passwordError,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) {
                      if (context.read<LoginCubit>().validateForm()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data...')),
                        );
                      }
                    },
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
                                  .read<LoginCubit>()
                                  .togglePasswordVisibility(),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Implement forgot password logic
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Color.fromARGB(255, 71, 112, 110),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (context.read<LoginCubit>().validateForm()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data...')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF365558),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 40,
                        ),
                        elevation: 9,
                      ),
                      child: const Text(
                        'Log in',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Arial',
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterScreen(),
                        ),
                      );
                    },
                    child: Text('Register Now'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
