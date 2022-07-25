import 'package:flutter/material.dart';
import 'package:talebe_app/ui/theme/colors.dart';
import 'package:talebe_app/ui/widgets/atoms/custom_button.dart';
import 'package:talebe_app/ui/widgets/molecules/custom_text_field_with_linear_gradient.dart';
import 'package:talebe_app/utils/routes.dart';

class CustomLoginSection extends StatelessWidget {
  final TextEditingController firstController;
  final TextEditingController secondController;
  final TextEditingController thirdController;

  const CustomLoginSection(
      {Key? key,
      required this.firstController,
      required this.secondController,
      required this.thirdController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomTextFieldWithLinearGradient(
              controller: firstController,
              label: "Vakıf Kullanıcı İsmi",
              hint: "",
              labelColor: AppColors.white,
              labelFontFamily: "Inter",
              labelFontSize: 19,
              labelFontWeight: FontWeight.normal),
          CustomTextFieldWithLinearGradient(
              controller: secondController,
              label: "Talebe Kullanıcı İsmi",
              hint: "",
              labelColor: AppColors.white,
              labelFontFamily: "Inter",
              labelFontSize: 19,
              labelFontWeight: FontWeight.normal),
          CustomTextFieldWithLinearGradient(
              controller: thirdController,
              label: "Talebe Şifre",
              hint: "",
              labelColor: AppColors.white,
              labelFontFamily: "Inter",
              labelFontSize: 19,
              labelFontWeight: FontWeight.normal),
          CustomButtonAnimated(
              label: "Giriş Yap",
              onPressed: () {
                // Navigator.push(
                //     context,
                //     FadeInRoute(
                //         page: const StudentMainScreen(),
                //         routeName: ROUTE_MAIN));
                Navigator.popAndPushNamed(context, ROUTE_MAIN);
              },
              buttonColor: AppColors.buttonBlue,
              labelColor: AppColors.white,
              fontFamily: "Inter",
              fontWeight: FontWeight.w700,
              fontSize: 19,
              widthRatio: 0.85,
              filled: true,
              enabled: true,
              height: 52),
        ],
      ),
    );
  }
}
