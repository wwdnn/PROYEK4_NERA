import 'package:get/get.dart';
import 'package:flutter/services.dart';

import '../models/events_model.dart';

class EventsProvider extends GetConnect {
  Future<dynamic> getEvents() async {
    final response = await rootBundle.loadString('assets/sample_events.json');
    final eventsModel = eventsModelFromJson(response);

    return eventsModel;
  }
}
