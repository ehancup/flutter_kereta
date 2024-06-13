import 'package:get/get.dart';

import '../controllers/add_diskon_controller.dart';

class AddDiskonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddDiskonController>(
      () => AddDiskonController(),
    );
  }
}
