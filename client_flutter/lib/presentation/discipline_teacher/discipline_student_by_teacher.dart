import 'package:client_flutter/presentation/discipline_student/widgets/card_discipline_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../app/app.dart';
import '../../data/repository/discipline_repository.dart';
import '../common/alert_dialog.dart';

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
  final disciplineRepository = DisciplineRepository();

  String dateTimeFormat(data) {
    final formattedDate = DateFormat.yMMMEd().format(data);
    return formattedDate;
  }

  bool _initialized = false;
  String valueList = "";

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<DisciplineRepository>(context, listen: false)
          .getScoreRepository(widget.idDiscipline);
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
          title: Text(
            "${widget.disciplineName} Students",
            style: const TextStyle(color: ColorsTheme.secondaryColor),
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
                            style: const TextStyle(color: Colors.white),
                            onChanged: (value) {
                              setState(() {
                                valueList = value.toLowerCase().toString();
                              });
                            },
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
                        if (disciplineList.studentScore.isNotEmpty) ...{
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: disciplineList.studentScore.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: ((context, index) {
                                return disciplineList.studentScore[index]
                                            ["name"]
                                        .toLowerCase()
                                        .contains(valueList)
                                    ? CardDisciplineWidget(
                                        isColorScore: formatScoreColor(
                                            disciplineList.studentScore[index]
                                                ["score"]["score"]),
                                        iconChose: const Icon(
                                          Icons.person,
                                          size: 35,
                                          color: ColorsTheme.primaryColor,
                                        ),
                                        discipline:
                                            "Name - ${disciplineList.studentScore[index]["name"]}",
                                        name:
                                            "Phone - ${disciplineList.studentScore[index]["phone"]}",
                                        argsExtra:
                                            "Score - ${formatScore(disciplineList.studentScore[index]["score"]["score"]) ?? "no score"}",
                                        iconWidget: Container(
                                            height: 50,
                                            width: 50,
                                            decoration: const BoxDecoration(
                                                color: ColorsTheme.primaryColor,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15))),
                                            child: IconButton(
                                              onPressed: () => alertDialog(
                                                  context,
                                                  'Score',
                                                  'Attention after send score you can not do again',
                                                  () async {
                                                var data = {
                                                  "id_student": disciplineList
                                                          .studentScore[index]
                                                      ["id"],
                                                  "id_discpline":
                                                      widget.idDiscipline,
                                                  "nota": disciplineRepository
                                                      .scoreController.text
                                                };
                                                await disciplineList
                                                    .insertScoreToStudentProvider(
                                                        data);
                                                disciplineRepository
                                                    .cleanFidelds();
                                                Navigator.of(context).pop();
                                                await disciplineList
                                                    .getScoreRepository(
                                                        widget.idDiscipline);
                                              },
                                                  true,
                                                  disciplineRepository
                                                      .scoreController),
                                              icon: const Icon(Icons
                                                  .insert_chart_outlined_sharp),
                                              color: Colors.white,
                                            )),
                                      )
                                    : Container();
                              }))
                        },
                        if (disciplineList.studentScore.isEmpty) ...{
                          SizedBox(
                            height:
                                MediaQuerySize.heigthSizeCustom(context) * 0.70,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
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
              ));
  }
}
