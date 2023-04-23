import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Kabinet extends StatelessWidget {
  final String pathLogo;
  final String name;
  final String description;
  final BuildContext context;

  Kabinet({
    required this.pathLogo,
    required this.name,
    required this.description,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  // shadow
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 7,
                      offset: Offset(0, 5),
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Image.network(pathLogo),
              )),
          Expanded(
            flex: 7,
            child: Container(
              margin: EdgeInsets.only(left: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                // shadow
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 7,
                    offset: Offset(0, 5),
                  ),
                ],
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Text(
                      name,
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      description,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w400,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => {
                          showDialog(
                              context: context,
                              builder: (context) {
                                // card
                                return Dialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    elevation: 16,
                                    child: Container(height: 300));
                              })
                        },
                        child: Text(
                          "Detail kabinet",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Color.fromARGB(255, 219, 43, 43),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color.fromARGB(255, 219, 43, 43),
                        size: 16,
                      )
                    ],
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
