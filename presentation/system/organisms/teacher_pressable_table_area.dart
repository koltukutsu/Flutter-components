import 'package:admin/cubit/students/student_cubit.dart';
import 'package:admin/ui/themes/color_constants.dart';
import 'package:admin/ui/widgets/molecules/student_data_row.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PressableTableArea extends StatelessWidget {
  const PressableTableArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Tabeler",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              // Text(
              //   "Sayi: 24",
              //   style: Theme.of(context).textTheme.subtitle1,
              // ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: BlocBuilder<StudentCubit, StudentState>(
                builder: (context, state) {
              print("ogrenci kontrol");
              print(state);
              if (state is GotStudentDatas) {
                return DataTable2(
                  dataTextStyle: TextStyle(fontSize: 14.5, color: Colors.white),
                  // horizontalMargin: 12,
                  columnSpacing: 0,
                  dataRowHeight: 70,
                  minWidth: 600,
                  columns: [
                    DataColumn(
                      label: Text("İsim"),
                    ),
                    DataColumn(
                      label: Text("Soyisim"),
                    ),
                    DataColumn(
                      label: Text("Sınıf"),
                    ),
                    DataColumn(
                      label: Text("Okul"),
                    ),
                    DataColumn(
                      label: Text("Bölüm"),
                    ),
                    DataColumn(
                      label: Text("Medrese"),
                    ),
                    DataColumn(
                      label: Text("     "),
                    ),
                  ],
                  rows: List.generate(
                    state.studentDatas.length,
                    (index) => StudentDataRow(state.studentDatas[index]),
                  ),
                );
              } else if (state is LoadingStudentDatas) {
                return Container(
                  height: 100,
                  width: 100,
                  child: LinearProgressIndicator(color: bgColor),
                );
              } else {
                return Container(
                  color: green,
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
