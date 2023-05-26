import 'package:client_flutter/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<String?> alertDialog(
    var context,
    title,
    description,
    var onPressed,
    bool isTextInput,
    TextEditingController controller,
    GlobalKey? formKeyDialog) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Center(child: Text(title)),
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        Text(description),
        if (isTextInput)
          Form(
            key: formKeyDialog,
            child: TextFormField(
                controller: controller,
                style: const TextStyle(color: ColorsTheme.primaryColor),
                maxLength: 2,
                decoration: const InputDecoration(
                  hintText: 'insert score here',
                ),
                validator: (value) {
                  if (controller.text.isEmpty) {
                    return "field can not be empty";
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ]),
          )
        else
          Container(),
      ]),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: onPressed,
              child: const Text('Accept'),
            ),
          ],
        ),
      ],
    ),
  );
}
