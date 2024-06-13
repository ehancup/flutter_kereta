import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_xi_kereta/app/routes/app_pages.dart';

class AddJadwalController extends GetxController {
  FirebaseFirestore fs = FirebaseFirestore.instance;

  DateTime berangkat = DateTime.now();
  DateTime tiba = DateTime.now();
  TextEditingController tujuan = TextEditingController();
  TextEditingController harga = TextEditingController();
  RxString kereta = ''.obs;

  saveJadwal() async {
    DocumentReference keretaRef = fs.collection("kereta").doc(kereta.value);
    CollectionReference jadwal = fs.collection("jadwal");

    final jadwalData = {
      "berangkat": berangkat.toString().split(' ')[0],
      "tiba": tiba.toString().split(' ')[0],
      "harga": int.parse(harga.text),
      "kereta": keretaRef,
      "tujuan": tujuan.text
    };

    if (kereta.value != '') {
      try {
        await jadwal.add(jadwalData).then((value) {
          Get.showSnackbar(GetSnackBar(
            title: 'Success',
            message: 'add jadwal success',
            duration: Duration(seconds: 3),
          ));
        });
        Get.offAllNamed(Routes.JADWAL);
      } catch (e) {
        Get.showSnackbar(GetSnackBar(
          title: 'error',
          message: 'error - $e',
          duration: Duration(seconds: 3),
        ));

        Get.offAllNamed(Routes.JADWAL);
      }
    } else {
      Get.showSnackbar(GetSnackBar(
          title: 'something gone',
          message: 'please select kereta',
          duration: Duration(seconds: 3),
        ));
    }
  }

  setBerangkat(DateTime? date) {
    if (date != null) {
      berangkat = date;
      print(date);
    }
    update();
  }

  setTiba(DateTime? date) {
    if (date != null) tiba = date;
    update();
  }

  setKereta(String p) {
    kereta.value = p;
  }

  void onInit() {
    // TODO: implement onInit

    // berangkat =
    //     DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
    //         .obs;
    // tiba =
    //     DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
    //         .obs;
    super.onInit();
  }
}
