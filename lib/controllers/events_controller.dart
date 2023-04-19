import 'package:get/get.dart';
import 'package:proyek4_nera/providers/events_provider.dart';

import '../models/events_model.dart';

class EventsController extends GetxController {
  Rx<EventsModel> events = EventsModel(status: '', data: []).obs;
  RxList<dynamic> filterData = [].obs;
  String? selectedValue;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  @override
  void onClose() {}

  Future<void> getData() async {
    await Future.delayed(Duration(seconds: 1));
    EventsProvider().getEvents().then((value) {
      events.value = value;
      // print(value.data[0].name);
    });
    update();
  }

  // Filter data berdasarkan value dari dropdown
  void filterDataByValue(String value) {
    if (value == 'Semua') {
      filterData.assignAll(events.value.data);
    } else {
      filterData.assignAll(
          events.value.data.where((element) => element.type == value).toList());
    }
    update();
  }
}
