import 'package:flutter/material.dart';
import 'package:phone_text_field/phone_text_field.dart';

class CustomPhoneTextField extends StatelessWidget {
  const CustomPhoneTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return PhoneTextField(
      locale: const Locale('en'),
      decoration: const InputDecoration(
        filled: true,
        contentPadding: EdgeInsets.zero,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(),
        ),
        prefixIcon: Icon(Icons.phone),
        labelText: "Phone number",
      ),
      searchFieldInputDecoration: const InputDecoration(
        filled: true,
        fillColor: Colors.transparent,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(),
        ),
        suffixIcon: Icon(Icons.search),
        hintText: "Search country",
      ),
      initialCountryCode: "AE",
      onChanged: (phone) {
        debugPrint(phone.completeNumber);
      },
    );
  }
}
