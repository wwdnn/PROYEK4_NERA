import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyek4_nera/routes/app_routes.dart';

import '../controllers/home_controller.dart';

import '../controllers/notif_controller.dart';
import '../controllers/profile_controller.dart';
import '../widgets/badge_notif.dart';
import '../widgets/pengurus.dart';
import '../widgets/drawclip.dart';
import '../widgets/kabinet.dart';
import '../widgets/profile_appbar.dart';

class HomeV extends GetView<HomeC> {
  @override
  Widget build(BuildContext context) {
    final homeC = Get.put(HomeC());
    final profileC = Get.find<ProfileController>();
    final notifC = Get.find<NotifC>();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF345FB4),
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          elevation: 2,
          title: ProfileAppbar(
            user: profileC.auth.value.user,
          ),
          actions: [
            Obx(() {
              return Container(
                alignment: Alignment.center,
                child: BadgeIconButton(
                  icon: Icon(Icons.notifications),
                  badgeCount: notifC.notif.value.length,
                  onPressed: () {
                    Get.toNamed(RouteName.notif);
                  },
                ),
              );
            })
          ],
        ),
        body: Obx(() {
          return RefreshIndicator(
            onRefresh: homeC.getKepengurusan,
            child: homeC.kabinet.value.data.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView(children: [
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
                              enableInfiniteScroll: false,
                            ),
                            items: homeC.kepengurusan.value.data.map((item) {
                              final index =
                                  homeC.kepengurusan.value.data.indexOf(item);
                              return Pengurus(
                                avatar:
                                    homeC.kepengurusan.value.data[index].avatar,
                                name: homeC.kepengurusan.value.data[index].name,
                                role: homeC.kepengurusan.value.data[index].role,
                              );
                            }).toList(),
                          )),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            alignment: Alignment.topLeft,
                            child: Text("Kabinet",
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: Kabinet(
                              pathLogo: homeC.kabinet.value.data[0].logo,
                              name: homeC.kabinet.value.data[0].name,
                              description:
                                  homeC.kabinet.value.data[0].description,
                              context: context,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
          );
        }));
  }
}
