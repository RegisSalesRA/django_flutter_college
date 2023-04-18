import 'package:flutter/material.dart';

Future<String?> alertDialog(
    BuildContext context, title, description, void onPressed) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Center(child: Text(title)),
      content: Text(description),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            onPressed;
            Navigator.pop(context, 'Cancel');
          },
          child: const Text('Accept'),
        ),
      ],
    ),
  );
}
