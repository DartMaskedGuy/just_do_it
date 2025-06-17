import 'package:do_it/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.obscureText = false,
    required this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        filled: true,
        fillColor: Colors.transparent,
        labelText: hintText,
        labelStyle: const TextStyle(color: AppColors.lightGreyText),
        floatingLabelStyle: const TextStyle(
          color: AppColors.lightGreyText,
          fontSize: 16,
        ),
        suffix: suffixIcon,
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColors.grey),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0.5, color: Colors.grey.shade600),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 1.5, color: AppColors.primaryText),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
