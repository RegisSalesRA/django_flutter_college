import 'package:client_flutter/presentation/discipline_student/widgets/card_discipline_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../app/app.dart';
import '../../data/repository/discipline_repository.dart';
import 'discipline_student_by_teacher.dart';

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

  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<DisciplineRepository>(context, listen: false)
          .getDisciplineByTeacherList();
      setState(() {
        _initialized = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final disciplineList = Provider.of<DisciplineRepository>(context);
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
        body: _initialized
            ? Container(
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
                        if (disciplineList.disciplineTeacher.isNotEmpty) ...{
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount:
                                  disciplineList.disciplineTeacher.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: ((context, index) {
                                return CardDisciplineWidget(
                                  isColorScore: null,
                                  iconChose: const Icon(
                                    Icons.menu_book_outlined,
                                    size: 35,
                                    color: ColorsTheme.primaryColor,
                                  ),
                                  discipline: disciplineList
                                      .disciplineTeacher[index].name,
                                  name: "",
                                  argsExtra:
                                      "Created at - ${dateTimeFormat(disciplineList.disciplineTeacher[index].createAt)}",
                                  iconWidget: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: const BoxDecoration(
                                        color: ColorsTheme.primaryColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DisciplineStudentByTeacher(
                                                      idDiscipline:
                                                          disciplineList
                                                              .disciplineTeacher[
                                                                  index]
                                                              .id,
                                                      disciplineName:
                                                          disciplineList
                                                              .disciplineTeacher[
                                                                  index]
                                                              .name,
                                                      studentList: disciplineList
                                                          .disciplineTeacher[
                                                              index]
                                                          .student,
                                                    )));
                                      },
                                      icon:
                                          const Icon(Icons.assignment_outlined),
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              }))
                        },
                        if (disciplineList.disciplineTeacher.isEmpty) ...{
                          SizedBox(
                            height:
                                MediaQuerySize.heigthSizeCustom(context) * 0.70,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Center(
                                  child: Text("No discipline!"),
                                ),
                              ],
                            ),
                          )
                        }
                      ],
                    ),
                  ),
                ))
            : const Center(child: CircularProgressIndicator()));
  }
}
