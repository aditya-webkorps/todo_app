import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget(
      {super.key,
      required this.hint,
      required this.controller,
      required this.maxLength,
      required this.maxLines,
      required this.minLines,
      required this.textType});

  final TextEditingController controller;
  final String hint;
  final int maxLength;
  final int minLines;
  final int maxLines;
  final TextInputType textType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (value) {},
      keyboardType: textType,
      maxLines: maxLines,
      minLines: minLines,
      autocorrect: false,
      maxLength: maxLength,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black45,
              fontSize: 18.0),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(40.0))),
    );
  }
}
