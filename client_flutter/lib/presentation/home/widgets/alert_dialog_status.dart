import 'package:flutter/material.dart';

Future<String?> alertDialogStatus(
  var context,
  description,
  var onPressed,
) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Center(child: Text('Error')),
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        Text(description),
      ]),
      actions: <Widget>[
        Center(
          child: TextButton(
            onPressed: onPressed,
            child: const Text('Ok'),
          ),
        )
      ],
    ),
  );
}
