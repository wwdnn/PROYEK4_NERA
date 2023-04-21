import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget ProfileAppbar() {
  return Row(children: [
    // logo
    Container(
      height: 50,
      width: 50,
      child: Image.asset('assets/logo/dp.png'),
    ),

    // nama user
    Container(
      width: 200,
      padding: EdgeInsets.only(left: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // column content
        children: [
          // nama user
          Text(
            'Wildan Setya Nugraha',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),

          // status user
          Text(
            'Anggota',
            style: GoogleFonts.poppins(
              color: Colors.grey,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    )
  ]);
}
