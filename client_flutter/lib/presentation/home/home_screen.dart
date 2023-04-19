import 'package:client_flutter/app/colors/colors.dart';
import 'package:client_flutter/app/routes/routes.dart';
import 'package:client_flutter/presentation/common/grid_widget.dart';
import 'package:client_flutter/presentation/home/widgets/drawer.dart';
import 'package:flutter/material.dart';

import '../../app/helpers/media_size_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
          backgroundColor: Colors.white10,
          elevation: 0,
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(
                Icons.subject_outlined,
                color: ColorsTheme.secondaryColor,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          centerTitle: true,
          title: Text(
            "Home Screen",
            style: Theme.of(context).textTheme.headline1,
          )),
      body: Container(
        height: MediaQuerySize.heigthSizeCustom(context),
        decoration: const BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GridComponent(
                    nameImage: "current_discipline.png",
                    voidCall: () {
                      Navigator.pushNamed(context, Routes.currentDiscipline);
                    },
                    text_1: "Current",
                    text_2: "Disciplines",
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  GridComponent(
                    nameImage: "availible_disciplines.png",
                    voidCall: () {
                      Navigator.pushNamed(context, Routes.availibleDiscipline);
                    },
                    text_1: "Avalible",
                    text_2: "Disciplines",
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GridComponent(
                    nameImage: "insert_score.png",
                    voidCall: () {
                      Navigator.pushNamed(context, Routes.insertScoreScreen);
                    },
                    text_1: "Score",
                    text_2: "Insert",
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  GridComponent(
                    nameImage: "teacher_disciplines.png",
                    voidCall: () {
                      Navigator.pushNamed(context, Routes.teacherDiscipline);
                    },
                    text_1: "Teacher",
                    text_2: "Disciplines",
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  GridComponent(
                    nameImage: "discipline_score.png",
                    voidCall: () {
                      Navigator.pushNamed(context, Routes.scoreDiscipline);
                    },
                    text_1: "Discipline",
                    text_2: "Scores",
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
