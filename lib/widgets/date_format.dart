import 'package:intl/intl.dart';

String dateFormat(DateTime date) {
  DateFormat dateFormat = DateFormat("dd MMMM yyyy");
  return dateFormat.format(date);
}

int dateOnly(DateTime date) {
  DateFormat dateFormat = DateFormat("dd");
  return int.parse(dateFormat.format(date));
}

String dayLeft(DateTime date) {
  int dateNow = dateOnly(DateTime.now());
  int dateEvent = dateOnly(date);
  int dayLeft = dateEvent - dateNow;

  if (dayLeft == 0) {
    return "Hari ini";
  } else if (dayLeft == 1) {
    return "Besok";
  } else if (dayLeft == -1) {
    return "Kemarin";
  } else if (dayLeft > 1) {
    return "Dalam $dayLeft hari";
  } else if (dayLeft < -1) {
    return "$dayLeft hari yang lalu";
  } else {
    return "";
  }
}

int dayLeftInt(DateTime date) {
  int dateNow = dateOnly(DateTime.now());
  int dateEvent = dateOnly(date);
  int dayLeft = dateEvent - dateNow;

  return dayLeft;
}
