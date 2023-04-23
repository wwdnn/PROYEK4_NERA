import 'dart:convert';

import 'package:get/get.dart';

import '../models/auth_model.dart';
import '../utils/access_token.dart';
import '../utils/base_url.dart';

class ProfileProvider extends GetConnect {
  Future<dynamic> login(String email, String password) async {
    final response = await post('$BaseUrl/loginApi', {
      'email': email,
      'password': password,
    });
    if (response.statusCode == 200) {
      final responseString = json.encode(response.body);
      final authModel = authModelFromJson(responseString);
      return authModel;
    }
    return null;
  }

  Future<dynamic> logout() async {
    final response = await post('$BaseUrl/logoutApi', null, headers: {
      'Authorization': accessToken,
    });
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }
}
