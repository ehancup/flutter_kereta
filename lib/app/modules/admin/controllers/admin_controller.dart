import 'package:flutter/cupertino.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

class AdminController extends GetxController {
  TextEditingController email = TextEditingController();

  // //TODO: Implement AdminController

  scanQr() async {
    try {
      String qr = await FlutterBarcodeScanner.scanBarcode(
          "#000000", "Batal", true, ScanMode.QR);
      Get.defaultDialog(middleText: "hasil scan adalah ${qr}");
    } catch (e) {
      print(e.toString());
    }
  }

  // final count = 0.obs;
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  // void increment() => count.value++;
}
