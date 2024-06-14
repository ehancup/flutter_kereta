import 'package:get/get.dart';

import '../controllers/scanqr_controller.dart';

class ScanqrBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScanqrController>(
      () => ScanqrController(),
    );
  }
}
