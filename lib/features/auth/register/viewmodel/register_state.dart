part of 'register_cubit.dart';

class RegisterState extends Equatable {
  final String? username;
  final String? email;
  final String? password;
  final String? confirmPassword;
  final String? usernameError;
  final String? emailError;
  final String? passwordError;
  final String? confirmPasswordError;
  final bool obscurePassword;
  final bool obscureConfirmPassword;
  final bool isLoading;
  final bool isSuccess;
  final String? error;

  const RegisterState({
    this.username,
    this.email,
    this.password,
    this.confirmPassword,
    this.usernameError,
    this.emailError,
    this.passwordError,
    this.confirmPasswordError,
    this.obscurePassword = true,
    this.obscureConfirmPassword = true,
    this.isLoading = false,
    this.isSuccess = false,
    this.error,
  });

  @override
  List<Object?> get props => [
        username,
        email,
        password,
        confirmPassword,
        usernameError,
        emailError,
        passwordError,
        confirmPasswordError,
        obscurePassword,
        obscureConfirmPassword,
        isLoading,
        isSuccess,
        error,
      ];

  RegisterState copyWith({
    String? username,
    String? email,
    String? password,
    String? confirmPassword,
    String? usernameError,
    String? emailError,
    String? passwordError,
    String? confirmPasswordError,
    bool? obscurePassword,
    bool? obscureConfirmPassword,
    bool? isLoading,
    bool? isSuccess,
    String? error,
  }) {
    return RegisterState(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      usernameError: usernameError,
      emailError: emailError,
      passwordError: passwordError,
      confirmPasswordError: confirmPasswordError,
      obscurePassword: obscurePassword ?? this.obscurePassword,
      obscureConfirmPassword:
          obscureConfirmPassword ?? this.obscureConfirmPassword,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error,
    );
  }
}
