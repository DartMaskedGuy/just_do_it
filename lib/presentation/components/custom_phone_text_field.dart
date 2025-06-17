import 'package:do_it/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CustomPhoneTextField extends StatelessWidget {
  const CustomPhoneTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      decoration: InputDecoration(
        labelText: 'Mobile Number',
        labelStyle: const TextStyle(color: AppColors.lightGreyText),
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
      initialCountryCode: 'NG',
      onChanged: (phone) {},
    );
  }
}
