import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../controllers/departments_controller.dart';

class DepartmentsView extends GetView<DepartmentsController> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DepartmentsController());
    return Scaffold(body: Obx(() {
      return RefreshIndicator(
        onRefresh: () => Future.delayed(Duration(seconds: 1)),
        child: controller.departmentsData.isEmpty
            ?
            // Loading menunggu data controller.departmentsData tidak kosong lagi
            Center(child: CircularProgressIndicator())
            : SlidingUpPanel(
                maxHeight: Get.height * 0.5,
                minHeight: Get.height * 0.3,
                parallaxEnabled: true,
                parallaxOffset: 0.65,
                color: Colors.transparent,
                body: PageView.builder(
                    itemBuilder: (context, index) {
                      return Container(
                          color: Color(0xFF345FB4),
                          padding: EdgeInsets.only(
                              top: Get.height * 0.2, left: Get.width * 0.25),
                          child: Stack(
                            children: [
                              Container(
                                height: 210,
                                child: Image.network(
                                    controller.departmentsData[index]['users']
                                        [0]['avatar'],
                                    fit: BoxFit.cover),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 150),
                                child: Container(
                                  width: 170,
                                  height: 65,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        Color.fromARGB(255, 52, 95, 180)
                                            .withOpacity(0.85),
                                        Color.fromARGB(255, 9, 130, 207)
                                            .withOpacity(0.81),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(bottom: 3),
                                        child: Text(
                                          controller.departmentsData[index]
                                              ['users'][0]['name'],
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          controller.departmentsData[index]
                                              ['users'][0]['role'],
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ));
                    },
                    itemCount: controller.departmentsData.length,
                    onPageChanged: (index) {
                      controller.currentIndex.value = index;
                    }),
                collapsed: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          margin: EdgeInsets.only(bottom: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 50,
                                height: 5,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 250,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Image.asset(
                                    'assets/logo/department_${controller.currentIndex.value + 1}.png'),
                              ),
                              Text(
                                controller.departmentsData[
                                    controller.currentIndex.value]['name'],
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                    // Text(
                    //     "Department ${controller.departmentsData[controller.currentIndex.value].namaDepartment}")
                    ),
                panelBuilder: (ScrollController sc) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      color: Colors.white,
                    ),
                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          margin: EdgeInsets.only(bottom: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 50,
                                height: 5,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ListView.builder(
                          controller: sc,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.only(
                                  top: 10, left: 20, right: 20, bottom: 10),
                              margin: EdgeInsets.only(
                                  left: 20, right: 20, bottom: 5, top: 20),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      '2',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 10, top: 5),
                                    child: Text(
                                      '2',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  // progress bar
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    alignment: Alignment.centerLeft,
                                    child: LinearPercentIndicator(
                                      width: MediaQuery.of(context).size.width -
                                          100,
                                      animation: true,
                                      lineHeight: 15.0,
                                      animationDuration: 2000,
                                      percent: 10,
                                      center: Text('2'),
                                      barRadius: Radius.circular(20),
                                      progressColor:
                                          Color.fromARGB(255, 0, 226, 50),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          itemCount: 3,
                        ),
                      ],
                    ),
                  );
                },
              ),
      );
    }));
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2.25, size.height - 30.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
        Offset(size.width - (size.width / 3.25), size.height - 65);
    var secondEndPoint = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CardDepartment extends StatelessWidget {
  final String titleDepartment;
  final String image;

  const CardDepartment({required this.titleDepartment, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Expanded(
            child:
                Container(child: Image.asset(image), width: 100, height: 100),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Text(titleDepartment,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto')),
          ),
        ],
      ),
    );
  }
}
