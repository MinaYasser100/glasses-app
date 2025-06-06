import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(const RegisterState());

  void updateUsername(String? username) {
    emit(
      state.copyWith(
        username: username,
        usernameError: _validateUsername(username),
      ),
    );
  }

  void updateEmail(String? email) {
    emit(state.copyWith(email: email, emailError: _validateEmail(email)));
  }

  void updatePassword(String? password) {
    emit(
      state.copyWith(
        password: password,
        passwordError: _validatePassword(password),
        confirmPasswordError: _validateConfirmPassword(
          state.confirmPassword,
          password,
        ),
      ),
    );
  }

  void updateConfirmPassword(String? confirmPassword) {
    emit(
      state.copyWith(
        confirmPassword: confirmPassword,
        confirmPasswordError: _validateConfirmPassword(
          confirmPassword,
          state.password,
        ),
      ),
    );
  }

  void togglePasswordVisibility() {
    emit(state.copyWith(obscurePassword: !state.obscurePassword));
  }

  void toggleConfirmPasswordVisibility() {
    emit(state.copyWith(obscureConfirmPassword: !state.obscureConfirmPassword));
  }

  bool validateForm() {
    final usernameError = _validateUsername(state.username);
    final emailError = _validateEmail(state.email);
    final passwordError = _validatePassword(state.password);
    final confirmPasswordError = _validateConfirmPassword(
      state.confirmPassword,
      state.password,
    );

    emit(
      state.copyWith(
        usernameError: usernameError,
        emailError: emailError,
        passwordError: passwordError,
        confirmPasswordError: confirmPasswordError,
      ),
    );

    return usernameError == null &&
        emailError == null &&
        passwordError == null &&
        confirmPasswordError == null;
  }

  String? _validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username must not be empty';
    }
    return null;
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

  String? _validateConfirmPassword(String? confirmPassword, String? password) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Confirm Password must not be empty';
    }
    if (confirmPassword != password) {
      return 'Passwords do not match';
    }
    return null;
  }
}
