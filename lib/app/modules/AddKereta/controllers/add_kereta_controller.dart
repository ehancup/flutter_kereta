import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_xi_kereta/app/routes/app_pages.dart';

class AddKeretaController extends GetxController {
  // //TODO: Implement AddKeretaController

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

  TextEditingController nama_kereta = TextEditingController();
  TextEditingController type = TextEditingController();
  TextEditingController jumlah_Kursi = TextEditingController();
  FirebaseFirestore fs = FirebaseFirestore.instance;
  RxString url = ''.obs;

  saveKereta() async {
    CollectionReference kereta = fs.collection("kereta");
    final keretaData = {
      "nama_kereta": nama_kereta.text,
      "type": type.text,
      "jumlah_kursi": int.parse(jumlah_Kursi.text)
    };
    try {
      await kereta.add(keretaData).then((value) {
        print(keretaData);
        Get.defaultDialog(
          middleText: "Berhasil menambahkan Data Kereta",
          onConfirm: () {
            Get.offAllNamed(Routes.KERETA);
          },
          textConfirm: "OK",
        );
      });
    } catch (e) {
      Get.defaultDialog(
        middleText: "Gagal menambahkan Data Kereta",
        onConfirm: () {
          Get.back();
        },
        textConfirm: "OK",
      );
    }
  }
}
