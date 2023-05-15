// ignore_for_file: use_build_context_synchronously

import 'package:client_flutter/presentation/discipline_student/widgets/card_discipline_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/data.dart';
import '../../app/app.dart';
import '../common/alert_dialog.dart';
import '../home/widgets/alert_dialog_status.dart';

class DisciplineStudentByTeacher extends StatefulWidget {
  final int idDiscipline;
  final String disciplineName;
  final List studentList;
  const DisciplineStudentByTeacher(
      {super.key,
      required this.studentList,
      required this.disciplineName,
      required this.idDiscipline});

  @override
  State<DisciplineStudentByTeacher> createState() =>
      _DisciplineStudentByTeacherState();
}

class _DisciplineStudentByTeacherState
    extends State<DisciplineStudentByTeacher> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final token = await readSecureData('token');
      try {
        await Provider.of<DisciplineRepository>(context, listen: false)
            .getScoreRepository(widget.idDiscipline);
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
  Widget build(BuildContext contextDisciplineStudentByTeacher) {
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
        body: Consumer<DisciplineRepository>(
          builder:
              (contextDisciplineStudentByTeacher, disciplineRepository, child) {
            return ValueListenableBuilder(
              valueListenable: disciplineRepository.isLoading,
              builder: (contextDisciplineStudentByTeacher, value, child) {
                return !value
                    ? Container(
                        height: MediaQuerySize.heigthSizeCustom(
                            contextDisciplineStudentByTeacher),
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
                                    style: const TextStyle(color: Colors.white),
                                    onChanged: (value) {
                                      disciplineRepository
                                              .valueFieldText.value =
                                          value.toLowerCase().toString();
                                    },
                                    decoration: InputDecoration(
                                      hintStyle:
                                          const TextStyle(color: Colors.white),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 15.0),
                                      fillColor: ColorsTheme.primaryColor,
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      hintText: 'Search Discipline',
                                      prefixIcon: const Icon(Icons.search,
                                          size: 30.0, color: Colors.white),
                                    )),
                                if (disciplineRepository
                                    .studentScore.isNotEmpty) ...{
                                  ValueListenableBuilder(
                                    valueListenable:
                                        disciplineRepository.valueFieldText,
                                    builder: (contextDisciplineStudentByTeacher,
                                        value, child) {
                                      return ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: disciplineRepository
                                              .studentScore.length,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemBuilder:
                                              ((contextDisciplineStudentByTeacher,
                                                  index) {
                                            return disciplineRepository
                                                    .studentScore[index]["name"]
                                                    .toLowerCase()
                                                    .contains(
                                                        disciplineRepository
                                                            .valueFieldText
                                                            .value)
                                                ? CardDisciplineWidget(
                                                    isColorScore: formatScoreColor(
                                                        disciplineRepository
                                                                    .studentScore[
                                                                index]["score"]
                                                            ["score"]),
                                                    iconChose: const Icon(
                                                      Icons.person,
                                                      size: 35,
                                                      color: ColorsTheme
                                                          .primaryColor,
                                                    ),
                                                    discipline:
                                                        "Name - ${disciplineRepository.studentScore[index]["name"]}",
                                                    name:
                                                        "Phone - ${disciplineRepository.studentScore[index]["phone"]}",
                                                    argsExtra:
                                                        "Score - ${formatScore(disciplineRepository.studentScore[index]["score"]["score"]) ?? "no score"}",
                                                    iconWidget: disciplineRepository
                                                                        .studentScore[
                                                                    index]["score"]
                                                                ["score"] ==
                                                            null
                                                        ? Container(
                                                            height: 50,
                                                            width: 50,
                                                            decoration: const BoxDecoration(
                                                                color: ColorsTheme
                                                                    .primaryColor,
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            15))),
                                                            child: IconButton(
                                                              onPressed: () {
                                                                alertDialog(
                                                                    contextDisciplineStudentByTeacher,
                                                                    'Score',
                                                                    'Attention after send score you can not do again',
                                                                    () async {
                                                                  try {
                                                                    var data = {
                                                                      "id_student":
                                                                          disciplineRepository.studentScore[index]
                                                                              [
                                                                              "id"],
                                                                      "id_discpline":
                                                                          widget
                                                                              .idDiscipline,
                                                                      "nota": disciplineRepository
                                                                          .scoreController
                                                                          .text
                                                                    };

                                                                    Navigator.of(
                                                                            contextDisciplineStudentByTeacher)
                                                                        .pop();

                                                                    await disciplineRepository
                                                                        .insertScoreToStudentRepository(
                                                                            data);

                                                                    await disciplineRepository
                                                                        .getScoreRepository(
                                                                            widget.idDiscipline);
                                                                    disciplineRepository
                                                                        .cleanFidelds();
                                                                  } catch (e) {
                                                                    final token =
                                                                        await readSecureData(
                                                                            'token');

                                                                    return alertDialogStatus(
                                                                        context,
                                                                        e.toString(),
                                                                        () async {
                                                                      await deleteSecureData(StorageItem(
                                                                          'token',
                                                                          token!));
                                                                      Navigator.pushReplacementNamed(
                                                                          context,
                                                                          Routes
                                                                              .initial);
                                                                    });
                                                                  }
                                                                },
                                                                    true,
                                                                    disciplineRepository
                                                                        .scoreController);
                                                              },
                                                              icon: const Icon(
                                                                  Icons.add),
                                                              color:
                                                                  Colors.white,
                                                            ))
                                                        : Container(
                                                            height: 50,
                                                            width: 50,
                                                            decoration: const BoxDecoration(
                                                                color: ColorsTheme
                                                                    .primaryColor,
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            15))),
                                                            child: const Center(
                                                                child: Icon(
                                                              Icons.block,
                                                              color:
                                                                  Colors.white,
                                                            )),
                                                          ),
                                                  )
                                                : Container();
                                          }));
                                    },
                                  )
                                },
                                if (disciplineRepository
                                    .studentScore.isEmpty) ...{
                                  SizedBox(
                                    height: MediaQuerySize.heigthSizeCustom(
                                            context) *
                                        0.70,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Center(
                                          child: Text("No student registed!"),
                                        ),
                                      ],
                                    ),
                                  )
                                }
                              ],
                            ),
                          ),
                        ))
                    : const Center(
                        child: CircularProgressIndicator(),
                      );
              },
            );
          },
        ));
  }
}
