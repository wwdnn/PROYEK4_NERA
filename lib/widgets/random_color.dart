import 'package:flutter/material.dart';

Color randomColor(int index) {
  List<Color> colors = [
    Color(0xFFEB455F),
    Color(0xFFA459D1),
    Color(0xFFF7A4A4)
  ];
  return colors[index % colors.length];
}

Color colorByDayLeft(int dayLeft) {
  if (dayLeft < 0) {
    return Color(0xFFFF1E00);
  } else if (dayLeft == 0) {
    return Color(0xFF3EC70B);
  } else {
    return Color(0xFF2192FF);
  }
}
