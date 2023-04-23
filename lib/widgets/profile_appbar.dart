import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileAppbar extends StatelessWidget {
  ProfileAppbar();

  @override
  Widget build(BuildContext context) {
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
              overflow: TextOverflow.fade,
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
              overflow: TextOverflow.fade,
              maxLines: 1,
            ),
          ],
        ),
      )
    ]);
  }
}
// Widget ProfileAppbar() {
//   return 
// }
