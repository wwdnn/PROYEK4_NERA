import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CarouselKepengurusan extends StatefulWidget {
  RxMap<dynamic, dynamic> kepengurusanData;

  CarouselKepengurusan({
    required this.kepengurusanData,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CarouselKepengurusanState createState() => _CarouselKepengurusanState();
}

class _CarouselKepengurusanState extends State<CarouselKepengurusan> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 300.0,
        enlargeCenterPage: true,
        viewportFraction: 0.5,
        enableInfiniteScroll: false,
      ),
      items: widget.kepengurusanData.entries.map((entry) {
        Map<String, dynamic> data = entry.value;
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 200,
              child: Image.network(data['avatar']),
            ),
            Container(
              padding: EdgeInsets.only(top: 150),
              child: Container(
                width: 160,
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
                      data['name'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      data['role'],
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
