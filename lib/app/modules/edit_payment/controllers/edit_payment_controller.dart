// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_xi_kereta/app/modules/payment_method/model/model.dart';
import 'package:pas_xi_kereta/app/routes/app_pages.dart';

class EditPaymentController extends GetxController {
  TextEditingController nama = TextEditingController();
  FirebaseFirestore fs = FirebaseFirestore.instance;

  updateVariable(MetodePembayaran data) {
    nama.text = data.nama;
  }

  updateData(String id) async {
    CollectionReference metode_pembayaran = fs.collection("metode_pembayaran");

    final newDataPayment = {
      "nama": nama.text,
    };

    try {
      DocumentSnapshot docSnapshot = await metode_pembayaran.doc(id).get();
      final existingData = docSnapshot.data() as Map<String, dynamic>?;

      if (existingData != null) {
        final existingPaymentData = {
          "nama": existingData["nama"],
        };

        if (newDataPayment.toString() != existingPaymentData.toString()) {
          await metode_pembayaran.doc(id).update(newDataPayment);
          log('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
          Get.showSnackbar(GetSnackBar(
            message: 'Data Metode Pembayaran Berhasil di Update',
            duration: Duration(seconds: 3),
          ));
          Get.offAllNamed(Routes.PAYMENT_METHOD);
        } else {
          Get.showSnackbar(GetSnackBar(
            message: 'Tidak ada perubahan pada data',
            duration: Duration(seconds: 3),
          ));
          Get.offAllNamed(Routes.PAYMENT_METHOD);
        }
      }
    } catch (e) {
      Get.defaultDialog(middleText: 'Gagal Mengupdate Data');
    }
  }
}
