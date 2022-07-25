import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talebe_app/cubit/dates/dates_cubit.dart';
import 'package:talebe_app/ui/theme/colors.dart';
import 'package:talebe_app/ui/widgets/atoms/custom_clock_icon.dart';
import 'package:talebe_app/ui/widgets/atoms/custom_text.dart';

class CustomClockAndDate extends StatelessWidget {
  const CustomClockAndDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomClockIcon(),
          BlocBuilder<DatesCubit, DatesState>(builder: (context, state) {
            if (state is DatesTakeTheWeekDays) {
              return CustomText(
                  text: state.datesList.last["todayDate"],
                  fontSize: 11,
                  fontWeight: FontWeight.normal,
                  textColor: AppColors.white);
            } else {
              return const CustomText(
                  text: "some date",
                  fontSize: 11,
                  fontWeight: FontWeight.normal,
                  textColor: AppColors.white);
            }
          }),
        ],
      ),
    );
  }
}
