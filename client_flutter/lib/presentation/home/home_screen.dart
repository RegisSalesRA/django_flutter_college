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
                    icon: const Icon(
                      Icons.event_available_sharp,
                      size: 110,
                    ),
                    voidCall: () {},
                    text_1: "Current",
                    text_2: "Disciplines",
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  GridComponent(
                    icon: const Icon(
                      Icons.event_sharp,
                      size: 110,
                    ),
                    voidCall: () {},
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
                    icon: const Icon(
                      Icons.event_busy_outlined,
                      size: 110,
                    ),
                    voidCall: () {},
                    text_1: "Remove",
                    text_2: "Discipline",
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  GridComponent(
                    icon: const Icon(
                      Icons.history,
                      size: 110,
                    ),
                    voidCall: () {},
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
