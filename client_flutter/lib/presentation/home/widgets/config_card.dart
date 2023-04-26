import 'package:flutter/material.dart';

import '../../../app/app.dart';

class CardConfig extends StatelessWidget {
  final String title;
  final String content;
  const CardConfig({
    Key? key,
    required this.title,
    required this.content
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorsTheme.primaryColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
             content,
              style: Theme.of(context).textTheme.headline1,
            ),
          ]),
    );
  }
}
