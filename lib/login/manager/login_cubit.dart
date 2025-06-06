import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  void updateEmail(String? email) {
    emit(state.copyWith(email: email, emailError: _validateEmail(email)));
  }

  void updatePassword(String? password) {
    emit(
      state.copyWith(
        password: password,
        passwordError: _validatePassword(password),
      ),
    );
  }

  void togglePasswordVisibility() {
    emit(state.copyWith(obscurePassword: !state.obscurePassword));
  }

  bool validateForm() {
    final emailError = _validateEmail(state.email);
    final passwordError = _validatePassword(state.password);

    emit(state.copyWith(emailError: emailError, passwordError: passwordError));

    return emailError == null && passwordError == null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email must not be empty';
    }
    if (RegExp(r'[\u0600-\u06FF]').hasMatch(value)) {
      return 'Arabic letters are not allowed';
    }
    if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value)) {
      return 'Invalid email format';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password must not be empty';
    }
    return null;
  }
}
