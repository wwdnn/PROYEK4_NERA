import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyek4_nera/widgets/date_format.dart';
import 'package:proyek4_nera/widgets/random_color.dart';

class InfoKegiatanHimpunan extends StatelessWidget {
  final int jumlahKegiatan;
  final List<dynamic> listKegiatan;

  InfoKegiatanHimpunan({
    required this.jumlahKegiatan,
    required this.listKegiatan,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 130,
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
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 20),
                padding: EdgeInsets.only(top: 10, right: 20),
                child: listKegiatan.isEmpty
                    ? Text(
                        "Tidak ada kegiatan . . .",
                        style: GoogleFonts.poppins(
                          color: Color.fromARGB(255, 94, 94, 94),
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      )
                    : Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.calendar_month_rounded,
                                      color: Color.fromARGB(255, 94, 94, 94),
                                      size: 15,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text(
                                        dateFormat(listKegiatan[0].date),
                                        style: GoogleFonts.poppins(
                                          color:
                                              Color.fromARGB(255, 94, 94, 94),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      width: 10,
                                      height: 10,
                                      decoration: BoxDecoration(
                                        color: colorByDayLeft(
                                            dayLeftInt(listKegiatan[0].date)),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    // text berapa hari lagi acara
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text(
                                        dayLeft(listKegiatan[0].date),
                                        style: GoogleFonts.poppins(
                                          color:
                                              Color.fromARGB(255, 94, 94, 94),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          for (int i = 0; i < jumlahKegiatan; i++)
                            if (i < 2)
                              Column(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.only(top: 10),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.circle,
                                          size: 12,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 10),
                                          child: Text(
                                            listKegiatan[i].name,
                                            style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.left,
                                            overflow: TextOverflow.fade,
                                            maxLines: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 1,
                                    margin: EdgeInsets.only(top: 2),
                                    color: Color.fromARGB(255, 94, 94, 94),
                                  )
                                ],
                              ),
                          if (jumlahKegiatan >= 3)
                            Container(
                              alignment: Alignment.centerRight,
                              height: 30,
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Lihat Semua . . .",
                                  style: GoogleFonts.poppins(
                                    color: Color(0xFF2192FF),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            )
                        ],
                      ),
              ),
            ),
            Container(
              width: 20,
              decoration: listKegiatan.isEmpty
                  ? BoxDecoration(
                      color: Color.fromARGB(255, 94, 94, 94),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    )
                  : BoxDecoration(
                      color: colorByDayLeft(dayLeftInt(listKegiatan[0].date)),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
            )
          ],
        ));
  }
}
