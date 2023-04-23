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
        body: Obx(() {
          return RefreshIndicator(
            onRefresh: () => Future.delayed(Duration(seconds: 1)),
            child: controller.departmentsData.isEmpty
                ? Center(child: CircularProgressIndicator())
                : SlidingUpPanel(
                    maxHeight: Get.height * 0.5,
                    minHeight: Get.height * 0.3,
                    parallaxEnabled: true,
                    parallaxOffset: 0.5,
                    color: Colors.transparent,
                    body: PageView.builder(
                        itemCount: controller.departmentsData.length,
                        itemBuilder: (context, index) {
                          return Container(
                              height: Get.height,
                              width: Get.width,
                              alignment: Alignment.topCenter,
                              decoration: BoxDecoration(
                                color: Color(0xFF345FB4),
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/logo/background_pattern.png"),
                                  fit: BoxFit.cover,
                                  opacity: 0.2,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
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
                                                  top: Get.height * 0.2),
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: Transform.rotate(
                                                angle: 3.14,
                                                child: Lottie.network(
                                                  'https://assets10.lottiefiles.com/packages/lf20_Dob5qfagRb.json',
                                                ),
                                              ),
                                            ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 15,
                                    child: Container(
                                        alignment: Alignment.topCenter,
                                        margin: EdgeInsets.only(
                                            top: Get.height * 0.1),
                                        child: CarouselSlider(
                                          options: CarouselOptions(
                                            enlargeCenterPage: true,
                                            enableInfiniteScroll: false,
                                          ),
                                          items: List<Widget>.from(controller
                                              .departmentsData[index]['users']
                                              .map((item) {
                                            return PengurusDepartment(
                                              avatar: controller
                                                      .departmentsData[index]
                                                  ['users'][0]['avatar'],
                                              name: controller
                                                      .departmentsData[index]
                                                  ['users'][0]['name'],
                                              role: controller
                                                      .departmentsData[index]
                                                  ['users'][0]['role'],
                                            );
                                          }).toList()),
                                        )),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                        alignment: Alignment.topCenter,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            bottomLeft: Radius.circular(20),
                                          ),
                                        ),
                                        child: index ==
                                                controller.departmentsData
                                                        .length -
                                                    1
                                            ? Container()
                                            : Container(
                                                margin: EdgeInsets.only(
                                                    top: Get.height * 0.2),
                                                padding:
                                                    EdgeInsets.only(right: 10),
                                                child: Lottie.network(
                                                  'https://assets10.lottiefiles.com/packages/lf20_Dob5qfagRb.json',
                                                ),
                                              )),
                                  ),
                                ],
                              ));
                        },
                        onPageChanged: (index) {
                          controller.currentIndex.value = index;
                        }),
                    collapsed: Departments(
                      logo: controller
                              .departmentsData[controller.currentIndex.value]
                          ['logo'],
                      name: controller
                              .departmentsData[controller.currentIndex.value]
                          ['short_name'],
                    ),
                    panelBuilder: (ScrollController sc) {
                      return Proker(
                        controller: sc,
                      );
                    },
                  ),
          );
        }));
  }
}
