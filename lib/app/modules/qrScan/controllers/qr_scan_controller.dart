import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_xi_kereta/app/routes/app_pages.dart';

class QrScanController extends GetxController {
  //TODO: Implement QrScanController
  final auth = FirebaseAuth.instance;
  final fs = FirebaseFirestore.instance;

  scanQr(String result) async {
    String? uid = auth.currentUser!.uid;

    final transaksi = await fs.collection("transaksi").doc(result).get();
    final data = transaksi.data();
    bool isScanned = data!["is_scan"] as bool;

    if (isScanned == false) {
      final payload = {
        "is_scan": true,
        "jadwal": data["jadwal"],
        "jumlah_tiket": data["jumlah_tiket"],
        "metode_pembayaran": data["metode_pembayaran"],
        "nama": data["nama"],
        "total_harga": data["total_harga"],
        "user_id": data["user_id"]
      };

      try {
        await fs.collection("transaksi").doc(result).update(payload);
        Get.showSnackbar(GetSnackBar(
          message: 'Tiket berhasil discan',
          duration: Duration(seconds: 3),
        ));
        Get.offAllNamed(Routes.ADMIN);
      } catch (e) {
        Get.showSnackbar(GetSnackBar(
          message: 'Tiket gagal',
          duration: Duration(seconds: 3),
        ));
        print(e);
      }
    } else {
      Get.showSnackbar(GetSnackBar(
        message: 'Tiket sudah discan',
        duration: Duration(seconds: 3),
      ));
    }
  }
}
