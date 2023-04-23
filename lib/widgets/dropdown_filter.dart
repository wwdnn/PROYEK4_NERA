import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropdownFilter extends StatefulWidget {
  final String? selectedValue;
  final Function(String) onSelected;

  DropdownFilter(this.selectedValue, this.onSelected);

  @override
  _DropdownFilterState createState() => _DropdownFilterState();
}

class _DropdownFilterState extends State<DropdownFilter> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Berita Acara Himpunan",
              style: GoogleFonts.poppins(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              )),
          DropdownButton(
            value: _selectedValue,
            hint: _selectedValue == null
                ? Text(
                    "Semua",
                    style: GoogleFonts.poppins(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : Text(
                    _selectedValue!,
                    style: GoogleFonts.poppins(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            items: [
              DropdownMenuItem(
                child: Text(
                  "Semua",
                  style: GoogleFonts.poppins(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                value: 'Semua',
              ),
              DropdownMenuItem(
                child: Text(
                  "Proker",
                  style: GoogleFonts.poppins(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                value: 'proker',
              ),
              DropdownMenuItem(
                child: Text(
                  "Pekerjaan",
                  style: GoogleFonts.poppins(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                value: 'pekerjaan',
              ),
              DropdownMenuItem(
                child: Text(
                  "Lomba",
                  style: GoogleFonts.poppins(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                value: 'lomba',
              ),
            ],
            onChanged: (value) {
              widget.onSelected(value!);
              setState(() {
                _selectedValue = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
