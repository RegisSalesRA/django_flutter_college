import 'package:flutter/material.dart';

class GridComponent extends StatelessWidget {
  final VoidCallback voidCall;
  final String nameImage;
  final String text_1;
  final String text_2;
  const GridComponent(
      {Key? key,
      required this.voidCall,
      required this.nameImage,
      required this.text_1,
      required this.text_2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: voidCall,
      child: Column(
        children: [
          Container(
            height: 170,
            width: 170,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/$nameImage'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: text_1,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.grey)),
              TextSpan(
                text: " $text_2",
                style: Theme.of(context).textTheme.headline2,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
