import 'package:do_it/utils/app_colors.dart';
import 'package:flutter/material.dart';

class OutlinedElevatedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const OutlinedElevatedButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 2),
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.primaryText,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
          side: BorderSide(color: AppColors.primary, width: 0.5),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w400,
            color: AppColors.primaryText,
          ),
        ),
      ),
    );
  }
}
