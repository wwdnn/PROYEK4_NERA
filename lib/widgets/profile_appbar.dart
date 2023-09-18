import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyek4_nera/models/auth_model.dart';

class ProfileAppbar extends StatelessWidget {
  final User user;

  ProfileAppbar({required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      // logo
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: ClipOval(
          child: Container(
            width: 40,
            height: 40,
            child: user.avatar == ''
                ? Image.asset('assets/logo/Logo_HIMAKOM.png')
                : Image.network(
              user.avatar,
              fit: BoxFit.cover,
            ),
          ),
        ),
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
              user.name,
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
              user.role,
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
