import 'package:admin/ui/themes/color_constants.dart';
import 'package:admin/ui/widgets/molecules/mini_information_card.dart';
import 'package:flutter/material.dart';

class InformationCardsSection extends StatelessWidget {
  const InformationCardsSection({
    Key? key,
    required this.crossAxisCount,
    this.childAspectRatio = 1.3,
    required this.givenData,
    required this.formCurrentDatas,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;
  final List givenData;
  final Map<String, String> formCurrentDatas;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: givenData.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) =>
          MiniInformationCard(categoricData: givenData[index], formCurrentDatas: formCurrentDatas),
    );
  }
}
