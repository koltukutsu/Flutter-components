import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talebe_app/cubit/dates/dates_cubit.dart';
import 'package:talebe_app/cubit/login/login_cubit.dart';
import 'package:talebe_app/cubit/student/student_cubit.dart';
import 'package:talebe_app/data/repository/login_repository.dart';
import 'package:talebe_app/ui/theme/colors.dart';
import 'package:talebe_app/ui/theme/insets.dart';
import 'package:talebe_app/ui/widgets/atoms/custom_button.dart';
import 'package:talebe_app/ui/widgets/atoms/custom_column_linear_gradient_filled.dart';
import 'package:talebe_app/ui/widgets/atoms/custom_text_button_for_date_card_slider.dart';
import 'package:talebe_app/ui/widgets/molecules/custom_assignment_card.dart';
import 'package:talebe_app/ui/widgets/molecules/custom_goal_card.dart';
import 'package:talebe_app/ui/widgets/molecules/custom_scrolling_date_card.dart';
import 'package:talebe_app/ui/widgets/molecules/custom_text_field_with_linear_gradient.dart';

// final myList = ["first", "second", "third", "fourth", "fifth", "sixth"];
final textFields = ["Kuran", "Cevşen", "Risale", "Yazı", "Ezber"];

class CustomManuallyControlledDateAndAssignentCardSecond
    extends StatefulWidget {
  const CustomManuallyControlledDateAndAssignentCardSecond({Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CustomManuallyControlledDateAndAssignentCardStateSecond();
  }
}

class _CustomManuallyControlledDateAndAssignentCardStateSecond
    extends State<CustomManuallyControlledDateAndAssignentCardSecond> {
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();
  }

  int _currentIndex = 6; // since it is always going to be the last
  var kuranController = TextEditingController();
  var cevsenController = TextEditingController();
  var risaleController = TextEditingController();
  var yaziController = TextEditingController();
  var ezberController = TextEditingController();

  final ScrollController _scrollBarController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatesCubit, DatesState>(
      builder: (context, state) {
        if (state is DatesTakeTheWeekDays) {
          final bool nullStateOfDays = context
                  .read<StudentAssignmentsCubit>()
                  .individualAssignmentsForSevenDays !=
              null;
          return Column(
            children: <Widget>[
              SafeArea(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  controller: _scrollBarController,
                  reverse: true,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ...state.datesList.map(
                        (Map dateMap) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomScrollingDateCard(
                            chosen: _currentIndex ==
                                state.datesList.indexWhere((element) =>
                                    element["todayDate"] ==
                                    dateMap["todayDate"]),
                            customWidget: CustomTextButtonForDateCardSlider(
                              onPressed: () => _controller.animateToPage(
                                  state.datesList.indexWhere((element) =>
                                      element["todayDate"] ==
                                      dateMap["todayDate"])),
                              itemName: dateMap["todayDate"],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              CarouselSlider(
                items: [
                  ...state
                      .datesList // there are 7 days of the current week to be showed
                      .map((todayDate) => CustomAssignmentCard(
                            customWidget: [
                              // kuran
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 8.0, left: 8.0, top: 6),
                                child: Row(
                                  children: [
                                    const CustomColumnLinearGradientFilled(
                                        width: 6, height: 54),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.58,
                                      child: // this is the card
                                          CustomTextFieldWithLinearGradient(
                                              controller: kuranController,
                                              // takenControllerValue: nullStateOfDays
                                              //     ? context
                                              //         .read<
                                              //             StudentAssignmentsCubit>()
                                              //         .individualAssignmentsForSevenDays
                                              //         .firstWhere((element) =>
                                              //             element.dateAndDayHumanReadable[
                                              //                 0] ==
                                              //             todayDate[
                                              //                 "todayDate"])
                                              //         .kuran
                                              //     : null,
                                              label: "Kuran"),
                                    ),
                                    CustomGoalCard(
                                        goal: context
                                            .read<StudentAssignmentsCubit>()
                                            .studentGoals["kuran"]!
                                            .toString()),
                                  ],
                                ),
                              ),
                              // cevsen
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 8.0, left: 8.0, top: 6),
                                child: Row(
                                  children: [
                                    const CustomColumnLinearGradientFilled(
                                        width: 6, height: 54),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.58,
                                      child: // this is the card
                                          CustomTextFieldWithLinearGradient(
                                              controller: cevsenController,
                                              // takenControllerValue: nullStateOfDays
                                              //     ? context
                                              //         .read<
                                              //             StudentAssignmentsCubit>()
                                              //         .individualAssignmentsForSevenDays
                                              //         .firstWhere((element) =>
                                              //             element.dateAndDayHumanReadable[
                                              //                 0] ==
                                              //             todayDate[
                                              //                 "todayDate"])
                                              //         ?.cevsen
                                              //     : null,
                                              label: "cevsen"),
                                    ),
                                    CustomGoalCard(
                                        goal: context
                                            .read<StudentAssignmentsCubit>()
                                            .studentGoals["cevsen"]!
                                            .toString()),
                                  ],
                                ),
                              ),
                              // risale
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 8.0, left: 8.0, top: 6),
                                child: Row(
                                  children: [
                                    const CustomColumnLinearGradientFilled(
                                        width: 6, height: 54),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.58,
                                      child: // this is the card
                                          CustomTextFieldWithLinearGradient(
                                              controller: risaleController,
                                              // takenControllerValue: nullStateOfDays
                                              //     ? context
                                              //         .read<
                                              //             StudentAssignmentsCubit>()
                                              //         .individualAssignmentsForSevenDays
                                              //         .firstWhere((element) =>
                                              //             element.dateAndDayHumanReadable[
                                              //                 0] ==
                                              //             todayDate[
                                              //                 "todayDate"])
                                              //         ?.risale
                                              //     : null,
                                              label: "Risale"),
                                    ),
                                    CustomGoalCard(
                                        goal: context
                                            .read<StudentAssignmentsCubit>()
                                            .studentGoals["risale"]!
                                            .toString()),
                                  ],
                                ),
                              ),
                              // yazi
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 8.0, left: 8.0, top: 6),
                                child: Row(
                                  children: [
                                    const CustomColumnLinearGradientFilled(
                                        width: 6, height: 54),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.58,
                                      child: // this is the card
                                          CustomTextFieldWithLinearGradient(
                                              controller: yaziController,
                                              // takenControllerValue: nullStateOfDays
                                              //     ? context
                                              //         .read<
                                              //             StudentAssignmentsCubit>()
                                              //         .individualAssignmentsForSevenDays
                                              //         .firstWhere((element) =>
                                              //             element.dateAndDayHumanReadable[
                                              //                 0] ==
                                              //             todayDate[
                                              //                 "todayDate"])
                                              //         ?.yazi
                                              //     : null,
                                              label: "Yazi"),
                                    ),
                                    CustomGoalCard(
                                        goal: context
                                            .read<StudentAssignmentsCubit>()
                                            .studentGoals["yazi"]!
                                            .toString()),
                                  ],
                                ),
                              ),
                              // ezber
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 8.0, left: 8.0, top: 6),
                                child: Row(
                                  children: [
                                    const CustomColumnLinearGradientFilled(
                                        width: 6, height: 54),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.58,
                                      child: // this is the card
                                          CustomTextFieldWithLinearGradient(
                                              controller: ezberController,
                                              // takenControllerValue: nullStateOfDays
                                              //     ? context
                                              //         .read<
                                              //             StudentAssignmentsCubit>()
                                              //         .individualAssignmentsForSevenDays
                                              //         .firstWhere((element) =>
                                              //             element.dateAndDayHumanReadable[
                                              //                 0] ==
                                              //             todayDate[
                                              //                 "todayDate"])
                                              //         ?.ezber
                                              //     : null,
                                              label: "Ezber"),
                                    ),
                                    CustomGoalCard(
                                        goal: context
                                            .read<StudentAssignmentsCubit>()
                                            .studentGoals["ezber"]!
                                            .toString()),
                                  ],
                                ),
                              ),
                              // one of the pages
                              Align(
                                  alignment: Alignment.topRight,
                                  child: CustomButtonAnimated(
                                    label: "Gönder",
                                    onPressed: () {
                                      print("pressed");
                                      var kuranValue =
                                          num.parse(kuranController.text);
                                      var cevsenValue =
                                          num.parse(cevsenController.text);
                                      var risaleValue =
                                          num.parse(risaleController.text);
                                      var yaziValue =
                                          num.parse(yaziController.text);
                                      var ezberValue =
                                          num.parse(ezberController.text);
                                      var timeStamp =
                                          todayDate["todayTimeStamp"];
                                      print(context
                                          .read<StudentAssignmentsCubit>()
                                          .individualAssignmentsForSevenDays[0]
                                          .dateAndDayHumanReadable[0]);
                                      print(todayDate["todayDate"]);

                                      // final String dateId = nullStateOfDays
                                      //     ? context
                                      //         .read<StudentAssignmentsCubit>()
                                      //         .individualAssignmentsForSevenDays
                                      //         .firstWhere((element) =>
                                      //             element.dateAndDayHumanReadable[
                                      //                 0] ==
                                      //             todayDate["todayDate"])
                                      //         .dateId
                                      //     : null;
                                      const String? dateId =
                                          null; // TODO: solve the problem related with the date Doc id

                                      context
                                          .read<StudentAssignmentsCubit>()
                                          .updateStudentAssignmentsDataForTheDate(
                                              dateId: dateId,
                                              timestamp: timeStamp,
                                              studentId: context
                                                  .read<LoginCubit>()
                                                  .loginUserData
                                                  .studentId,
                                              kuran: kuranValue,
                                              cevsen: cevsenValue,
                                              risale: risaleValue,
                                              yazi: yaziValue,
                                              ezber: ezberValue);
                                    },
                                    insets: Insets.xs,
                                    height: MediaQuery.of(context).size.width *
                                        0.125,
                                    widthRatio: 0.2,
                                  ))
                            ],
                          ))
                      .toList(),
                ],
                options: CarouselOptions(
                    initialPage: state.datesList.length - 1,
                    enableInfiniteScroll: false,
                    enlargeCenterPage: true,
                    height: MediaQuery.of(context).size.height * 0.575,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    }),
                carouselController: _controller,
              ),
            ],
          );
        } else {
          return const Text("Tarihler alınamadı...");
        }
      },
    );
  }
}
