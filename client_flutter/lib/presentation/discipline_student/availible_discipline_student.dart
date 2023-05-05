// ignore_for_file: use_build_context_synchronously

import 'package:client_flutter/presentation/common/alert_dialog.dart';
import 'package:client_flutter/presentation/discipline_student/widgets/card_discipline_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/app.dart';
import '../../data/repository/discipline_repository.dart';

class AvailibleDisciplinesScreen extends StatefulWidget {
  const AvailibleDisciplinesScreen({super.key});

  @override
  State<AvailibleDisciplinesScreen> createState() =>
      _AvailibleDisciplinesScreenState();
}

class _AvailibleDisciplinesScreenState
    extends State<AvailibleDisciplinesScreen> {
  bool _initialized = false;
  String valueList = "";
  final TextEditingController _controllerAdsicpline = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<DisciplineRepository>(context, listen: false)
          .getDisciplineByStudentAvailibleListRepository();
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
            "Availible Disciplines",
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
                            .disciplineStudentAvailible.isNotEmpty) ...{
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: disciplineList
                                  .disciplineStudentAvailible.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: ((context, index) {
                                return disciplineList
                                        .disciplineStudentAvailible[index].name
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
                                            .disciplineStudentAvailible[index]
                                            .name,
                                        name:
                                            "Teacher - ${disciplineList.disciplineStudentAvailible[index].teacher.name}",
                                        argsExtra:
                                            "Created at - ${dateTimeFormat(disciplineList.disciplineStudentAvailible[index].createAt)}",
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
                                                '${disciplineList.disciplineStudentAvailible[index].name}',
                                                'Are you sure you want accept this discipline? after that you can not back your decision',
                                                () async {
                                              var data = {
                                                "id_discpline": disciplineList
                                                    .disciplineStudentAvailible[
                                                        index]
                                                    .id
                                              };
                                              await disciplineList
                                                  .disciplineChosedByStudentRepository(
                                                      data);
                                              Navigator.of(context).pop();
                                              await disciplineList
                                                  .getDisciplineByStudentAvailibleListRepository();
                                            }, false, _controllerAdsicpline),
                                            icon: const Icon(Icons.add),
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    : Container();
                              }))
                        },
                        if (disciplineList
                            .disciplineStudentAvailible.isEmpty) ...{
                          SizedBox(
                            height:
                                MediaQuerySize.heigthSizeCustom(context) * 0.70,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Center(
                                  child: Text("No discipline availible!"),
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
