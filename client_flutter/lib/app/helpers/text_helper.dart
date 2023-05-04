import 'package:flutter/material.dart';

formatScore(value) {
  if (value != null) {
    var valueDouble = double.parse(value);

    if (valueDouble == 10) {
      return valueDouble;
    }
    if (valueDouble != 10) {
      var formeted = (valueDouble / 10.0);
      return formeted;
    }
  }
}

formatScoreColor(value) {
  var valueDouble = formatScore(value);
  if (value != null) {
    if (valueDouble >= 7) {
      return Colors.green;
    }
    if (valueDouble < 7) {
      return Colors.red;
    }
  }
  return Colors.black;
}
