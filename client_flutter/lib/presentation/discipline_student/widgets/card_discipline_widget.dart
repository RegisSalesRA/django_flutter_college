
import 'package:flutter/material.dart';

class CardDisciplineWidget extends StatelessWidget {
  const CardDisciplineWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.green.shade100,
          borderRadius: const BorderRadius.all(
              Radius.circular(15))),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment:
                  CrossAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(
                          Radius.circular(15))),
                  child: const Icon(
                      Icons.menu_book_outlined),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Disciplina - name",
                      style: TextStyle(
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Professor - name"),
                    Text("Criada em -  ????")
                  ],
                ),
                Expanded(child: Container()),
                Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(
                          Radius.circular(15))),
                  child: IconButton(
                    icon: const Icon(
                        Icons.bookmark_remove_outlined),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ]),
    );
  }
}
