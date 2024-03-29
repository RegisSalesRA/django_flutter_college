import 'package:client_flutter/data/data/storage_data.dart';
import 'package:client_flutter/ui/discipline_student/widgets/card_discipline_widget.dart';
import 'package:client_flutter/ui/home/widgets/alert_dialog_status.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/app.dart';
import '../../data/controllers/discipline_controller.dart';
import 'discipline_student_by_teacher.dart';

class TeacherDisciplinesScreen extends StatefulWidget {
  const TeacherDisciplinesScreen({super.key});

  @override
  State<TeacherDisciplinesScreen> createState() =>
      _TeacherDisciplinesScreenState();
}

class _TeacherDisciplinesScreenState extends State<TeacherDisciplinesScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final token = await readSecureData('token');
      try {
        await Provider.of<DisciplineController>(context, listen: false)
            .getDisciplineByTeacherController();
      } catch (e) {
        if (mounted) {
          alertDialogStatus(context, e.toString(), () async {
            await deleteSecureData(StorageItem('token', token!));
            Navigator.pushReplacementNamed(context, Routes.initial);
          });
        }
      }
    });
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
          title: const Text(
            "Discipline Teacher",
            style: TextStyle(color: ColorsTheme.secondaryColor),
          ),
        ),
        body: Consumer<DisciplineController>(
          builder: ((context, disciplineTeacherRepository, child) {
            return ValueListenableBuilder(
              valueListenable: disciplineTeacherRepository.isLoading,
              builder: (context, loading, child) {
                if (!loading) {
                  return Container(
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
                                  onChanged: (value) {
                                    disciplineTeacherRepository.valueFieldText
                                        .value = value.toLowerCase().toString();
                                  },
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    hintStyle:
                                        const TextStyle(color: Colors.white),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 15.0),
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
                              if (disciplineTeacherRepository
                                  .disciplineTeacher.isNotEmpty) ...{
                                ValueListenableBuilder(
                                    valueListenable: disciplineTeacherRepository
                                        .valueFieldText,
                                    builder: ((context, value, child) {
                                      return ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: disciplineTeacherRepository
                                              .disciplineTeacher.length,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemBuilder: ((context, index) {
                                            return disciplineTeacherRepository
                                                    .disciplineTeacher[index]
                                                    .name
                                                    .toLowerCase()
                                                    .contains(
                                                        disciplineTeacherRepository
                                                            .valueFieldText
                                                            .value)
                                                ? CardDisciplineWidget(
                                                    isColorScore: null,
                                                    iconChose: const Icon(
                                                      Icons.menu_book_outlined,
                                                      size: 35,
                                                      color: ColorsTheme
                                                          .primaryColor,
                                                    ),
                                                    discipline:
                                                        disciplineTeacherRepository
                                                            .disciplineTeacher[
                                                                index]
                                                            .name,
                                                    name: "",
                                                    argsExtra:
                                                        "Created at - ${dateTimeFormat(disciplineTeacherRepository.disciplineTeacher[index].createAt)}",
                                                    iconWidget: Container(
                                                      height: 50,
                                                      width: 50,
                                                      decoration: const BoxDecoration(
                                                          color: ColorsTheme
                                                              .primaryColor,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          15))),
                                                      child: IconButton(
                                                        onPressed: () {
                                                          Navigator.of(context).push(
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          DisciplineStudentByTeacher(
                                                                            idDiscipline:
                                                                                disciplineTeacherRepository.disciplineTeacher[index].id,
                                                                            disciplineName:
                                                                                disciplineTeacherRepository.disciplineTeacher[index].name,
                                                                            studentList:
                                                                                disciplineTeacherRepository.disciplineTeacher[index].student,
                                                                          )));
                                                        },
                                                        icon: const Icon(Icons
                                                            .assignment_outlined),
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  )
                                                : Container();
                                          }));
                                    }))
                              },
                              if (disciplineTeacherRepository
                                  .disciplineTeacher.isEmpty) ...{
                                SizedBox(
                                  height:
                                      MediaQuerySize.heigthSizeCustom(context) *
                                          0.70,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                      ));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            );
          }),
        ));
  }
}
