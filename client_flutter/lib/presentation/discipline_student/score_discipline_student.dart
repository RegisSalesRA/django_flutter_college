import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../app/app.dart';
import '../../data/repository/discipline_repository.dart';
import 'widgets/card_discipline_widget.dart';

class ScoresDisciplinesScreen extends StatefulWidget {
  const ScoresDisciplinesScreen({super.key});

  @override
  State<ScoresDisciplinesScreen> createState() =>
      _ScoresDisciplinesScreenState();
}

class _ScoresDisciplinesScreenState extends State<ScoresDisciplinesScreen> {
  String dateTimeFormat(data) {
    final formattedDate = DateFormat.yMMMEd().format(data);
    return formattedDate;
  }

  bool _initialized = false;
  String valueList = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<DisciplineRepository>(context, listen: false)
          .getScoreDisciplineByStudentListRepository();
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
            "Score Discipline",
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
                            onChanged: (value) {
                              setState(() {
                                valueList = value.toLowerCase().toString();
                              });
                            },
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
                        if (disciplineList
                            .scoreDisciplineStudentAvailible.isNotEmpty) ...{
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: disciplineList
                                  .scoreDisciplineStudentAvailible.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: ((context, index) {
                                return disciplineList
                                        .scoreDisciplineStudentAvailible[index]
                                        .discipline
                                        .name
                                        .toLowerCase()
                                        .contains(valueList)
                                    ? CardDisciplineWidget(
                                        isColorScore: null,
                                        iconChose: const Icon(
                                          Icons.menu_book_outlined,
                                          size: 35,
                                          color: ColorsTheme.primaryColor,
                                        ),
                                        discipline: disciplineList
                                            .scoreDisciplineStudentAvailible[
                                                index]
                                            .discipline
                                            .name,
                                        name:
                                            "Teacher - ${disciplineList.scoreDisciplineStudentAvailible[index].discipline.teacher.name}",
                                        argsExtra:
                                            "Score - ${disciplineList.scoreDisciplineStudentAvailible[index].score}",
                                        iconWidget: Container(),
                                      )
                                    : Container();
                              }))
                        },
                        if (disciplineList
                            .scoreDisciplineStudentAvailible.isEmpty) ...{
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
