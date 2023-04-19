import "dart:math";

import "package:flutter/material.dart";
import "package:get/get.dart";
import 'package:date_picker_timeline/date_picker_timeline.dart';
import "package:google_fonts/google_fonts.dart";
import "package:intl/intl.dart";

import "../controllers/events_controller.dart";

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
                  decoration: BoxDecoration(color: Color(0xFF345FB4)),
                  child: Column(
                    children: [
                      SafeArea(
                          child: Column(
                        children: [
                          Container(
                            margin:
                                EdgeInsets.only(left: 20, right: 20, top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          DateFormat.yMMMMd()
                                              .format(DateTime.now()),
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold)),
                                      Text("Hari ini",
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    print("hello");
                                  },
                                  child: Container(
                                    width: 120,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.white,
                                    ),
                                    child: Center(
                                      child: Text("Detail Kegiatan",
                                          style: GoogleFonts.poppins(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5, left: 20),
                            child: DatePicker(
                              DateTime.now(),
                              width: 80,
                              height: 85,
                              initialSelectedDate: DateTime.now(),
                              selectionColor: Colors.white,
                              selectedTextColor: Colors.black,
                              dateTextStyle: GoogleFonts.poppins(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                              dayTextStyle: GoogleFonts.poppins(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                              monthTextStyle: GoogleFonts.poppins(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                              locale: 'id',
                              onDateChange: (date) {
                                // New date selected
                                eventsC.filterDataByDate(date);
                              },
                            ),
                          ),
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
                                Container(
                                    height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromARGB(40, 0, 0, 0),
                                          offset: Offset(0, 4),
                                          blurRadius: 2,
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 100,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFFB84C),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(30),
                                              topRight: Radius.circular(20),
                                              bottomLeft: Radius.circular(30),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 10),
                                          width: 200,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  "${eventsC.filterDataDate.length} Kegiatan",
                                                  style: GoogleFonts.poppins(
                                                      color: Color.fromARGB(
                                                          255, 0, 0, 0),
                                                      fontSize: 30,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Flexible(
                                                child: Text(
                                                  'Untuk lebih lanjut silahkan klik "Detail Kegiatan"',
                                                  style: GoogleFonts.poppins(
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0),
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Spacer(
                                          flex: 1,
                                        ),
                                        Container(
                                          width: 30,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFE0144C),
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(30),
                                              bottomRight: Radius.circular(30),
                                            ),
                                          ),
                                        )
                                      ],
                                    )),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 10, left: 20, right: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Berita Acara Himpunan"),
                                      DropdownButton(
                                        value: eventsC.selectedValue,
                                        hint: eventsC.selectedValue == null
                                            ? Text("Semua")
                                            : Text(eventsC.selectedValue!),
                                        items: [
                                          DropdownMenuItem(
                                            child: Text("Semua"),
                                            value: 'Semua',
                                          ),
                                          DropdownMenuItem(
                                            child: Text("Proker"),
                                            value: 'Proker',
                                          ),
                                          DropdownMenuItem(
                                            child: Text("Pekerjaan"),
                                            value: 'Pekerjaan',
                                          ),
                                        ],
                                        onChanged: (value) {
                                          eventsC.filterDataByType(value!);
                                          eventsC.selectedValue = value;
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: ListView.builder(
                                      itemBuilder: (context, index) {
                                        return Container(
                                          height: 80,
                                          width: Get.width,
                                          margin: EdgeInsets.only(bottom: 20),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    Color.fromARGB(40, 0, 0, 0),
                                                offset: Offset(0, 4),
                                                blurRadius: 2,
                                              ),
                                            ],
                                          ),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 100,
                                                alignment: Alignment.centerLeft,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFFFB84C),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(30),
                                                    topRight:
                                                        Radius.circular(20),
                                                    bottomLeft:
                                                        Radius.circular(30),
                                                  ),
                                                ),
                                                child: Container(
                                                  child: Image.network(
                                                      eventsC
                                                          .filterDataType[index]
                                                          .poster,
                                                      fit: BoxFit.fitHeight),
                                                ),
                                              ),
                                              Container(
                                                width: 200,
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Flexible(
                                                      child: Text(
                                                          eventsC
                                                              .filterDataType[
                                                                  index]
                                                              .name,
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                    ),
                                                    Flexible(
                                                      child: Text(
                                                        dateFormat(eventsC
                                                            .filterDataType[
                                                                index]
                                                            .date),
                                                        style:
                                                            GoogleFonts.poppins(
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0),
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Spacer(
                                                flex: 1,
                                              ),
                                              Container(
                                                width: 30,
                                                decoration: BoxDecoration(
                                                  color: randomColor(index),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(30),
                                                    bottomRight:
                                                        Radius.circular(30),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),

                                          //
                                        );
                                      },
                                      itemCount: eventsC.filterDataType.isEmpty
                                          ? eventsC.events.value.data.length
                                          : eventsC.filterDataType.length,
                                    ),
                                  ),
                                )
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

Color randomColor(int index) {
  List<Color> colors = [
    Color(0xFFEB455F),
    Color(0xFFA459D1),
    Color(0xFFF7A4A4)
  ];
  return colors[index % colors.length];
}

// Text Date Format Function
String dateFormat(DateTime date) {
  DateFormat dateFormat = DateFormat("dd MMMM yyyy");
  return dateFormat.format(date);
}
