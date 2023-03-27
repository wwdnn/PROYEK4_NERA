import 'package:get/get.dart';

// import '../models/kepengurusan_model.dart';
import '../providers/kepengurusan_provider.dart';

class HomeC extends GetxController {
  RxMap<dynamic, dynamic> kepengurusanData = {}.obs;

  @override
  void onInit() {
    getKepengurusan();
    super.onInit();
  }

  @override
  void onClose() {
    
  }

  Future<void> getKepengurusan() async {
    kepengurusanData.clear();
    await Future.delayed(Duration(seconds: 1));
    KepengurusanP().getKepengurusan().then((value) {
      kepengurusanData.assignAll(value.body['users']);
    });
    update();
  }
}
