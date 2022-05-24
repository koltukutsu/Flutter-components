// necessary
import 'package:flutter/material.dart';

// theme
import 'package:hesap/ui/theme/colors.dart';

class MText extends StatelessWidget {
  const MText({
    Key? key,
    required this.label,
  }) : super(key: key);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: Expanded(
        flex: 1,
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
              fontSize: 40.0,
              letterSpacing: -2,
            ),
          ),
        ),
      ),
    );
  }
}
