import 'package:flutter/material.dart';
import 'package:talebe_app/ui/theme/colors.dart';

class CustomScrollingDateCard extends StatelessWidget {
  final bool chosen;
  final Widget customWidget;
  const CustomScrollingDateCard({Key? key, this.chosen = false, required this.customWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
          color: AppColors.unchosenScrollingDateCardColor,
          border:
              Border.all(color: AppColors.unchosenScrollingDateCardBorderColor),
          boxShadow: const [
            BoxShadow(
              color: AppColors.shadowBlueDarker,
              spreadRadius: 0.2,
              blurRadius: 0.7,
              offset: Offset(0.8, 2),
            )
          ],
          borderRadius: BorderRadius.circular(8.0),
          gradient: chosen
              ? const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    AppColors.scrollingDateCardColorTop,
                    AppColors.scrollingDateCardColorBottom,
                  ],
                  tileMode: TileMode.mirror,
                )
              : null,
        ),
        child: customWidget);
  }
}
