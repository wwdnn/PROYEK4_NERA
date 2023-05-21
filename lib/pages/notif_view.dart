// ignore_for_file: invalid_use_of_protected_member

import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../controllers/notif_controller.dart';

class NotifView extends GetView {
  @override
  Widget build(BuildContext context) {
    final notifC = Get.find<NotifC>();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Color(0xFF345FB4),
        title: Text('Notifikasi'),
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: notifC.notif.value.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                notifC.removeNotif(index);
              },
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 20),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              child: Container(
                height: 100,
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 2,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        notifC.notif.value[index]['title'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        notifC.notif.value[index]['body'],
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                      indent: 20,
                      endIndent: 20,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
