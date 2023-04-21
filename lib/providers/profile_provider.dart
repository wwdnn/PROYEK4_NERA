import 'package:get/get.dart';

class ProfileProvider extends GetConnect {
  Future<dynamic> login(String email, String password) async {
    final response = await post('https://reqres.in/api/login', {
      'email': email,
      'password': password,
    });
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }
}
