import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pas_xi_kereta/app/modules/myticket/model/model.dart';
import 'package:pas_xi_kereta/app/routes/app_pages.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../controllers/histori_controller.dart';

class HistoriView extends GetView<HistoriController> {
  const HistoriView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histori'),
        centerTitle: true,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Obx(() => controller.status.value
                  ? ListView.builder(
                      itemCount: controller.data.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var nomor = index + 1;
                        Transaksi dt = controller.data[index];
                        print(dt);

                        return Card(
                          margin: EdgeInsets.all(10),
                          elevation: 5,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('No: $nomor',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: 5),
                                  Text('Nama: ${dt.nama}',
                                      style: TextStyle(fontSize: 16)),
                                  SizedBox(height: 5),
                                  Text('Tujuan: ${dt.jadwal.tujuan}',
                                      style: TextStyle(fontSize: 16)),
                                  SizedBox(height: 5),
                                  Text(
                                      'Berangkat: ${DateFormat('dd MMM yyyy').format(dt.jadwal.berangkat)}',
                                      style: TextStyle(fontSize: 16)),
                                  SizedBox(height: 10),
                                  Text(
                                      'Tiba: ${DateFormat('dd MMM yyyy').format(dt.jadwal.tiba)}',
                                      style: TextStyle(fontSize: 16)),
                                  SizedBox(height: 10),
                                  Text('Jumlah Tiket: ${dt.jumlahTiket}',
                                      style: TextStyle(fontSize: 16)),
                                  SizedBox(height: 10),
                                  Text('Total Harga: ${dt.totalHarga}',
                                      style: TextStyle(fontSize: 16)),
                                  SizedBox(height: 10),
                                  Text('Metode Pembayaran: ${dt.payment.nama}',
                                      style: TextStyle(fontSize: 16)),
                                  Text('is_scan: ${dt.isScan}',
                                      style: TextStyle(fontSize: 16)),
                                  SizedBox(height: 10),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 20),
                                    width: MediaQuery.of(context).size.width,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          Get.bottomSheet(Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 20),
                                            decoration: BoxDecoration(
                                                color: Colors.white),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white),
                                                    width: 300,
                                                    height: 300,
                                                    margin: EdgeInsets.only(
                                                        bottom: 20),
                                                    child: QrImageView(
                                                      data: dt.id,
                                                      version: QrVersions.auto,
                                                      size: 300,
                                                    )),
                                                Container(
                                                  child: ElevatedButton(
                                                      onPressed: () =>
                                                          Get.back(),
                                                      child: Text("close")),
                                                )
                                              ],
                                            ),
                                          ));
                                        },
                                        child: Text("QR Code")),
                                  )
                                ]),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    )),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () => Get.offAllNamed(Routes.HOME),
                        child: Text('back to Home'))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
