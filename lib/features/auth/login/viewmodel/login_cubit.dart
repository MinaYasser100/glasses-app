import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_strings.dart';

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
      return AppStrings.emailRequired;
    }
    if (RegExp(r'[\u0600-\u06FF]').hasMatch(value)) {
      return AppStrings.arabicLettersNotAllowed;
    }
    if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value)) {
      return AppStrings.invalidEmailFormat;
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.passwordRequired;
    }
    return null;
  }
}
