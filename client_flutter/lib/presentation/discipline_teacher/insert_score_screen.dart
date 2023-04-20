import 'package:client_flutter/presentation/discipline_student/widgets/card_discipline_widget.dart';
import 'package:flutter/material.dart';
import '../../app/app.dart';
import '../common/alert_dialog.dart';

class InsertScoreScreen extends StatefulWidget {
  const InsertScoreScreen({super.key});

  @override
  State<InsertScoreScreen> createState() => _InsertScoreScreenState();
}

class _InsertScoreScreenState extends State<InsertScoreScreen> {
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
          "Insert Scores",
          style: TextStyle(color: ColorsTheme.secondaryColor),
        ),
      ),
      body: Container(
          height: MediaQuerySize.heigthSizeCustom(context),
          decoration: const BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
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
                        return const Text("Ola");
                      }))
                ],
              ),
            ),
          )),
    );
  }
}
