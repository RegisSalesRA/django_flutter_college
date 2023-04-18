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
        iconTheme: const IconThemeData(
          color: ColorsTheme.secondaryColor,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white10,
        title: const Text(
          "Discipline Current",
          style: TextStyle(color: ColorsTheme.secondaryColor),
        ),
      ),
      body: Container(
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
                      //    controller: widget.textController,
                      //    onChanged: widget.onChanged,
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
    );
  }
}
