import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:talebe_app/ui/theme/colors.dart';
import 'package:talebe_app/ui/theme/insets.dart';
import 'package:talebe_app/ui/widgets/atoms/custom_linear_gradient.dart';

class CustomButtonAnimated extends StatefulWidget {
  const CustomButtonAnimated({
    Key? key,
    required this.label,
    required this.onPressed,
    this.enabled = true,
    this.filled = true,
    this.widthRatio = 0.8,
    this.height = 50,
    this.buttonColor = AppColors.primaryBlue,
    this.labelColor = AppColors.white,
    this.fontWeight = FontWeight.w700,
    this.fontSize = 19,
    this.fontFamily = "Inter",
    this.insets = Insets.s,
  }) : super(key: key);
  final double insets;
  final String label;
  final bool filled;
  final bool enabled;
  final VoidCallback onPressed;
  final double widthRatio;
  final double height;
  final Color buttonColor;
  final Color labelColor;
  final FontWeight fontWeight;
  final double fontSize;
  final String fontFamily;

  @override
  State<CustomButtonAnimated> createState() => _CustomButtonAnimatedState();
}

class _CustomButtonAnimatedState extends State<CustomButtonAnimated> {
  @override
  Widget build(BuildContext context) {
    // _scale = 1 - _controller.value;

    return Padding(
      padding: EdgeInsets.all(widget.insets),
      child: AnimatedButton(
        shape: BoxShape.rectangle,
        duration: 90,
        shadowDegree: ShadowDegree.dark,
        onPressed: widget.onPressed,
        enabled: widget.enabled,
        width: MediaQuery.of(context).size.width * widget.widthRatio,
        height: widget.height,
        color: widget.enabled
            ? (widget.filled ? widget.buttonColor : AppColors.white)
            : Colors.grey.shade300,
        child: Text(
          widget.label,
          style: TextStyle(
            fontFamily: widget.fontFamily,
            fontWeight: widget.fontWeight,
            fontSize: widget.fontSize,
            color: widget.enabled
                ? (widget.filled ? widget.labelColor : AppColors.white)
                : Colors.grey.shade600,
          ),
        ),
      ),
    );
  }
}
