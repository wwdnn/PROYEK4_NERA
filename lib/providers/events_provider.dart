import 'dart:convert';
import 'package:get/get.dart';

import '../models/events_model.dart';
import '../utils/access_token.dart';
import '../utils/base_url.dart';

class EventsProvider extends GetConnect {
  Future<dynamic> getEvents() async {
    final response = await get('$BaseUrl/events', headers: {
      'Authorization': 'Bearer $accessToken',
    });
    if (response.statusCode == 200) {
      final responseString = json.encode(response.body);
      final eventsModel = eventsModelFromJson(responseString);
      return eventsModel;
    }
    return null;
  }
}
