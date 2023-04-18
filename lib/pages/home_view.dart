import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../controllers/home_controller.dart';
// import '../widgets/carousel_kepengurusan.dart';

class HomeV extends GetView<HomeC> {
  @override
  Widget build(BuildContext context) {
    final homeC = Get.put(HomeC());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF345FB4),
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          elevation: 2,
          // row content
          title: Row(children: [
            // logo
            Container(
              height: 50,
              width: 50,
              child: Image.asset('assets/logo/dp.png'),
            ),

            // nama user
            Container(
              padding: EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // column content
                children: [
                  // nama user
                  Text(
                    'WILDAN',
                    style: TextStyle(fontSize: 23),
                  ),

                  // status user
                  Text(
                    'Anggota',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            )
          ]),

          // icon
          actions: [
            // icon
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {},
            ),
          ],
        ),
        body: Obx(() {
          return RefreshIndicator(
            onRefresh: homeC.getKepengurusan,
            child: homeC.kabinetData.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView(children: [
                    ClipPath(
                      clipper: DrawClip(),
                      child: Container(
                          height: 280,
                          color: Color(0xFF345FB4),
                          child: CarouselSlider(
                            options: CarouselOptions(
                              height: 300.0,
                              enlargeCenterPage: true,
                              viewportFraction: 0.5,
                              enableInfiniteScroll: false,
                            ),
                            items: homeC.kepengurusanData.map((item) {
                              final index =
                                  homeC.kepengurusanData.indexOf(item);
                              return Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: 200,
                                    child: Image.network(
                                        homeC.kepengurusanData[index]['avatar'],
                                        fit: BoxFit.cover),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 150),
                                    child: Container(
                                      width: 160,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            homeC.kepengurusanData[index]
                                                ['name'],
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            homeC.kepengurusanData[index]
                                                ['role'],
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          )),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            alignment: Alignment.topLeft,
                            child: Text("Kabinet",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 3,
                                    child: Container(
                                      height: 140,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        // shadow
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 0,
                                            blurRadius: 7,
                                            offset: Offset(0, 5),
                                          ),
                                        ],
                                        color: Colors.white,
                                      ),
                                      child: Image.network(
                                        homeC.kabinetData[0]['logo'],
                                      ),
                                    )),
                                Expanded(
                                  flex: 7,
                                  child: Container(
                                    height: 140,
                                    margin: EdgeInsets.only(left: 10),
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      // shadow
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 0,
                                          blurRadius: 7,
                                          offset: Offset(0, 5),
                                        ),
                                      ],
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(bottom: 5),
                                          child: Text(
                                            homeC.kabinetData[0]['name'],
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            homeC.kabinetData[0]['description'],
                                            style: TextStyle(
                                              fontSize: 16,
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            TextButton(
                                              onPressed: () => {
                                                showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      // card
                                                      return Dialog(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                          elevation: 16,
                                                          child: Container(
                                                              height: 300));
                                                    })
                                              },
                                              child: Text("Detail Kabinet",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Color.fromARGB(
                                                          255, 219, 43, 43))),
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              color: Color.fromARGB(
                                                  255, 219, 43, 43),
                                              size: 16,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
          );
        }));
  }
}

class DrawClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    var firstControlPoint = Offset(size.width / 10, size.height);
    var firstEndPoint = Offset(size.width / 2.5, size.height - 40.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx + 80, firstEndPoint.dy);
    var secondControlPoint =
        Offset(size.width - (size.width / 3.5), size.height - 65);
    var secondEndPoint = Offset(size.width, size.height);
    path.quadraticBezierTo(secondControlPoint.dx + 50, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
