import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pas_xi_kereta/app/modules/diskon/model/model.dart';
import 'package:pas_xi_kereta/app/routes/app_pages.dart';

class DiskonController extends GetxController {
  //TODO: Implement DiskonController
  FirebaseFirestore fs = FirebaseFirestore.instance;
  RxBool status = false.obs;
  List<Diskon> data = [];

  getDiskonData() async {
    final diskon = await fs.collection('diskon').get();
    if (diskon.docs.isNotEmpty) {
      diskon.docs.forEach((element) {
        Diskon disc = Diskon.fromJson(Map.from(element.data()), element.id);
        data.add(disc);
      });

      status.value = true;
    }
  }

  deleteDiskon(String id) async {
    try {
      await fs.collection('diskon').doc(id).delete();
      Get.showSnackbar(GetSnackBar(
        title: 'Success',
        message: 'success add diskon',
        duration: Duration(seconds: 3),
      ));
      Get.offAllNamed(Routes.DISKON);
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        title: 'Error',
        message: 'err - $e',
        duration: Duration(seconds: 3),
      ));
    }
  }

  @override
  void onInit() {
    getDiskonData();
    super.onInit();
  }
}
