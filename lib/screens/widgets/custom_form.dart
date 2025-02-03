import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class CustomForm extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String) onChanged;
  final String hint;
  final TextInputType keyboardType;
  final FontWeight weight;
  final String? Function(String?)? validator;
  final Color? color;
  final FocusNode focus;
  const CustomForm(
      {super.key,
      required this.controller,
      required this.focus,
      this.weight = FontWeight.w300,
      this.validator,
      required this.keyboardType,
      required this.onChanged,
      this.color,
      required this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.infinity,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(8), color: color),
      child: TextFormField(
        validator: validator,
        controller: controller,
        focusNode: focus,
        style: TextStyle(
          fontSize: 16.0,
          color: AppColors.black2,
          fontWeight: weight,
        ),
        onTapOutside: (event) {
          focus.unfocus();
        },
        cursorColor: AppColors.black70,
        keyboardType: keyboardType,
        onChanged: onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          hintText: hint,
          hintStyle: const TextStyle(
            fontSize: 16.0,
            color: AppColors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
