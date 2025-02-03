import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors.dart';

class CustomPassword extends StatefulWidget {
  final TextEditingController controller;
  final void Function(String) onChanged;
  final String hint;
  final TextInputType keyboardType;
  final FontWeight weight;
  final String? Function(String?)? validator;
  final Color? color;
  final FocusNode focus;
  const CustomPassword(
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
  State<CustomPassword> createState() => _CustomPasswordState();
}

class _CustomPasswordState extends State<CustomPassword> {
  bool obscured = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: widget.color),
      child: TextFormField(
        validator: widget.validator,
        onTapOutside: (event) {
          widget.focus.unfocus();
        },
        controller: widget.controller,
        obscureText: obscured,
        style: TextStyle(
          fontSize: 16.0,
          color: AppColors.black2,
          fontWeight: widget.weight,
        ),
        cursorColor: AppColors.black70,
        keyboardType: widget.keyboardType,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 8, top: 12.h),
          hintText: widget.hint,
          suffixIcon: GestureDetector(
            child: Padding(
              padding: EdgeInsets.only(right: 8.0, top: 15.h),
              child: Text(
                obscured ? 'SHOW' : 'HIDE',
                style: TextStyle(
                    color: Color(0xFF5A5A5A),
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ),
            onTap: () {
              setState(() {
                obscured = !obscured;
              });
            },
          ),
          hintStyle: const TextStyle(
            fontSize: 16.0,
            color: AppColors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        focusNode: widget.focus,
      ),
    );
  }
}
