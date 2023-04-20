import 'package:flutter/material.dart';
import '../../../app/app.dart';

class CardDisciplineWidget extends StatelessWidget {
  final String name;
  final String discipline;
  final String date;
  final Widget iconWidget;
  const CardDisciplineWidget(
      {Key? key,
      required this.iconWidget,
      required this.name,
      required this.discipline,
      required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 45,
                  width: 45,
                  decoration: const BoxDecoration(
                      color: ColorsTheme.primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  child: const Icon(
                    Icons.menu_book_outlined,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Discipline - $discipline",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text("Teacher - $name"),
                    Text("Created at - $date")
                  ],
                ),
                Expanded(child: Container()),
                iconWidget,
              ],
            ),
          ]),
    );
  }
}
