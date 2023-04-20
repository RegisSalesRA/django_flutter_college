import 'package:client_flutter/presentation/discipline_student/widgets/card_discipline_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../app/app.dart';

class DisciplineStudentByTeacher extends StatefulWidget {
  final String disciplineName;
  final List studentList;
  const DisciplineStudentByTeacher(
      {super.key, required this.studentList, required this.disciplineName});

  @override
  State<DisciplineStudentByTeacher> createState() =>
      _DisciplineStudentByTeacherState();
}

class _DisciplineStudentByTeacherState
    extends State<DisciplineStudentByTeacher> {
  String dateTimeFormat(data) {
    final formattedDate = DateFormat.yMMMEd().format(data);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: ColorsTheme.secondaryColor,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white10,
        title: Text(
          "${widget.disciplineName} Students",
          style: const TextStyle(color: ColorsTheme.secondaryColor),
        ),
      ),
      body: Container(
          height: MediaQuerySize.heigthSizeCustom(context),
          decoration: const BoxDecoration(
            color: Colors.white10,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                      //    controller: widget.textController,
                      //    onChanged: widget.onChanged,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.white),
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 15.0),
                        fillColor: ColorsTheme.primaryColor,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        hintText: 'Search Discipline',
                        prefixIcon: const Icon(Icons.search,
                            size: 30.0, color: Colors.white),
                      )),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget.studentList.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: ((context, index) {
                        return CardDisciplineWidget(
                          iconChose: const Icon(
                            Icons.person,
                            size: 35,
                            color: ColorsTheme.primaryColor,
                          ),
                          discipline: widget.studentList[index].name,
                          name: widget.studentList[index].phone,
                          argsExtra: '',
                          iconWidget: const SizedBox(),
                        );
                      }))
                ],
              ),
            ),
          )),
    );
  }
}
