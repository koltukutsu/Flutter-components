import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';

class CustomTextButtonForDateCardSlider extends StatelessWidget {
  final VoidCallback onPressed;
  final String itemName;

  const CustomTextButtonForDateCardSlider(
      {Key? key,
      required this.onPressed,
      required this.itemName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(itemName));
  }
}
