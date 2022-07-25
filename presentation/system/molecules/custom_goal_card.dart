import 'package:flutter/material.dart';
import 'package:talebe_app/ui/theme/colors.dart';

class CustomGoalCard extends StatelessWidget {
  final String goal;

  const CustomGoalCard({Key? key, required this.goal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 2.0),
      child: Center(
        child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: AppColors.primaryBlue,
            borderRadius: BorderRadius.all(
                Radius.circular(20)),
          ),
          height: 54,
          width: MediaQuery.of(context).size.width * 0.13,
          child: Text(goal, style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
