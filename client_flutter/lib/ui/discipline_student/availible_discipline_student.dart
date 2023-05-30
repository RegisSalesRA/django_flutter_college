// ignore_for_file: use_build_context_synchronously

import 'package:client_flutter/ui/common/alert_dialog.dart';
import 'package:client_flutter/ui/discipline_student/widgets/card_discipline_widget.dart';
import 'package:client_flutter/ui/home/widgets/alert_dialog_status.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/app.dart';
import '../../data/data/data.dart';
import '../../data/controllers/discipline_controller.dart';

class AvailibleDisciplinesScreen extends StatefulWidget {
  const AvailibleDisciplinesScreen({super.key});

  @override
  State<AvailibleDisciplinesScreen> createState() =>
      _AvailibleDisciplinesScreenState();
}

class _AvailibleDisciplinesScreenState
    extends State<AvailibleDisciplinesScreen> {
  final TextEditingController _controllerDiscicpline = TextEditingController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final token = await readSecureData('token');
      try {
        await Provider.of<DisciplineController>(context, listen: false)
            .getDisciplineByStudentAvailibleListController();
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
  void dispose() {
    super.dispose();
    _controllerDiscicpline.dispose();
  }

  @override
  Widget build(BuildContext contextPageAvalibleDisciplineStudent) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: ColorsTheme.secondaryColor,
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white10,
          title: const Text(
            "Availible Disciplines",
            style: TextStyle(color: ColorsTheme.secondaryColor),
          ),
        ),
        body: Consumer<DisciplineController>(
          builder: (contextPageAvalibleDisciplineStudent, disciplineRepository,
              child) {
            return ValueListenableBuilder(
              valueListenable: disciplineRepository.isLoading,
              builder: (contextPageAvalibleDisciplineStudent, value, child) {
                return !value
                    ? Container(
                        height: MediaQuerySize.heigthSizeCustom(
                            contextPageAvalibleDisciplineStudent),
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
                                      disciplineRepository.valueFieldText
                                          .value = value.toLowerCase();
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
                                    .disciplineStudentAvailible.isNotEmpty) ...{
                                  ValueListenableBuilder(
                                    valueListenable:
                                        disciplineRepository.valueFieldText,
                                    builder:
                                        (contextPageAvalibleDisciplineStudent,
                                            value, child) {
                                      return ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: disciplineRepository
                                              .disciplineStudentAvailible
                                              .length,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemBuilder:
                                              ((contextPageAvalibleDisciplineStudent,
                                                  index) {
                                            return disciplineRepository
                                                    .disciplineStudentAvailible[
                                                        index]
                                                    .name
                                                    .toLowerCase()
                                                    .contains(value)
                                                ? CardDisciplineWidget(
                                                    isColorScore: null,
                                                    iconChose: const Icon(
                                                      Icons.menu_book_outlined,
                                                      size: 35,
                                                      color: ColorsTheme
                                                          .primaryColor,
                                                    ),
                                                    discipline: disciplineRepository
                                                        .disciplineStudentAvailible[
                                                            index]
                                                        .name,
                                                    name:
                                                        "Teacher - ${disciplineRepository.disciplineStudentAvailible[index].teacher.name}",
                                                    argsExtra:
                                                        "Created at - ${dateTimeFormat(disciplineRepository.disciplineStudentAvailible[index].createAt)}",
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
                                                          alertDialog(
                                                              contextPageAvalibleDisciplineStudent,
                                                              '${disciplineRepository.disciplineStudentAvailible[index].name}',
                                                              'Are you sure you want accept this discipline? after that you can not back your decision',
                                                              () async {
                                                            try {
                                                              var data = {
                                                                "id_discpline":
                                                                    disciplineRepository
                                                                        .disciplineStudentAvailible[
                                                                            index]
                                                                        .id
                                                              };
                                                              Navigator.pop(
                                                                  contextPageAvalibleDisciplineStudent,
                                                                  'Accept');
                                                              await disciplineRepository
                                                                  .disciplineChosedByStudentController(
                                                                      data);
                                                              await disciplineRepository
                                                                  .getDisciplineByStudentAvailibleListController();
                                                            } catch (e) {
                                                              final token =
                                                                  await readSecureData(
                                                                      'token');

                                                              return alertDialogStatus(
                                                                  context,
                                                                  e.toString(),
                                                                  () async {
                                                                await deleteSecureData(
                                                                    StorageItem(
                                                                        'token',
                                                                        token!));
                                                                Navigator.pushReplacementNamed(
                                                                    contextPageAvalibleDisciplineStudent,
                                                                    Routes
                                                                        .initial);
                                                              });
                                                            }
                                                          },
                                                              false,
                                                              _controllerDiscicpline,
                                                              null);
                                                        },
                                                        icon: const Icon(
                                                            Icons.add),
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  )
                                                : Container();
                                          }));
                                    },
                                  )
                                },
                                if (disciplineRepository
                                    .disciplineStudentAvailible.isEmpty) ...{
                                  SizedBox(
                                    height: MediaQuerySize.heigthSizeCustom(
                                            contextPageAvalibleDisciplineStudent) *
                                        0.70,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Center(
                                          child:
                                              Text("No discipline availible!"),
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
