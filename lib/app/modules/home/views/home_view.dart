import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeView extends GetView<HomeController> {
  final List<Widget> kepengurusan = [
    Stack(
      alignment: Alignment.center,
      children: [
        // gambar
        Container(
          height: 200,
          child: Image.asset('assets/logo/pp_1.png'),
        ),
        // nama
        Container(
          padding: EdgeInsets.only(top: 150),
          child: Container(
            width: 160,
            height: 65,
            decoration: BoxDecoration(
              // linear color
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
                  'Achmadya Ridwan Ilyawan',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Ketua Himpunan',
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
    ),
    Stack(
      alignment: Alignment.center,
      children: [
        // gambar
        Container(
          height: 200,
          child: Image.asset('assets/logo/pp_2.png'),
        ),

        // nama
        Container(
          padding: EdgeInsets.only(top: 150),
          child: Container(
            width: 160,
            height: 65,
            decoration: BoxDecoration(
              // linear color
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
                  'Arief Rahmad Husein',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Wakil Ketua Himpunan',
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
    ),
    Stack(
      alignment: Alignment.center,
      children: [
        // gambar
        Container(
          height: 200,
          child: Image.asset('assets/logo/pp_3.png'),
        ),

        // nama
        Container(
          padding: EdgeInsets.only(top: 150),
          child: Container(
            width: 160,
            height: 65,
            decoration: BoxDecoration(
              // linear color
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
                  'Fahmi Ahmad Fadillah',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Bendahara Umum',
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
    ),
  ];

  final List<Widget> beritaAcara = [
    Container(
      height: 200,
      child: Image.asset('assets/logo/ba_1.png'),
    ),
    Container(
      height: 200,
      child: Image.asset('assets/logo/ba_2.png'),
    ),
    Container(
      height: 200,
      child: Image.asset('assets/logo/ba_3.png'),
    ),
    Container(
      height: 200,
      child: Image.asset('assets/logo/ba_4.png'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF345FB4),
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        elevation: 2,
        // row content
        title: Row(children: [
          // logo
          Container(
            height: 50,
            width: 50,
            child: Image.asset('assets/logo/dp.png'),
          ),

          // nama user
          Container(
            padding: EdgeInsets.only(left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // column content
              children: [
                // nama user
                Text(
                  'WILDAN',
                  style: TextStyle(fontSize: 23),
                ),

                // status user
                Text(
                  'Anggota',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          )
        ]),

        // icon
        actions: [
          // icon
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          ClipPath(
            clipper: DrawClip(),
            child: Container(
              height: 280,
              color: Color(0xFF345FB4),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 300.0,
                  enlargeCenterPage: true,
                  viewportFraction: 0.5,
                ),
                items: kepengurusan,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  alignment: Alignment.topLeft,
                  child: Text("Kabinet",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Container(
                            height: 140,
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
                            child: Image.asset('assets/logo/kabinet_1.png'),
                          )),
                      Expanded(
                        flex: 7,
                        child: Container(
                          height: 140,
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
                                  'Inovasi',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  'Mengarahkan himpunan dengan menciptakan & menumbuhkan inovasi di dalam diri anggota',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
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
                                                        BorderRadius.circular(
                                                            20)),
                                                elevation: 16,
                                                child: Container(height: 300));
                                          })
                                    },
                                    child: Text("Detail Kabinet",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Color.fromARGB(
                                                255, 219, 43, 43))),
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
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(bottom: 10),
                    alignment: Alignment.topLeft,
                    child: Text("Berita Acara",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold))),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 200.0,
                      viewportFraction: 0.4,
                      autoPlay: true,
                      // duration
                      autoPlayInterval: Duration(seconds: 2),
                    ),
                    items: beritaAcara,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrawClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    var firstControlPoint = Offset(size.width / 10, size.height);
    var firstEndPoint = Offset(size.width / 2.5, size.height - 40.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx + 80, firstEndPoint.dy);
    var secondControlPoint =
        Offset(size.width - (size.width / 3.5), size.height - 65);
    var secondEndPoint = Offset(size.width, size.height);
    path.quadraticBezierTo(secondControlPoint.dx + 50, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
