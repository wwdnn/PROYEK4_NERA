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
                : SlidingUpPanel(
                    maxHeight: Get.height * 0.5,
                    minHeight: Get.height * 0.3,
                    parallaxEnabled: true,
                    parallaxOffset: 0.5,
                    color: Colors.transparent,
                    body: PageView.builder(
                        itemCount: controller.departments.value.data.length,
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
                                                child: Lottie.asset(
                                                    'assets/logo/118159-right-arrow-light.json'),
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
                                            viewportFraction: 0.5,
                                            enlargeCenterPage: true,
                                            enableInfiniteScroll: false,
                                          ),
                                          items: List<Widget>.from(controller
                                              .departments.value.data
                                              .expand((dept) => dept.users)
                                              .map((user) => PengurusDepartment(
                                                    avatar: user.avatar,
                                                    name: user.name,
                                                    role: user.role,
                                                  ))).toList(),
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
                                              controller.departments.value.data
                                                      .length -
                                                  1
                                          ? Container()
                                          : Container(
                                              margin: EdgeInsets.only(
                                                  top: Get.height * 0.2),
                                              padding:
                                                  EdgeInsets.only(right: 10),
                                              child: Lottie.asset(
                                                  'assets/logo/118159-right-arrow-light.json'),
                                            ),
                                    ),
                                  ),
                                ],
                              ));
                        },
                        onPageChanged: (index) {
                          controller.currentIndex.value = index;
                        }),
                    collapsed: Departments(
                      logo: controller.departments.value
                          .data[controller.currentIndex.value].logo,
                      name: controller.departments.value
                          .data[controller.currentIndex.value].shortName,
                    ),
                    panelBuilder: (ScrollController sc) {
                      return Proker(
                        controller: sc,
                      );
                    },
                  ),
          );
        },
      ),
    );
  }
}
