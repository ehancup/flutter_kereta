import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_xi_kereta/app/modules/kereta/model/model.dart';
import 'package:pas_xi_kereta/app/routes/app_pages.dart';

class EditKeretaController extends GetxController {
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

    final newKeretaData = {
      "nama_kereta": nama_kereta.text,
      "type": type.text,
      "jumlah_kursi": int.parse(jumlah_Kursi.text)
    };

    try {
      DocumentSnapshot docSnapshot = await kereta.doc(id).get();
      final existingData = docSnapshot.data() as Map<String, dynamic>?;

      if (existingData != null) {
        final existingKeretaData = {
          "nama_kereta": existingData["nama_kereta"],
          "type": existingData["type"],
          "jumlah_kursi": existingData["jumlah_kursi"]
        };

        if (newKeretaData.toString() != existingKeretaData.toString()) {
          await kereta.doc(id).update(newKeretaData);
          Get.showSnackbar(GetSnackBar(
            message: 'Data Kereta Berhasil di Update',
            duration: Duration(seconds: 3),
          ));
          Get.offAllNamed(Routes.KERETA);
        } else {
          // Get.showSnackbar(GetSnackBar(
          //   message: 'Tidak ada perubahan pada data',
          //   duration: Duration(seconds: 3),
          // ));
          Get.offAllNamed(Routes.KERETA);
        }
      }
    } catch (e) {
      Get.defaultDialog(middleText: 'Gagal Mengupdate Data Kereta');
    }
  }
}
