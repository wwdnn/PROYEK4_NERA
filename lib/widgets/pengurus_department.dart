import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget PengurusDepartment(String avatar, String name, String role) {
  return Stack(
    children: [
      Container(
        height: 210,
        child: Image.network(avatar, fit: BoxFit.cover),
      ),
      Container(
        padding: EdgeInsets.only(top: 150),
        child: Container(
          width: 170,
          height: 65,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Color.fromARGB(255, 52, 95, 180).withOpacity(0.85),
                Color.fromARGB(255, 9, 130, 207).withOpacity(0.81),
              ],
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
              Text(
                role,
                style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
