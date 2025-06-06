import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final FocusNode focusNode;
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final ValueChanged<String> onChanged;
  final String? errorText;
  final TextInputAction textInputAction;
  final ValueChanged<String>? onSubmitted;
  final Widget? suffixIcon;

  const CustomTextField({
    super.key,
    required this.focusNode,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
    required this.onChanged,
    this.errorText,
    required this.textInputAction,
    this.onSubmitted,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      obscureText: obscureText,
      textInputAction: textInputAction,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        prefixIcon: Icon(icon, color: const Color.fromARGB(255, 43, 73, 77)),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: const Color.fromARGB(255, 80, 136, 133),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        errorText: errorText,
      ),
    );
  }
}
