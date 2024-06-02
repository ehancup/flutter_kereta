import 'package:get/get.dart';

import '../controllers/add_kereta_controller.dart';

class AddKeretaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddKeretaController>(
      () => AddKeretaController(),
    );
  }
}
