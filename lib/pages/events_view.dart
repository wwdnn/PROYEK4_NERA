import "package:flutter/material.dart";
import "package:get/get.dart";
import 'package:date_picker_timeline/date_picker_timeline.dart';
import "package:google_fonts/google_fonts.dart";
import "package:intl/intl.dart";

class EventsView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => Future.delayed(Duration(seconds: 1)),
        child: Container(
          decoration: BoxDecoration(color: Color(0xFF345FB4)),
          child: Column(
            children: [
              SafeArea(
                  child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(DateFormat.yMMMMd().format(DateTime.now()),
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
                                      color: Color.fromARGB(255, 0, 0, 0),
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
                      },
                    ),
                  ),
                ],
              )),
              Expanded(
                child: Container(
                    margin: EdgeInsets.only(top: 10),
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
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Kegiatan Himpunan"),
                              DropdownButton(
                                hint: Text("Pilih Kegiatan"),
                                items: [
                                  DropdownMenuItem(
                                    child: Text("Kegiatan 1"),
                                    value: 1,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Kegiatan 2"),
                                    value: 2,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Kegiatan 3"),
                                    value: 3,
                                  ),
                                ],
                                onChanged: (value) {
                                  print(value);
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
                                    margin: EdgeInsets.only(bottom: 20),
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
                                    child: Center(
                                        child: Text("Kegiatan ke $index")));
                              },
                              itemCount: 10,
                            ),
                          ),
                        )
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
