import 'package:get/get.dart';

import '../utils/base_url.dart';

class KepengurusanP extends GetConnect {
  Future<dynamic> getKepengurusan() async {
    final response = await get('$BaseUrl/users');
    if (response.statusCode == 200) {
      return response;
    }
    return null;
}
}
