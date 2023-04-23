import 'dart:convert';

import 'package:get/get.dart';
import 'package:proyek4_nera/models/kabinet_model.dart';
import 'package:proyek4_nera/models/kepengurusan_model.dart';

import '../utils/access_token.dart';
import '../utils/base_url.dart';

class KepengurusanP extends GetConnect {
  Future<dynamic> getKepengurusan() async {
    final response = await get('$BaseUrl/users', headers: {
      'Authorization': 'Bearer $accessToken',
    });
    if (response.statusCode == 200) {
      final responseString = json.encode(response.body);
      final kepengurusanModel = kepengurusanModelFromJson(responseString);
      return kepengurusanModel;
    }
    return null;
  }

  Future<dynamic> getKabinet() async {
    final response = await get('$BaseUrl/cabinets', headers: {
      'Authorization': 'Bearer $accessToken',
    });
    if (response.statusCode == 200) {
      final responseString = json.encode(response.body);
      final kabinetModel = kabinetModelFromJson(responseString);
      return kabinetModel;
    }
    return null;
  }
}
