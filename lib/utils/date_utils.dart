import 'package:intl/intl.dart';

String formatShortDate(String isoDate) {
  final dateTime = DateTime.parse(isoDate);
  return DateFormat('MMM d').format(dateTime);
}