import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pas_xi_kereta/app/modules/kereta/model/model.dart';

class KeretaController extends GetxController {
  FirebaseFirestore fs = FirebaseFirestore.instance;
  RxBool status = false.obs;
  List<Kereta> data = [];

  getDataKereta() async {
    final kereta = await fs.collection("kereta").get();
    if (kereta.docs.isNotEmpty) {
      print(kereta.docs);
      kereta.docs.map((e) {
        print(e.data());
        print(e.id);
        Kereta kereta = Kereta.fromJson(Map.from(e.data()), e.id);
        data.add(kereta);
      });
      status.value = true;
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
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
