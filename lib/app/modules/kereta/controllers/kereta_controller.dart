import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pas_xi_kereta/app/modules/kereta/model/model.dart';
import 'package:pas_xi_kereta/app/routes/app_pages.dart';

class KeretaController extends GetxController {
  FirebaseFirestore fs = FirebaseFirestore.instance;
  RxBool status = false.obs;
  List<Kereta> data = [];

  getDataKereta() async {
    final kereta = await fs.collection("kereta").get();
    print(fs);
    print(kereta);
    if (kereta.docs.isNotEmpty) {
      print(kereta.docs);
      kereta.docs.forEach((e) {
        print(e.data());
        print(e.id);
        Kereta kereta = Kereta.fromJson(Map.from(e.data()), e.id);
        data.add(kereta);
      });
      status.value = true;
    }
  }

  deleteKereta(String id) async {
    try {
      await fs.collection("kereta").doc(id).delete();
      Get.defaultDialog(middleText: 'Berhasil Menghapus Data Kereta');
      Get.offAllNamed(Routes.KERETA);
    } catch (e) {
      Get.defaultDialog(middleText: 'Gagal Menghapus Data Kereta');
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    getDataKereta();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
