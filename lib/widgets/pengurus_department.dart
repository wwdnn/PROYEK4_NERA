import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PengurusDepartment extends StatelessWidget {
  final String avatar;
  final String name;
  final String role;

  PengurusDepartment({
    required this.avatar,
    required this.name,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: Container(
              width: 250,
              child: Image.network(avatar, fit: BoxFit.cover),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 50,
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
                    overflow: TextOverflow.fade,
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
                    overflow: TextOverflow.fade,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// Widget PengurusDepartment(String avatar, String name, String role) {
//   return 
// }
