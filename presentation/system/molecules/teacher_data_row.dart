import 'package:admin/data/models/individual_model.dart';
import 'package:admin/ui/screens/teacher_info_pop_up/teacher_info_pop_up_screen.dart';
import 'package:admin/ui/widgets/molecules/delete_individual_button.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

DataRow TeacherDataRow(IndividualModel fileInfo) {
  ContainerTransitionType _containerTransitionType =
      ContainerTransitionType.fade;
  return DataRow(
    // onSelectChanged: ,

    cells: [
      DataCell(
        Row(
          children: [
            Text(fileInfo.name),
          ],
        ),
      ),
      DataCell(Text(fileInfo.surname)),
      DataCell(Text(fileInfo.dormitory)),
      DataCell(Text(fileInfo.region)),
      DataCell(Text(fileInfo.province)),
      DataCell(Text(fileInfo.district)),
      DataCell(Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 1.5,
          ),
          SizedBox(
            width: 70,
            height: 25,
            child: OpenContainer(
              transitionType: _containerTransitionType,
              transitionDuration: Duration(milliseconds: 400),
              openBuilder: (context, _) =>
                  TeacherInfoPopUpScreen(teacherId: fileInfo.id),
              closedBuilder: (context, _) => Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Detaylandır",
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 10),
                  )),
            ),
          ),
          DeleteIndividualButton(
            deleteStudentOrTeacher: "teacher",
            individualId: fileInfo.id,
          )
        ],
      ))
    ],
  );
}
