import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final TextStyle style;
  final Color btnColor;
  final BorderRadiusGeometry borderRadius;
  final Function onPressed;
  final bool hasElevation;
  const CustomButton(
      {super.key,
      required this.height,
      required this.width,
      required this.text,
      required this.style,
      required this.borderRadius,
      required this.onPressed,
      this.hasElevation = true,
      required this.btnColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: hasElevation ? 4 : 0,
          backgroundColor: btnColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
        onPressed: () {
          onPressed();
        },
        child: Text(
          text,
          style: style,
        ),
      ),
    );
  }
}
