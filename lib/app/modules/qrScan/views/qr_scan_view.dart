import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_web_qrcode_scanner/flutter_web_qrcode_scanner.dart';
import 'dart:ui_web';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../controllers/qr_scan_controller.dart';

class QrScanView extends GetView<QrScanController> {
  QrScanView({Key? key}) : super(key: key);
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  // final ScanQrViewController controller = Get.put(ScanQrViewController());
  CameraController _controller = CameraController(autoPlay: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QrScanView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: 600,
            child: FlutterWebQrcodeScanner(
              height: 600,
              cameraDirection: CameraDirection.back,
              stopOnFirstResult: false,
              controller: _controller,
              onGetResult: (result) async {
                // await controller.addAbsensi(result);
                try {
                  print(result);
                  await controller.scanQr(result);
                  _controller.stopVideoStream();
                } catch (e) {
                  print(e.toString());
                }
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _controller.startVideoStream();
            },
            child: Text('Start Scanning'),
          ),
        ],
      ),
    );
  }
}
