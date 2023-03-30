// ignore: file_names
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../pages/departments_view.dart';
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
        bottomNavigationBar: CurvedNavigationBar(
          index: index,
          color: Color.fromARGB(255, 255, 255, 255),
          backgroundColor: Colors.white,
          buttonBackgroundColor: Colors.white,
          animationDuration: const Duration(milliseconds: 700),
          height: 65,
          items: <Widget>[
            Icon(
              Icons.home,
              size: 30,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            Image.asset(
              'assets/logo/Vector.png',
              width: 30,
              height: 30,
            ),
            Image.asset(
              'assets/logo/Logo_HIMAKOM.png',
              width: 60,
              height: 60,
            ),
            Icon(Icons.calendar_month_outlined,
                size: 30, color: Color.fromARGB(255, 0, 0, 0)),
            Icon(Icons.person, size: 30, color: Color.fromARGB(255, 0, 0, 0)),
          ],
          onTap: (selectedIndex) {
            setState(() {
              index = selectedIndex;
            });
          },
          letIndexChange: (index) => true,
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
      widget = HomeV();
      break;
    case 3:
      widget = HomeV();
      break;
    case 4:
      widget = ProfileView();
      break;
    default:
      widget = HomeV();
      break;
  }
  return widget;
}
