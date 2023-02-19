import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/departemen_controller.dart';

class DepartemenView extends GetView<DepartemenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DepartemenView'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DepartemenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
