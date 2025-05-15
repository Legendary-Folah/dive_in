import 'package:dive_in_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class DummyButton extends StatelessWidget {
  const DummyButton({
    super.key,
    this.backgroundColor,
    required this.onPressed,
    required this.text,
    this.borderColor = ColorsConst.kBlack,
    required this.style,
  });
  final VoidCallback onPressed;
  final String text;
  final TextStyle style;
  final Color? backgroundColor;
  final Color borderColor;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            side: BorderSide(
              color: borderColor, // your color here
              width: 1,
            ),
            borderRadius: BorderRadius.circular(9),
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          return backgroundColor ?? Colors.brown;
        }),
      ),
      child: Text(text, style: style),
    );
  }
}
