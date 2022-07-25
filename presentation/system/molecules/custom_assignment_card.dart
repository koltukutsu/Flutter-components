import 'package:flutter/material.dart';
import 'package:talebe_app/ui/theme/colors.dart';

class CustomAssignmentCard extends StatelessWidget {
  final List<Widget> customWidget;

  const CustomAssignmentCard({Key? key, required this.customWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: AppColors.shadowBlueDarker,
              spreadRadius: 0.2,
              blurRadius: 0.7,
              offset: Offset(0.8, 2),
            )
          ],
          borderRadius: BorderRadius.circular(8.0),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              AppColors.assignmentGradientTop,
              AppColors.assignmentGradientBottom,
            ],
            tileMode: TileMode.mirror,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: customWidget,
        ));
  }
}
