import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_xi_kereta/app/modules/jadwal/model/model.dart';

class DetailBookingController extends GetxController {
  TextEditingController nama = TextEditingController();
  RxString payment = ''.obs;
  RxInt jumlahTiket = 1.obs;
  RxInt harga = 0.obs;
  RxDouble discount = 0.0.obs;
  RxDouble totalHarga = 0.0.obs;
  List<JadwalClass> data = [];

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
      discount.value = total * 0.20;
      print('Diskon MQ Pay: ${discount.value}');
    } else if (jumlahTiket.value >= 5) {
      discount.value = total * 0.05;
      print(
          'Diskon Pembelin tiket lebih atau sama dengan 5: ${discount.value}');
    } else if (data.isNotEmpty && data[0].tujuan == 'surabaya') {
      discount.value = total * 0.10;
      print('Diskon tujuan Surabaya: ${discount.value}');
    } else {
      discount.value = 0.0;
      print('Tidak ada diskon');
    }

    totalHarga.value = total - discount.value;
    print('Total Harga setelah diskon: ${totalHarga.value}');
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
