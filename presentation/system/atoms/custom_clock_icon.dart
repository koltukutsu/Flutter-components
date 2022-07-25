import 'package:flutter/material.dart';
import 'package:talebe_app/ui/theme/colors.dart';

class CustomClockIcon extends StatelessWidget {
  const CustomClockIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.watch_later,
      color: AppColors.white,
    );
  }
}
