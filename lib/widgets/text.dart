import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class WidgetText {
  String text;
  Color color;
  double fontSize;
  FontWeight fontWeight;
  
  WidgetText({
    required this.text,
    required this.color,
    required this.fontSize,
    required this.fontWeight,
  });

  Widget build() {
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
