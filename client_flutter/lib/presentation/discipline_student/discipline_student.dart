import 'package:client_flutter/presentation/discipline_student/widgets/card_discipline_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/app.dart';
import '../../data/repository/discipline_repository.dart';

class StudentDisciplinesScreen extends StatefulWidget {
  const StudentDisciplinesScreen({super.key});

  @override
  State<StudentDisciplinesScreen> createState() =>
      _StudentDisciplinesScreenState();
}

class _StudentDisciplinesScreenState extends State<StudentDisciplinesScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<DisciplineRepository>(context, listen: false)
          .getDisciplineByStudentListRepository();
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
          "Discipline Student",
          style: TextStyle(color: ColorsTheme.secondaryColor),
        ),
      ),
      body:
          Consumer<DisciplineRepository>(builder: (context, disciplineList, _) {
        return ValueListenableBuilder<bool>(
            valueListenable: disciplineList.isLoading,
            builder: (BuildContext context, isLoading, child) {
              return !isLoading
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
                                    disciplineList.valueFieldText.value =
                                        value.toLowerCase().toString();
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
                              if (disciplineList
                                  .disciplineStudent.isNotEmpty) ...{
                                ListView.builder(
                                    shrinkWrap: true,
                                    itemCount:
                                        disciplineList.disciplineStudent.length,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: ((context, index) {
                                      return ValueListenableBuilder<String>(
                                        valueListenable:
                                            disciplineList.valueFieldText,
                                        builder: (context, valueString, child) {
                                          return disciplineList
                                                  .disciplineStudent[index].name
                                                  .toLowerCase()
                                                  .contains(disciplineList
                                                      .valueFieldText.value)
                                              ? CardDisciplineWidget(
                                                  isColorScore: null,
                                                  iconChose: const Icon(
                                                    Icons.menu_book_outlined,
                                                    size: 35,
                                                    color: ColorsTheme
                                                        .primaryColor,
                                                  ),
                                                  discipline: disciplineList
                                                      .disciplineStudent[index]
                                                      .name,
                                                  name:
                                                      "Teacher - ${disciplineList.disciplineStudent[index].teacher.name}",
                                                  argsExtra:
                                                      "Created at - ${dateTimeFormat(disciplineList.disciplineStudent[index].createAt)}",
                                                  iconWidget: Container(),
                                                )
                                              : Container();
                                        },
                                      );
                                    }))
                              },
                              if (disciplineList.disciplineStudent.isEmpty) ...{
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
                      ))
                  : const Center(child: CircularProgressIndicator());
            });
      }),
    );
  }
}
