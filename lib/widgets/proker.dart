import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget Proker(ScrollController controller) {
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
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ],
          ),
        ),
        ListView.builder(
          controller: controller,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.centerLeft,
              padding:
                  EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      '2',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 5),
                    child: Text(
                      '2',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    ),
  );
}
