import 'package:client_flutter/presentation/discipline_student/widgets/card_discipline_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../app/app.dart';
import '../../data/repository/discipline_repository.dart';

class TeacherDisciplinesScreen extends StatefulWidget {
  const TeacherDisciplinesScreen({super.key});

  @override
  State<TeacherDisciplinesScreen> createState() =>
      _TeacherDisciplinesScreenState();
}

class _TeacherDisciplinesScreenState extends State<TeacherDisciplinesScreen> {
  String dateTimeFormat(data) {
    final formattedDate = DateFormat.yMMMEd().format(data);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    final disciplineList = Provider.of<DisciplineProvider>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: ColorsTheme.secondaryColor,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white10,
        title: const Text(
          "Discipline Teacher",
          style: TextStyle(color: ColorsTheme.secondaryColor),
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
                  ElevatedButton(
                      onPressed: () async {
                        await disciplineList.getDisciplineByTeacherList();
                      },
                      child: const Text("Ola")),
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
                      itemCount: disciplineList.disciplineTeacher.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: ((context, index) {
                        return CardDisciplineWidget(
                          discipline:
                              disciplineList.disciplineTeacher[index].name,
                          name: disciplineList
                              .disciplineTeacher[index].teacher.phone,
                          date: dateTimeFormat(
                              disciplineList.disciplineTeacher[index].createAt),
                          iconWidget: Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                                color: ColorsTheme.primaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: const Icon(
                              Icons.assignment_outlined,
                              color: Colors.white,
                            ),
                          ),
                        );
                      }))
                ],
              ),
            ),
          )),
    );
  }
}
