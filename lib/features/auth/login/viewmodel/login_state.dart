part of 'login_cubit.dart';

class LoginState extends Equatable {
  final String? email;
  final String? password;
  final String? emailError;
  final String? passwordError;
  final bool obscurePassword;

  const LoginState({
    this.email,
    this.password,
    this.emailError,
    this.passwordError,
    this.obscurePassword = true,
  });

  @override
  List<Object?> get props => [
        email,
        password,
        emailError,
        passwordError,
        obscurePassword,
      ];

  LoginState copyWith({
    String? email,
    String? password,
    String? emailError,
    String? passwordError,
    bool? obscurePassword,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      emailError: emailError,
      passwordError: passwordError,
      obscurePassword: obscurePassword ?? this.obscurePassword,
    );
  }
}
