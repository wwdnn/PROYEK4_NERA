import 'package:get/get.dart';
import 'package:proyek4_nera/models/kepengurusan_model.dart';
import '../models/kabinet_model.dart';
import '../providers/kepengurusan_provider.dart';

class HomeC extends GetxController {
  Rx<KepengurusanModel> kepengurusan = KepengurusanModel(
    status: '',
    data: [],
  ).obs;
  Rx<KabinetModel> kabinet = KabinetModel(
    status: '',
    data: [],
  ).obs;

  @override
  void onInit() {
    getKepengurusan();
    super.onInit();
  }

  @override
  void onClose() {}

  Future<void> getKepengurusan() async {
    // clear data
    kepengurusan.value = KepengurusanModel(
      status: '',
      data: [],
    );
    kabinet.value = KabinetModel(
      status: '',
      data: [],
    );
    await Future.delayed(Duration(seconds: 1));
    KepengurusanP().getKepengurusan().then((value) {
      kepengurusan.value = value;
    });
    KepengurusanP().getKabinet().then((value) {
      kabinet.value = value;
    });
    update();
  }
}
