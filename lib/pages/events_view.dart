import "package:flutter/material.dart";
import "package:get/get.dart";

import "../controllers/events_controller.dart";
import "../widgets/date_now.dart";
import "../widgets/datepicker_horizontal.dart";
import "../widgets/dropdown_filter.dart";
import "../widgets/info_kegiatan.dart";
import "../widgets/list_acara.dart";

class EventsView extends GetView<EventsController> {
  @override
  Widget build(BuildContext context) {
    final eventsC = Get.put(EventsController());
    return Scaffold(
      body: Obx(() {
        return RefreshIndicator(
          onRefresh: () => Future.delayed(Duration(seconds: 1)),
          child: eventsC.filterDataType.isEmpty
              ? Center(child: CircularProgressIndicator())
              : Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF345FB4),
                    image: DecorationImage(
                      image: AssetImage("assets/logo/background_pattern.png"),
                      fit: BoxFit.cover,
                      opacity: 0.2,
                    ),
                  ),
                  child: Column(
                    children: [
                      SafeArea(
                          child: Column(
                        children: [
                          Container(
                              margin:
                                  EdgeInsets.only(left: 20, right: 20, top: 10),
                              child: BarDateNowWidget(
                                jumlahKegiatan: eventsC.filterDataDate.length,
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 5, left: 20),
                              child: HorizontalDatePicker(
                                onDateChange: eventsC.filterDataByDate,
                              ))
                        ],
                      )),
                      Expanded(
                        child: Container(
                            margin: EdgeInsets.only(top: 15),
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InfoKegiatanHimpunan(
                                  jumlahKegiatan: eventsC.filterDataDate.length,
                                  listKegiatan: [...eventsC.filterDataDate],
                                ),
                                DropdownFilter(eventsC.selectedValue,
                                    eventsC.filterDataByType),
                                Expanded(
                                  child: ListAcara(
                                    listAcara: [...eventsC.filterDataType],
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
        );
      }),
    );
  }
}
