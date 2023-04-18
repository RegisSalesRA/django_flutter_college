import 'package:client_flutter/app/colors/colors.dart';
import 'package:flutter/material.dart';

import '../../common/alert_dialog.dart';

class CardDisciplineWidget extends StatelessWidget {
  final Widget iconWidget;
  const CardDisciplineWidget({
    Key? key,
    required this.iconWidget
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                      color: ColorsTheme.primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
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
                  children: const [
                    Text(
                      "Disciplina - name",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Professor - name"),
                    Text("Criada em -  ????")
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
