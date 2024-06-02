import 'package:get/get.dart';

import '../controllers/edit_kereta_controller.dart';

class EditKeretaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditKeretaController>(
      () => EditKeretaController(),
    );
  }
}
