import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.title,
      required this.titleStyle,
      required this.color,
      required this.borderRadius});
  final String title;
  final TextStyle titleStyle;
  final Color color;
  final BorderRadius borderRadius;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        onPressed: () {},
        style: ButtonStyle(
            padding: const WidgetStatePropertyAll(EdgeInsets.zero),
            backgroundColor: WidgetStatePropertyAll(color),
            shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(borderRadius: borderRadius))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Text(
            title,
            style: titleStyle,
          ),
        ),
      ),
    );
  }
}
