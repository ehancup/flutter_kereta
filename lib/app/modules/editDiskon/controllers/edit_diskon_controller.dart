import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_xi_kereta/app/modules/diskon/model/model.dart';
import 'package:pas_xi_kereta/app/routes/app_pages.dart';

class EditDiskonController extends GetxController {
  //TODO: Implement EditDiskonController
  TextEditingController percent = TextEditingController();
  TextEditingController desc = TextEditingController();
  FirebaseFirestore fs = FirebaseFirestore.instance;

  updateVariable(Diskon data) {
    percent.text = data.percent.toString();
    desc.text = data.desc;
  }

  updateDataDiskon(String id) async {
    CollectionReference diskon = fs.collection("diskon");

    final newDiskonData = {
      "percent": int.parse(percent.text),
      "desc": desc.text
    };

    try {
      DocumentSnapshot docSnapshot = await diskon.doc(id).get();
      final existingData = docSnapshot.data() as Map<String, dynamic>?;

      if (existingData != null) {
        final existingDataDiskon = {
          "percent": existingData["percent"],
          "desc": existingData["desc"],
        };

        if (newDiskonData.toString() != existingDataDiskon.toString()) {
          await diskon.doc(id).update(newDiskonData);
          Get.showSnackbar(GetSnackBar(
            message: 'Data diskon Berhasil di Update',
            duration: Duration(seconds: 3),
          ));
          Get.offAllNamed(Routes.DISKON);
        } else {
          Get.showSnackbar(GetSnackBar(
            message: 'Tidak ada perubahan pada data',
            duration: Duration(seconds: 3),
          ));
          Get.offAllNamed(Routes.DISKON);
        }
      }
    } catch (e) {
      Get.defaultDialog(middleText: 'Gagal Mengupdate Data Kereta');
      print('\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\');
      print(e);
    }
  }
}
