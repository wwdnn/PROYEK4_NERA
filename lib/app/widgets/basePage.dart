// ignore: file_names
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:proyek4_nera/app/modules/departemen/views/departemen_view.dart';
import 'package:proyek4_nera/app/modules/home/views/home_view.dart';

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
          backgroundColor: Color(0xFF345FB4),
          buttonBackgroundColor: Color.fromARGB(255, 255, 255, 255),
          animationDuration: const Duration(milliseconds: 500),
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
      widget = HomeView();
      break;
    case 1:
      widget = DepartemenView();
      break;
    default:
      widget = HomeView();
      break;
  }
  return widget;
}
