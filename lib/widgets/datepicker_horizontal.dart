import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HorizontalDatePicker extends StatelessWidget {
  final Function(DateTime) onDateChange;

  const HorizontalDatePicker({Key? key, required this.onDateChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DatePicker(
      DateTime.now(),
      width: 80,
      height: 85,
      initialSelectedDate: DateTime.now(),
      selectionColor: Colors.white,
      selectedTextColor: Colors.black,
      dateTextStyle: GoogleFonts.poppins(
          color: Color.fromARGB(255, 255, 255, 255),
          fontSize: 20,
          fontWeight: FontWeight.bold),
      dayTextStyle: GoogleFonts.poppins(
          color: Color.fromARGB(255, 255, 255, 255),
          fontSize: 15,
          fontWeight: FontWeight.bold),
      monthTextStyle: GoogleFonts.poppins(
          color: Color.fromARGB(255, 255, 255, 255),
          fontSize: 15,
          fontWeight: FontWeight.bold),
      locale: 'id',
      onDateChange: (date) {
        onDateChange(date);
      },
    );
  }
}
