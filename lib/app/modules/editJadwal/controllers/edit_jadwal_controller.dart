import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_xi_kereta/app/modules/jadwal/model/model.dart';
import 'package:pas_xi_kereta/app/routes/app_pages.dart';

class EditJadwalController extends GetxController {
  //TODO: Implement EditJadwalController

  FirebaseFirestore fs = FirebaseFirestore.instance;

  DateTime berangkat = DateTime.now();
  DateTime tiba = DateTime.now();
  TextEditingController tujuan = TextEditingController();
  TextEditingController harga = TextEditingController();
  RxString kereta = ''.obs;

  updateVariable(Jadwal jadwal) {
    berangkat = jadwal.jadwal.berangkat;
    tiba = jadwal.jadwal.tiba;
    tujuan.text = jadwal.jadwal.tujuan;
    harga.text = jadwal.jadwal.harga.toString();
    kereta.value = jadwal.kereta_id;
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

  updateDataJadwal(String id) async {
    CollectionReference jadwal = fs.collection('jadwal');
    DocumentReference keretaRef = fs.collection("kereta").doc(kereta.value);

    final newJadwalData = {
      "berangkat": berangkat.toString().split(' ')[0],
      "tiba": tiba.toString().split(' ')[0],
      "harga": int.parse(harga.text),
      "kereta": keretaRef,
      "tujuan": tujuan.text
    };

    try {
      DocumentSnapshot docSnapshot = await jadwal.doc(id).get();
      final existingData = docSnapshot.data() as Map<String, dynamic>?;

      if (existingData != null) {
        final existingJadwalData = {
          "berangkat": existingData["berangkat"],
          "tiba": existingData["tiba"],
          "harga": existingData["harga"],
          "kereta": existingData["kereta"] as DocumentReference,
          "tujuan": existingData["tujuan"],
        };

        if (newJadwalData.toString() != existingJadwalData.toString()) {
          await jadwal.doc(id).update(newJadwalData);
          Get.showSnackbar(GetSnackBar(
            message: 'Data Jadwal Berhasil di Update',
            duration: Duration(seconds: 3),
          ));
          Get.offAllNamed(Routes.JADWAL);
        } else {
          Get.showSnackbar(GetSnackBar(
            message: 'Tidak ada perubahan pada data',
            duration: Duration(seconds: 3),
          ));
          Get.offAllNamed(Routes.JADWAL);
        }
      }
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
            message: 'err - $e',
            duration: Duration(seconds: 3),
          ));
    }
  }
}
