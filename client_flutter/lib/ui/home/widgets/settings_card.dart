import 'package:flutter/material.dart';

class SettingsCard extends StatelessWidget {
  final String data;
  final String hintText;
  final Icon icon;
  const SettingsCard(
      {super.key,
      required this.data,
      required this.hintText,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        enabled: false,
        decoration: InputDecoration(
            labelText: hintText,
            hintText: data,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            prefixIcon: icon,
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 1.0,
              ),
            )),
      ),
    );
  }
}
