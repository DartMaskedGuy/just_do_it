import 'package:do_it/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ExpandedTextField extends StatelessWidget {
  final String? text;
  final bool? enabled;
  final TextEditingController controller;

  const ExpandedTextField({
    super.key,
    this.text,
    this.enabled,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 91,
      child: TextFormField(
        enabled: enabled,
        initialValue: text,
        controller: controller,
        style: const TextStyle(
          fontSize: 12,
          color: AppColors.greyText,
          fontWeight: FontWeight.w400,
        ),
        maxLines: null,
        expands: true,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 8,
          ),
          isCollapsed: true,
          filled: true,
          fillColor: Colors.transparent,
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 0.5, color: Colors.grey.shade600),
            borderRadius: const BorderRadius.all(Radius.circular(4)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0.5, color: Colors.grey.shade600),
            borderRadius: const BorderRadius.all(Radius.circular(4)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0.5, color: Colors.grey.shade600),
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
        ),
      ),
    );
  }
}
