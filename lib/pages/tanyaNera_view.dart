import 'package:get/get.dart';
import 'package:flutter/material.dart';

class TanyaNeraView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tanya Nera'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TanyaNeraView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}