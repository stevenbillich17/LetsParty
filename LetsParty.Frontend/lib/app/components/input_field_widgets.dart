import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  InputField({
    super.key,
    required this.onChanged,
    required this.hintText,
    this.validator,
    this.obscureText = false,
    this.keyboardType,
    this.suffixIcon,
    this.textInputAction,
    this.initialValue = '',
  });

  final String hintText;
  final Function(String?) onChanged;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  String initialValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged,
      keyboardType: keyboardType ?? TextInputType.text,
      textInputAction: textInputAction,
      initialValue: initialValue,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(
            color: Color(0xFFBDBDBD),
          ),
        ),
        hintText: hintText,
        filled: true,
        hintStyle: const TextStyle(
          color: Color(0xFFBDBDBD),
        ),
      ),
    );
  }
}
