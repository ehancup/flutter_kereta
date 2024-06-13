import 'package:get/get.dart';

import '../controllers/detail_booking_controller.dart';

class DetailBookingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailBookingController>(
      () => DetailBookingController(),
    );
  }
}
