// ignore: file_names
import 'package:flutter/material.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../pages/departments_view.dart';
import '../pages/events_view.dart';
import '../pages/home_view.dart';
import '../pages/profile_view.dart';

class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: index,
          onTap: (i) => setState(() => index = i),
          duration: Duration(milliseconds: 900),
          curve: Curves.ease,
          items: [
            SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text("Beranda"),
              selectedColor: Color(0xFF345FB4),
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.people),
              title: Text("Divisi"),
              selectedColor: Color(0xFF345FB4),
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.calendar_today),
              title: Text("Kegiatan"),
              selectedColor: Color(0xFF345FB4),
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.person),
              title: Text("Profil"),
              selectedColor: Color(0xFF345FB4),
            ),
          ],
        ),
        body: Container(
          child: getSelectedWidget(index: index),
        ));
  }
}

Widget getSelectedWidget({required int index}) {
  Widget widget;
  switch (index) {
    case 0:
      widget = HomeV();
      break;
    case 1:
      widget = DepartmentsView();
      break;
    case 2:
      widget = EventsView();
      break;
    case 3:
      widget = ProfileView();
      break;
    default:
      widget = HomeV();
      break;
  }
  return widget;
}
