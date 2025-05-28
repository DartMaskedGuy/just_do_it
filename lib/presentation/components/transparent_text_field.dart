import 'package:flutter/material.dart';

class TransparentTextField extends StatelessWidget {
  final Widget? prefixIcon;
  const TransparentTextField({super.key, this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: prefixIcon,
          ),
        ),
      ),
    );
  }
}
