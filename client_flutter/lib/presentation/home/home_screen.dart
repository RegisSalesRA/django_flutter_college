import 'package:client_flutter/app/routes/routes.dart';
import 'package:client_flutter/presentation/common/grid_widget.dart';
import 'package:client_flutter/presentation/home/widgets/drawer.dart';
import 'package:flutter/material.dart';

import '../../app/colors/colors.dart';
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
          backgroundColor: ColorsTheme.secondaryColor,
          elevation: 0,
          centerTitle: true,
          title: const Text("Home Screen")),
      body: Container(
        height: MediaQuerySize.heigthSizeCustom(context),
        decoration: const BoxDecoration(
          color: ColorsTheme.secondaryColor,
        ),
        child: Container(
          margin: EdgeInsets.only(
              top: MediaQuerySize.heigthSizeCustom(context) * 0.10),
          height: MediaQuerySize.heigthSizeCustom(context) * 0.90,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GridComponent(
                    nameImage: "teacher_register.png",
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
                    nameImage: "teacher_register.png",
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
                    nameImage: "teacher_register.png",
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
                    nameImage: "teacher_register.png",
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
                    nameImage: "teacher_register.png",
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
