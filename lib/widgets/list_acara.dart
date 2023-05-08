import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyek4_nera/widgets/random_color.dart';

import 'date_format.dart';

class ListAcara extends StatelessWidget {
  final List<dynamic> listAcara;

  ListAcara({required this.listAcara});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            height: 120,
            margin: EdgeInsets.only(bottom: 20, left: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
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
                  alignment: Alignment.centerLeft,
                  width: 100,
                  child: Container(
                    child: Image.network(listAcara[index].poster,
                        fit: BoxFit.fitHeight),
                  ),
                ),
                Container(
                  width: 200,
                  margin: EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(listAcara[index].name,
                            style: GoogleFonts.poppins(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1),
                      ),
                      Flexible(
                        child: Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Row(
                            children: [
                              Icon(
                                Icons.calendar_month_rounded,
                                color: Color.fromARGB(255, 94, 94, 94),
                                size: 15,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                child: Text(
                                  dateFormat(listAcara[index].date),
                                  style: GoogleFonts.poppins(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
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
                  width: 20,
                  decoration: BoxDecoration(
                    color: colorByDayLeft(dayLeftInt(listAcara[index].date)),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                )
              ],
            ),

            //
          );
        },
        itemCount: listAcara.length,
      ),
    );
  }
}
