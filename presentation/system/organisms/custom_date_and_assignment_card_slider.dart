import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talebe_app/cubit/dates/dates_cubit.dart';
import 'package:talebe_app/cubit/student/student_cubit.dart';
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

class CustomManuallyControlledDateAndAssignentCard extends StatefulWidget {
  const CustomManuallyControlledDateAndAssignentCard({Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CustomManuallyControlledDateAndAssignentCardState();
  }
}

class _CustomManuallyControlledDateAndAssignentCardState
    extends State<CustomManuallyControlledDateAndAssignentCard> {
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();

  }

  int _currentIndex = 6; // since it is always going to be the last
  List<List<TextEditingController>> controllers = [
    [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ],
    [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ],
    [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ],
    [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ],
    [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ],
    [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ],
    [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ],
  ];
  final ScrollController _scrollBarController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatesCubit, DatesState>(
      builder: (context, state) {
        if (state is DatesTakeTheWeekDays) {
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
                        (Map itemMap) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomScrollingDateCard(
                            chosen: _currentIndex ==
                                state.datesList.indexWhere((element) =>
                                    element["todayDate"] ==
                                    itemMap["todayDate"]),
                            customWidget: CustomTextButtonForDateCardSlider(
                              onPressed: () => _controller.animateToPage(
                                  state.datesList.indexWhere((element) =>
                                      element["todayDate"] ==
                                      itemMap["todayDate"])),
                              itemName: itemMap["todayDate"],
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
                      .map((item) => CustomAssignmentCard(
                            customWidget: [
                              ...textFields.map(
                                // there are 5 textfields to be assigned
                                (label) => Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 8.0, left: 8.0, top: 6),
                                  child: Row(
                                    children: [
                                      const CustomColumnLinearGradientFilled(
                                          width: 6, height: 54),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.58,
                                        child: // this is the card
                                            CustomTextFieldWithLinearGradient(
                                                controller: controllers[state
                                                        .datesList
                                                        .indexWhere((element) =>
                                                            element == item)][
                                                    textFields.indexWhere(
                                                        (elementInner) =>
                                                            elementInner ==
                                                            label)],
                                                label: label),
                                      ),
                                      CustomGoalCard(
                                          goal: context
                                              .read<StudentAssignmentsCubit>()
                                              .studentGoals[textFields
                                                  .indexWhere((elementInner) =>
                                                      elementInner == label)]
                                              .toString()),
                                    ],
                                  ),
                                ),
                              ),
                              // one of the pages
                              Align(
                                  alignment: Alignment.topRight,
                                  child: CustomButtonAnimated(
                                    label: "Gönder",
                                    onPressed: () {},
                                    insets: Insets.xs,
                                    height: MediaQuery.of(context).size.width *
                                        0.125,
                                    widthRatio: 0.2,
                                  ))
                            ],
                          ))
                      .toList()
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
