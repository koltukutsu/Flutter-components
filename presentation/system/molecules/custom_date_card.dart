import 'package:flutter/material.dart';
import 'package:talebe_app/ui/theme/colors.dart';
import 'package:talebe_app/ui/widgets/molecules/custom_clock_and_date.dart';
import 'package:talebe_app/ui/widgets/molecules/custom_date_and_column.dart';

class CustomDateCard extends StatelessWidget {
  const CustomDateCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 126,
        height: 111,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowBlueDarker,
              spreadRadius: 0.2,
              blurRadius: 0.7,
              offset: Offset(0.8, 2),
            )
          ],
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8.0), topLeft: Radius.circular(8.0)),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[
              AppColors.cardGradientLeft,
              AppColors.cardGradientRight,
            ],
            tileMode: TileMode.mirror,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            CustomColumnAndDate(),
            CustomClockAndDate(),
          ],
        ));
  }
}
