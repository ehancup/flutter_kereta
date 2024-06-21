import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:pas_xi_kereta/app/modules/myticket/model/model.dart';

class HistoriController extends GetxController {
  FirebaseFirestore fs = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  RxBool status = false.obs;
  List<Transaksi> data = [];

  getDataHistoriTransaksi() async {
    String userId = auth.currentUser?.uid ?? '';

    if (userId.isEmpty) {
      print('User not logged in');
      return;
    }
    final transaksi = await fs
        .collection('transaksi')
        .where('is_scan', isEqualTo: true)
        .where('user_id', isEqualTo: userId)
        .get();

    if (transaksi.docs.isNotEmpty) {
      transaksi.docs.forEach((element) async {
        final transaksiId = element.id;
        final transaksiData = element.data();
        final jadwalRef = transaksiData['jadwal'] as DocumentReference;
        final jadwalId = jadwalRef.id;
        final jadwalDocs = await fs.collection('jadwal').doc(jadwalId).get();
        final jadwalData = jadwalDocs.data() as Map;

        final paymentRef =
            transaksiData["metode_pembayaran"] as DocumentReference;
        final paymentid = paymentRef.id;
        final paymentDocs =
            await fs.collection("metode_pembayaran").doc(paymentid).get();
        final paymentData = paymentDocs.data() as Map;

        Transaksi schedule = Transaksi.fromJson(
            Map.from(transaksiData),
            transaksiId,
            jadwalId,
            paymentid,
            Map.from(jadwalData),
            Map.from(paymentData));

        print("###############################################");
        print(schedule.id);
        print(schedule.jadwal_id);
        print(schedule.payment_id);
        print("###############################################");

        try {
          data.add(schedule);
          // print('berhasil');
        } catch (e) {
          print(e);
        }

        status.value = true;
        print(data.length);
      });
    }
  }

  scanQr() async {
    String qr = await FlutterBarcodeScanner.scanBarcode(
        "#000000", "Batal", true, ScanMode.QR);

    Get.defaultDialog(middleText: "hasil scan adalah ${qr}");
  }

  final count = 0.obs;
  @override
  void onInit() {
    getDataHistoriTransaksi();
    super.onInit();
  }
}
