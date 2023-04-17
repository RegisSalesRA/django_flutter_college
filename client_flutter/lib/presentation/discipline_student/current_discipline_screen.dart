import 'package:client_flutter/presentation/discipline_student/widgets/card_discipline_widget.dart';
import 'package:flutter/material.dart';

import '../../app/colors/colors.dart';
import '../../app/helpers/media_size_helper.dart';

class CurrentDisciplinesScreen extends StatefulWidget {
  const CurrentDisciplinesScreen({super.key});

  @override
  State<CurrentDisciplinesScreen> createState() =>
      _CurrentDisciplinesScreenState();
}

class _CurrentDisciplinesScreenState extends State<CurrentDisciplinesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: ColorsTheme.secondaryColor,
        title: const Text("Discipline Current"),
      ),
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
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                        //    controller: widget.textController,
                        //    onChanged: widget.onChanged,
                        style: const TextStyle(color: ColorsTheme.primaryColor),
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.black),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 15.0),
                          fillColor: ColorsTheme.primaryColor,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          hintText: 'Search notes',
                          prefixIcon: const Icon(
                            Icons.search,
                            size: 30.0,
                          ),
                        )),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: 10,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: ((context, index) {
                          return const CardDisciplineWidget();
                        }))
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
