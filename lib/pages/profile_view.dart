import "package:get/get.dart";
import 'package:flutter/material.dart';
import 'package:proyek4_nera/routes/app_routes.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    final profileC = Get.put(ProfileController());
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: Get.height * 0.35,
                  width: Get.width,
                  margin: EdgeInsets.only(bottom: 120),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50),
                    ),
                    color: Color(0xFF345FB4),
                  ),
                ),
                Positioned(
                  top: Get.height * 0.15,
                  child: Container(
                    width: 280,
                    height: 230,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(30),
                      ),
                      color: Color.fromARGB(255, 150, 177, 229),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Image.asset(
                            'assets/logo/pp_3.png',
                            width: 115,
                            height: 140,
                          ),
                        ),
                        Container(
                          width: 280,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(30),
                            ),
                            color: Color(0xFF345FB4),
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Text(
                                  'FAHMI AHMAD FADILLAH',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text(
                                  'NIM',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  height: 60,
                  margin:
                      EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    // shadow
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
                        spreadRadius: 0,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: ListTile(
                      leading: Image.asset(
                          'assets/logo/menuProfile${index + 1}.png'),
                      title: Text(
                        // ignore: unnecessary_string_interpolations
                        '${profileC.menuProfile[index]}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios,
                          size: 15, color: Colors.black),
                      // tap to navigate
                      onTap: () {
                        // switch case
                        switch (index) {
                          case 0:
                            Get.toNamed(RouteName.changePassword);
                            break;
                          case 1:
                            Get.toNamed(RouteName.tanyaNera);
                            break;
                          case 2:
                            print('tap menu 3');
                            break;
                          default:
                            break;
                        }
                      }),
                );
              },
              childCount: profileC.menuProfile.length,
            ),
          ),
        ],
      ),
    );
  }
}
