  import 'package:intl/intl.dart';

String dateTimeFormat(data) {
    final formattedDate = DateFormat.yMMMEd().format(data);
    return formattedDate;
  }