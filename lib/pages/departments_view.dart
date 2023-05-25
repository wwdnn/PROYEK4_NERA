import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../controllers/departments_controller.dart';

import '../widgets/departments.dart';
import '../widgets/pengurus_department.dart';
import '../widgets/proker.dart';

class DepartmentsView extends GetView<DepartmentsController> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DepartmentsController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF345FB4),
        // background image
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/logo/background_pattern.png"),
              fit: BoxFit.cover,
              opacity: 0.2,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Center(
          child: Text(
            "DIVISI HIMAKOM",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Obx(
        () {
          return RefreshIndicator(
              onRefresh: controller.getData,
              child: controller.departments.value.data.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : Container(
                      child: PageView.builder(
                        itemCount: controller.departments.value.data.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: Get.height,
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: Color(0xFF345FB4),
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/logo/background_pattern.png"),
                                fit: BoxFit.cover,
                                opacity: 0.2,
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 175,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          alignment: Alignment.topCenter,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                            ),
                                          ),
                                          child: index == 0
                                              ? Container()
                                              : Container(
                                                  margin: EdgeInsets.only(
                                                      top: Get.height * 0.1),
                                                  padding:
                                                      EdgeInsets.only(left: 10),
                                                  child: Transform.rotate(
                                                    angle: 3.14,
                                                    child: Lottie.asset(
                                                        'assets/logo/118159-right-arrow-light.json'),
                                                  ),
                                                ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 6,
                                        child: Container(
                                          child: CarouselSlider(
                                            options: CarouselOptions(
                                              height: 180,
                                              viewportFraction: 0.6,
                                              enlargeCenterPage: true,
                                              enableInfiniteScroll: false,
                                              initialPage: 0,
                                            ),
                                            items: controller.departments.value
                                                .data[index].users
                                                .map((user) =>
                                                    PengurusDepartment(
                                                      avatar: user.avatar,
                                                      name: user.name,
                                                      role: user.role,
                                                    ))
                                                .toList(),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          alignment: Alignment.topCenter,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              bottomLeft: Radius.circular(20),
                                            ),
                                          ),
                                          child: index ==
                                                  controller.departments.value
                                                          .data.length -
                                                      1
                                              ? Container()
                                              : Container(
                                                  margin: EdgeInsets.only(
                                                      top: Get.height * 0.1),
                                                  padding: EdgeInsets.only(
                                                      right: 10),
                                                  child: Lottie.asset(
                                                      'assets/logo/118159-right-arrow-light.json'),
                                                ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 120,
                                          padding: EdgeInsets.only(top: 20),
                                          child: Departments(
                                            logo: controller.departments.value
                                                .data[index].logo,
                                            name: controller.departments.value
                                                .data[index].shortName,
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.only(top: 10),
                                            child: ListView.builder(
                                              itemCount: controller
                                                  .departments
                                                  .value
                                                  .data[index]
                                                  .programs
                                                  .length,
                                              itemBuilder: (context, index2) {
                                                return Container(
                                                  height: 80,
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                      vertical: 10),
                                                  padding: EdgeInsets.only(
                                                      left: 10,
                                                      top: 5,
                                                      bottom: 5),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.5),
                                                        spreadRadius: 1,
                                                        blurRadius: 7,
                                                        offset: Offset(0,
                                                            3), // changes position of shadow
                                                      ),
                                                    ],
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: 10),
                                                        child: Text(
                                                          controller
                                                                  .departments
                                                                  .value
                                                                  .data[index]
                                                                  .programs[
                                                              index2]['name'],
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontSize: 20,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    0,
                                                                    0,
                                                                    0),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            letterSpacing: 1,
                                                          ),
                                                          overflow:
                                                              TextOverflow.fade,
                                                          maxLines: 1,
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: 10, top: 5),
                                                        child: Text(
                                                          controller
                                                                  .departments
                                                                  .value
                                                                  .data[index]
                                                                  .programs[index2]
                                                              ['description'],
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontSize: 16,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    0,
                                                                    0,
                                                                    0),
                                                            letterSpacing: 0.7,
                                                          ),
                                                          overflow:
                                                              TextOverflow.fade,
                                                          maxLines: 1,
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: 10, top: 5),
                                                        child: Text(
                                                          controller
                                                                  .departments
                                                                  .value
                                                                  .data[index]
                                                                  .programs[index2]
                                                              [
                                                              'ketua_pelaksana'],
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontSize: 13,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    0,
                                                                    0,
                                                                    0),
                                                            letterSpacing: 0.7,
                                                          ),
                                                          overflow:
                                                              TextOverflow.fade,
                                                          maxLines: 1,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        onPageChanged: (value) {
                          controller.currentIndex.value = value;
                        },
                      ),
                    )
              //
              );
        },
      ),
    );
  }
}
