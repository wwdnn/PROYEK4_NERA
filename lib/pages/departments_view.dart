import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../controllers/departments_controller.dart';

import '../widgets/departments.dart';
import '../widgets/pengurus_department.dart';
import '../widgets/proker.dart';

class DepartmentsView extends GetView<DepartmentsController> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DepartmentsController());
    return Scaffold(body: Obx(() {
      return RefreshIndicator(
        onRefresh: () => Future.delayed(Duration(seconds: 1)),
        child: controller.departmentsData.isEmpty
            ? Center(child: CircularProgressIndicator())
            : SlidingUpPanel(
                maxHeight: Get.height * 0.5,
                minHeight: Get.height * 0.3,
                parallaxEnabled: true,
                parallaxOffset: 0.65,
                color: Colors.transparent,
                body: PageView.builder(
                    itemCount: controller.departmentsData.length,
                    itemBuilder: (context, index) {
                      return Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF345FB4),
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/logo/background_pattern.png"),
                              fit: BoxFit.cover,
                              opacity: 0.2,
                            ),
                          ),
                          padding: EdgeInsets.only(
                              top: Get.height * 0.2, left: Get.width * 0.25),
                          child: PengurusDepartment(
                              controller.departmentsData[index]['users'][0]
                                  ['avatar'],
                              controller.departmentsData[index]['users'][0]
                                  ['name'],
                              controller.departmentsData[index]['users'][0]
                                  ['role']));
                    },
                    onPageChanged: (index) {
                      controller.currentIndex.value = index;
                    }),
                collapsed: Departments(
                    controller.departmentsData[controller.currentIndex.value]
                        ['logo'],
                    controller.departmentsData[controller.currentIndex.value]
                        ['short_name']),
                panelBuilder: (ScrollController sc) {
                  return Proker();
                },
              ),
      );
    }));
  }
}
