import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {required this.hintText,
      this.obscureText = false,
      required this.textColor,
      required this.enableColor,
      required this.onChanged,
      // this.focuseColor,
      // this.hintColor,
      this.borderRadius = 10});
  String hintText;
  bool obscureText;
  Color? textColor; //hintColor;
  Color enableColor; //focuseColor;
  double borderRadius;
  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data!.isEmpty) return 'field is required';
      },
      onChanged: onChanged,
      obscureText: obscureText,
      style: TextStyle(color: textColor),
      decoration: InputDecoration(
        // fillColor: Colors.grey.shade100,
        // filled: true,
        hintText: hintText,
        hintStyle: TextStyle(color: enableColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: enableColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          // borderSide: BorderSide(
          //   color: focuseColor,
          // ),
        ),
      ),
    );
  }
}
