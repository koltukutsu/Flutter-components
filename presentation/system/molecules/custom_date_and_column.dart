import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talebe_app/cubit/dates/dates_cubit.dart';
import 'package:talebe_app/ui/widgets/atoms/custom_column_linear_gradient_filled.dart';
import 'package:talebe_app/ui/widgets/atoms/custom_text.dart';

class CustomColumnAndDate extends StatelessWidget {
  const CustomColumnAndDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomColumnLinearGradientFilled(),
        BlocBuilder<DatesCubit, DatesState>(
          builder: (context, state) {
            if (state is DatesTakeTheWeekDays) {
              return CustomText(
                text: state.datesList.last["todayName"],
                fontWeight: FontWeight.bold,
                fontSize: 20,
              );
            } else {
              return const CustomText(
                text: "carsamba",
                fontWeight: FontWeight.bold,
                fontSize: 20,
              );
            }
          },
        )
      ],
    );
  }
}
