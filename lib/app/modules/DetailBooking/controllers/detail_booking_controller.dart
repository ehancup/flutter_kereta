import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_xi_kereta/app/modules/jadwal/model/model.dart';
import 'package:pas_xi_kereta/app/routes/app_pages.dart';

class DetailBookingController extends GetxController {
  TextEditingController nama = TextEditingController();
  final fs = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  RxString payment = ''.obs;
  RxInt jumlahTiket = 1.obs;
  RxInt harga = 0.obs;
  RxDouble discount = 0.0.obs;
  RxDouble totalHarga = 0.0.obs;
  List<JadwalClass> data = [];
  RxString tujuan = "".obs;

  void setPayment(String p) {
    print("payment do");
    payment.value = p;
    hitungDiskon();
  }

  void hitungDiskon() {
    print('Ngitung Diskon....');
    print('Metode Pembayaran: ${payment.value}');
    print('Jumlah Tiker: ${jumlahTiket.value}');
    print('Harga Per Tiket: ${harga.value}');

    int total = jumlahTiket.value * harga.value;
    print('Total Harga sebelum diskon: $total');

    if (payment.value == 'RfwewDFrGEZn4eVKcygd') {
      discount.value = discount.value + (total * 0.20);
      print('Diskon MQ Pay: ${discount.value}');
    }
    if (jumlahTiket.value >= 5) {
      discount.value = discount.value + (total * 0.05);
      print(
          'Diskon Pembelin tiket lebih atau sama dengan 5: ${discount.value}');
    }
    if (tujuan.value == 'surabaya') {
      discount.value = discount.value + (total * 0.10);
      print('Diskon tujuan Surabaya: ${discount.value}');
    }

    totalHarga.value = total - discount.value;
    print('Total Harga setelah diskon: ${totalHarga.value}');
  }

  handleBooking(String jadwalId) async {
    print(auth.currentUser!.uid);
    CollectionReference transaksiCol = fs.collection("transaksi");
    if (payment != '' && nama.text != '') {
      DocumentReference jadwalRef = fs.collection('jadwal').doc(jadwalId);
      DocumentReference paymentRef =
          fs.collection('metode_pembayaran').doc(payment.value);

      final pemesanan = {
        "is_scan": false,
        "jadwal": jadwalRef,
        "jumlah_tiket": jumlahTiket.value,
        "metode_pembayaran": paymentRef,
        "nama": nama.text,
        "total_harga": totalHarga.value,
        "user_id": auth.currentUser!.uid
      };

      try {
        await transaksiCol.add(pemesanan).then((value) {
          Get.showSnackbar(GetSnackBar(
            title: 'Success',
            message: 'Berhasil Membeli Tiket',
            duration: Duration(seconds: 3),
          ));
        });
        Get.offAllNamed(Routes.HOME);
      } catch (e) {
        Get.showSnackbar(GetSnackBar(
          title: 'error',
          message: 'error - $e',
          duration: Duration(seconds: 3),
        ));

        Get.offAllNamed(Routes.HOME);
      }
    } else {
      Get.showSnackbar(GetSnackBar(
        title: 'Warning',
        message: 'please select payment method and input name',
        duration: Duration(seconds: 3),
      ));
    }
  }

  void setTicketCount(int count) {
    jumlahTiket.value = count;
    hitungDiskon();
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
