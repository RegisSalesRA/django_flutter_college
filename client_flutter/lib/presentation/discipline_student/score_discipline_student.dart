import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../app/app.dart';
import '../../data/data/storage_data.dart';
import '../../data/repository/discipline_repository.dart';
import '../home/widgets/alert_dialog_status.dart';
import 'widgets/card_discipline_widget.dart';

class ScoresDisciplinesScreen extends StatefulWidget {
  const ScoresDisciplinesScreen({super.key});

  @override
  State<ScoresDisciplinesScreen> createState() =>
      _ScoresDisciplinesScreenState();
}

class _ScoresDisciplinesScreenState extends State<ScoresDisciplinesScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final token = await readSecureData('token');
      try {
        await Provider.of<DisciplineRepository>(context, listen: false)
            .getScoreDisciplineByStudentListRepository();
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
            "Score Discipline",
            style: TextStyle(color: ColorsTheme.secondaryColor),
          ),
        ),
        body: Consumer<DisciplineRepository>(
          builder: (context, disciplineRepository, child) {
            return ValueListenableBuilder(
              valueListenable: disciplineRepository.isLoading,
              builder: (context, isLoading, child) {
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
                                      disciplineRepository
                                              .valueFieldText.value =
                                          value.toLowerCase().toString();
                                    },
                                    style: const TextStyle(color: Colors.white),
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
                                    .scoreDisciplineStudentAvailible
                                    .isNotEmpty) ...{
                                  ValueListenableBuilder(
                                    valueListenable:
                                        disciplineRepository.valueFieldText,
                                    builder: (context, value, child) {
                                      return ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: disciplineRepository
                                              .scoreDisciplineStudentAvailible
                                              .length,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemBuilder: ((context, index) {
                                            return disciplineRepository
                                                    .scoreDisciplineStudentAvailible[
                                                        index]
                                                    .discipline
                                                    .name
                                                    .toLowerCase()
                                                    .contains(value)
                                                ? CardDisciplineWidget(
                                                    isColorScore: formatScoreColor(
                                                        disciplineRepository
                                                            .scoreDisciplineStudentAvailible[
                                                                index]
                                                            .score),
                                                    iconChose: const Icon(
                                                      Icons.menu_book_outlined,
                                                      size: 35,
                                                      color: ColorsTheme
                                                          .primaryColor,
                                                    ),
                                                    discipline: disciplineRepository
                                                        .scoreDisciplineStudentAvailible[
                                                            index]
                                                        .discipline
                                                        .name,
                                                    name:
                                                        "Teacher - ${disciplineRepository.scoreDisciplineStudentAvailible[index].discipline.teacher.name}",
                                                    argsExtra:
                                                        "Score - ${formatScore(disciplineRepository.scoreDisciplineStudentAvailible[index].score)}",
                                                    iconWidget: Container(),
                                                  )
                                                : Container();
                                          }));
                                    },
                                  )
                                },
                                if (disciplineRepository
                                    .scoreDisciplineStudentAvailible
                                    .isEmpty) ...{
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
                    : const Center(
                        child: CircularProgressIndicator(),
                      );
              },
            );
          },
        ));
  }
}
