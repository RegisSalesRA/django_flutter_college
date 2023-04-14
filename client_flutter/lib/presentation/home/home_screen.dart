import 'package:client_flutter/presentation/common/grid_widget.dart';
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
      appBar: AppBar(
          backgroundColor: ColorsTheme.secondaryColor,
          elevation: 0,
          title: const Text("Ola usuario")),
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
                    icon: const Icon(Icons.percent),
                    voidCall: () {},
                    text_1: "OLA",
                    text_2: "OLA",
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  GridComponent(
                    icon: const Icon(Icons.percent),
                    voidCall: () {},
                    text_1: "OLA",
                    text_2: "OLA",
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
                    icon: const Icon(Icons.percent),
                    voidCall: () {},
                    text_1: "OLA",
                    text_2: "OLA",
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  GridComponent(
                    icon: const Icon(Icons.percent),
                    voidCall: () {},
                    text_1: "OLA",
                    text_2: "OLA",
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
