import 'package:admin/ui/themes/colors.dart';
import 'package:admin/ui/themes/insets.dart';
import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';

class CustomButtonAnimated extends StatefulWidget {
  const CustomButtonAnimated({
    Key? key,
    this.iconColor,
    this.takenIcon,
    this.enableIcon = false,
    required this.label,
    required this.onPressed,
    this.enabled = true,
    this.filled = true,
    this.width = 0.8,
    this.height = 50,
    this.buttonColor = AppColors.primaryBlue,
    this.labelColor = AppColors.white,
    this.fontWeight = FontWeight.w700,
    this.fontSize = 19,
    this.fontFamily = "Inter",
  }) : super(key: key);

  final Color? iconColor;
  final IconData? takenIcon;
  final bool enableIcon;
  final String label;
  final bool filled;
  final bool enabled;
  final VoidCallback onPressed;
  final double width;
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
      padding: const EdgeInsets.all(Insets.s),
      child: AnimatedButton(
        shape: BoxShape.rectangle,
        duration: 90,
        shadowDegree: ShadowDegree.dark,
        onPressed: widget.onPressed,
        enabled: widget.enabled,
        width:widget.width,
        height: widget.height,
        color: widget.enabled
            ? (widget.filled ? widget.buttonColor : AppColors.white)
            : Colors.grey.shade300,
        child: widget.enableIcon == false? Text(
          widget.label,
          style: TextStyle(
            fontFamily: widget.fontFamily,
            fontWeight: widget.fontWeight,
            fontSize: widget.fontSize,
            color: widget.enabled
                ? (widget.filled ? widget.labelColor : AppColors.white)
                : Colors.grey.shade600,
          ),
        ): Icon(widget.takenIcon, color: widget.iconColor),
      ),
    );
  }
}
