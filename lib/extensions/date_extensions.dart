import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String get workDate => DateFormat('MMM yyyy', 'pt_BR').format(this).replaceAll(".", "").toUpperCase();
}
