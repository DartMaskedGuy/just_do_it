import 'package:do_it/utils/app_colors.dart';
import 'package:flutter/material.dart';

class TransparentTextField extends StatelessWidget {
  final String? label;
  final Widget? prefixIcon;
  final String? text;
  final bool? enabled;
  final TextEditingController controller;
  final FormFieldValidator? validator;

  const TransparentTextField({
    super.key,
    this.prefixIcon,
    this.label,
    this.text,
    this.enabled,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      initialValue: text,
      controller: controller,
      validator: validator,
      style: const TextStyle(
        fontSize: 14,
        color: AppColors.greyText,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 0),
        labelText: label,
        labelStyle: TextStyle(
          fontSize: 12,
          color: AppColors.lightGreyText,
          height: 3,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: prefixIcon,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 0.5, color: Colors.grey.shade600),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade600),
        ),
      ),
    );
  }
}
