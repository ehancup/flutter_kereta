// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pas_xi_kereta/app/modules/payment_method/model/model.dart';
import 'package:pas_xi_kereta/app/routes/app_pages.dart';

class PaymentMethodController extends GetxController {
  FirebaseFirestore fs = FirebaseFirestore.instance;
  RxBool status = false.obs;
  List<MetodePembayaran> data = [];

  getDataPaymentMethod() async {
    final metode_pembayaran = await fs.collection("metode_pembayaran").get();
    print(fs);
    print(metode_pembayaran);
    if (metode_pembayaran.docs.isNotEmpty) {
      print(metode_pembayaran.docs);
      metode_pembayaran.docs.forEach((e) {
        print(e.data());
        print(e.id);
        MetodePembayaran metode_pembayaran =
            MetodePembayaran.fromJson(Map.from(e.data()), e.id);
        data.add(metode_pembayaran);
      });
      status.value = true;
    }
  }

  deletePayment(String id) async {
    try {
      await fs.collection("metode_pembayaran").doc(id).delete();
      Get.defaultDialog(middleText: 'Berhasil Menghapus Data ');
      Get.offAllNamed(Routes.PAYMENT_METHOD);
    } catch (e) {
      Get.defaultDialog(middleText: 'Gagal Menghapus Data ');
    }
  }
  //TODO: Implement PaymentMethodController

  final count = 0.obs;
  @override
  void onInit() {
    getDataPaymentMethod();
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
