import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_xi_kereta/app/routes/app_pages.dart';

class AddDiskonController extends GetxController {
  //TODO: Implement AddDiskonController
  TextEditingController percent = TextEditingController();
  TextEditingController desc = TextEditingController();
  FirebaseFirestore fs = FirebaseFirestore.instance;

  saveDiskon() async {
    CollectionReference diskon = fs.collection("diskon");

    final diskonData = {"percent": int.parse(percent.text), "desc": desc.text};

    try {
      await diskon.add(diskonData).then((value) {
        Get.showSnackbar(GetSnackBar(
          title: 'Success',
          message: 'success add diskon',
          duration: Duration(seconds: 3),
        ));
        Get.offAllNamed(Routes.DISKON);
      });
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        title: 'Error',
        message: 'err - $e',
        duration: Duration(seconds: 3),
      ));
    }
  }
}
