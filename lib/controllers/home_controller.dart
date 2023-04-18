import 'package:get/get.dart';

// import '../models/kepengurusan_model.dart';
import '../providers/kepengurusan_provider.dart';

class HomeC extends GetxController {
  RxList<dynamic> kepengurusanData = [].obs;
  RxList<dynamic> kabinetData = [].obs;

  @override
  void onInit() {
    getKepengurusan();
    super.onInit();
  }

  @override
  void onClose() {}

  Future<void> getKepengurusan() async {
    kepengurusanData.clear();
    await Future.delayed(Duration(seconds: 1));
    KepengurusanP().getKepengurusan().then((value) {
      kepengurusanData.assignAll(value['data']);
    });
    KepengurusanP().getKabinet().then((value) {
      kabinetData.assignAll(value['data']);
    });
    update();
  }
}
