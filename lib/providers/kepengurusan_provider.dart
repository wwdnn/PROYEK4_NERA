import 'package:get/get.dart';
import 'package:proyek4_nera/models/kepengurusan_model.dart';

import '../utils/base_url.dart';

class KepengurusanP extends GetConnect {
  Future<dynamic> getKepengurusan() async {
    final response = await get('$BaseUrl/users');
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  Future<dynamic> getKabinet() async {
    final response = await get('$BaseUrl/cabinets');
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }
}
