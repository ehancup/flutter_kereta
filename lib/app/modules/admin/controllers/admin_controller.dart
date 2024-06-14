import 'package:flutter/cupertino.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:get/get.dart';

class AdminController extends GetxController {
  TextEditingController email = TextEditingController();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // //TODO: Implement AdminController

  scanQr() async {
    try {
      String qr = await FlutterBarcodeScanner.scanBarcode(
          "#000000", "Batal", true, ScanMode.QR);
      Get.defaultDialog(middleText: "hasil scan adalah ${qr}");
    } catch (e) {
      print(e.toString());
    }

    // Get.defaultDialog(
    //     content: Container(
    //   height: 500,
    //   width: 500,
    //   child: QRView(
    //     key: qrKey,
    //     onQRViewCreated: (QRViewController qrController) {
    //       qrController.scannedDataStream.listen((scanData) async {
    //         qrController.pauseCamera();
    //         // await controller.scanQr1(scanData.code.toString());
    //         print(scanData);
    //         qrController.resumeCamera();
    //       });
    //     },
    //   ),
    // ));
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
