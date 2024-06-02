import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_xi_kereta/app/modules/kereta/model/model.dart';
import 'package:pas_xi_kereta/app/routes/app_pages.dart';

class EditKeretaController extends GetxController {
  //TODO: Implement EditKeretaController

  TextEditingController nama_kereta = TextEditingController();
  TextEditingController type = TextEditingController();
  TextEditingController jumlah_Kursi = TextEditingController();
  FirebaseFirestore fs = FirebaseFirestore.instance;

  updateVariable(Kereta data) {
    nama_kereta.text = data.namaKereta;
    type.text = data.type;
    jumlah_Kursi.text = data.jumlahKursi.toString();
  }

  updateDataKereta(String id) async {
    CollectionReference kereta = fs.collection("kereta");

    final keretaData = {
      "nama_kereta": nama_kereta.text,
      "type": type.text,
      "jumlah_kursi": int.parse(jumlah_Kursi.text)
    };
    try {
      await kereta.doc(id).update(keretaData);
      Get.defaultDialog(middleText: 'Berhasil');
      Get.offAllNamed(Routes.KERETA);
    } catch (e) {
      Get.defaultDialog(middleText: 'Gagal Mengupdate Data Kereta');
    }
  }

  // final count = 0.obs;
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  // void increment() => count.value++;
}
