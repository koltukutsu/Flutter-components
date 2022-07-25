import 'package:admin/cubit/login/login_cubit.dart';
import 'package:admin/cubit/students/student_cubit.dart';
import 'package:admin/cubit/teacher/teacher_cubit.dart';
import 'package:admin/ui/themes/color_constants.dart';
import 'package:admin/ui/widgets/molecules/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteIndividualButton extends StatefulWidget {
  final String deleteStudentOrTeacher;
  final String individualId;

  const DeleteIndividualButton(
      {Key? key,
      required this.deleteStudentOrTeacher,
      required this.individualId})
      : super(key: key);

  @override
  State<DeleteIndividualButton> createState() => _DeleteIndividualButtonState();
}

class _DeleteIndividualButtonState extends State<DeleteIndividualButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 0.0),
      child: CustomButtonAnimated(
        label: "Sil",
        onPressed: () {
          _showDeleteAlertDialog(context: context);
        },
        height: 22,
        width: 70,
        enabled: true,
        labelColor: magenta,
        buttonColor: Colors.white,
        fontSize: 10,
        filled: true,
      ),
    );
  }

  Future<void> _showDeleteAlertDialog({required BuildContext context}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Silme Onayı'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Kişiyi silmek istiyor musunuz?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Sil'),
              onPressed: () {
                if (widget.deleteStudentOrTeacher == "teacher") {
                  // delete teacher
                  print("this is our id ${widget.individualId}");
                  context
                      .read<TeacherCubit>()
                      .deleteTeacher(teacherId: widget.individualId);
                  _showDialogSuccess(context, green, "Muallim silindi");
                  context.read<TeacherCubit>().fetchTeacherDatas();
                } else if (widget.deleteStudentOrTeacher == "student") {
                  // delete student
                  print("this is our id ${widget.individualId}");
                  context
                      .read<StudentCubit>()
                      .deleteStudent(studentId: widget.individualId);
                  _showDialogSuccess(context, green, "Talebe silindi");
                  context.read<StudentCubit>().fetchStudentDatas(
                      isAdmin: context.read<LoginCubit>().loginUserData.admin,
                      teacherName:
                          context.read<LoginCubit>().loginUserData.name,
                      teacherSurname:
                          context.read<LoginCubit>().loginUserData.surname,
                      dormitory:
                          context.read<LoginCubit>().loginUserData.dormitory);
                }

                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Vazgeç'),
              onPressed: () {
                print("silme islemi yapilmadi");
                var individual = widget.deleteStudentOrTeacher == "student"
                    ? "Talebe"
                    : "Muallim";
                _showDialogSuccess(context, magenta, "$individual silinmedi");
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _showDialogSuccess(BuildContext context, Color color, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Container(
            child: Row(
      children: [
        Icon(
          Icons.verified,
          color: color,
        ),
        SizedBox(
          width: 25,
        ),
        Text(text),
      ],
    ))));
  }
}
