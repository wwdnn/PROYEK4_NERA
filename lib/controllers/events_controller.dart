import 'package:get/get.dart';
import 'package:proyek4_nera/providers/events_provider.dart';

import '../models/events_model.dart';

class EventsController extends GetxController {
  Rx<EventsModel> events = EventsModel(status: '', data: []).obs;
  RxList<dynamic> filterDataType = [].obs;
  RxList<dynamic> filterDataDate = [].obs;
  RxBool isLoading = true.obs;
  String? selectedValue;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  @override
  void onClose() {}

  Future<void> getData() async {
    events.value = EventsModel(status: '', data: []);
    await Future.delayed(Duration(seconds: 1));
    EventsProvider().getEvents().then((value) {
      events.value = value;
      isLoading.value = false;
      filterDataByDate(DateTime.now());
      filterDataByType('Semua');
    });
    update();
  }

  // Filter data berdasarkan value dari dropdown
  void filterDataByType(String value) {
    if (value == 'Semua') {
      filterDataType.assignAll(events.value.data);
    } else {
      filterDataType.assignAll(
          events.value.data.where((element) => element.type == value).toList());
    }
    update();
  }

  // Filter data berdasarkan value dari datepicker
  void filterDataByDate(DateTime value) {
    // parse date to string
    String date = value.toString().substring(0, 10);
    filterDataDate.assignAll(events.value.data
        .where((element) =>
            element.date.toString().substring(0, 10) == date &&
            element.type != 'pekerjaan')
        .toList());
    update();
  }
}
