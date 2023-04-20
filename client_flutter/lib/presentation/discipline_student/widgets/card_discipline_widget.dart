import 'package:flutter/material.dart';

class CardDisciplineWidget extends StatelessWidget {
  final String name;
  final String discipline;
  final String argsExtra;
  final Widget iconWidget;
  final Icon iconChose;
  const CardDisciplineWidget(
      {Key? key,
      required this.iconWidget,
      required this.name,
      required this.discipline,
      required this.iconChose,
      required this.argsExtra})
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          iconChose,
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                discipline,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(name),
              Text(argsExtra)
            ],
          ),
          const SizedBox(),
          iconWidget
        ],
      ),
    );
  }
}


/*


          

          

*/