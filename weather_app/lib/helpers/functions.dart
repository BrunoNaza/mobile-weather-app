import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

String getCurrentDate() {
  initializeDateFormatting('pt_BR', null);
  DateTime now = DateTime.now();
  String formattedDate =
  capitalize(DateFormat('MMM, dd', 'pt_BR').format(now));
  return formattedDate;
}

String capitalize(String s) {
  return s.substring(0, 1).toUpperCase() + s.substring(1);
}


List<String> getNextFiveDays() {
  final List<String> daysOfWeek = ['Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado', 'Domingo'];
  final DateTime now = DateTime.now();
  final List<String> nextFiveDays = [];

  for (int i = 0; i < 5; i++) {
    final DateTime day = now.add(Duration(days: i));
    nextFiveDays.add(daysOfWeek[day.weekday - 1]);
  }

  return nextFiveDays;
}