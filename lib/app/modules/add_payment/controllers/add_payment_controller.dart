// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_xi_kereta/app/routes/app_pages.dart';

class AddPaymentController extends GetxController {
  TextEditingController nama = TextEditingController();
  FirebaseFirestore fs = FirebaseFirestore.instance;
  RxString url = ''.obs;

  saveData() async {
    CollectionReference metode_pembayaran = fs.collection("metode_pembayaran");
    final metodeData = {
      "nama": nama.text,
    };
    try {
      await metode_pembayaran.add(metodeData).then((value) {
        print(metodeData);
        Get.defaultDialog(
          middleText: "Berhasil menambahkan Data",
          onConfirm: () {
            Get.offAllNamed(Routes.PAYMENT_METHOD);
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
