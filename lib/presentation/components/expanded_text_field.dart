import 'package:flutter/material.dart';

class ExpandedTextField extends StatelessWidget {
  const ExpandedTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 91,
      child: TextFormField(
        maxLines: null,
        expands: true,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
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
