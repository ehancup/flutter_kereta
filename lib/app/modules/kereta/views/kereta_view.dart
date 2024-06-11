// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pas_xi_kereta/app/modules/kereta/model/model.dart';
import 'package:pas_xi_kereta/app/routes/app_pages.dart';

import '../controllers/kereta_controller.dart';

class KeretaView extends GetView<KeretaController> {
  final ctrl = Get.put(KeretaController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data kereta'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Obx(
            () => controller.status.value
                ? DataTable(
                    columns: [
                        DataColumn(label: Text('No')),
                        DataColumn(label: Text('Nama Kereta')),
                        DataColumn(label: Text('Type')),
                        // DataColumn(
                        //     label: Text(
                        //   'Jumlah Kursi',
                        // )),
                        DataColumn(
                            label: Text(
                          'Aksi',
                        )),
                      ],
                    rows: List.generate(controller.data.length, (index) {
                      print(controller.data.length);
                      var nomor = index + 1;
                      Kereta dt = controller.data[index];
                      
                      return DataRow(cells: [
                        DataCell(Text(nomor.toString())),
                        DataCell(Text(dt.namaKereta)),
                        DataCell(Text(dt.type)),
                        // DataCell(Text(dt.jumlahKursi.toString())),
                        DataCell(Row(
                          children: [
                            IconButton(
                              onPressed: () => Get.offAllNamed(
                                  Routes.EDIT_KERETA,
                                  arguments: dt),
                              icon: Icon(Icons.edit),
                              color: Colors.blue,
                            ),
                            IconButton(
                              onPressed: () {
                                Get.defaultDialog(
                                    title:
                                        'Apakah Anda yakin ingin Menghapus Produk?',
                                    middleText: 'Hapus Data Kereta ini?',
                                    confirm: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red),
                                        onPressed: () =>
                                            ctrl.deleteKereta(dt.id),
                                        child: Text(
                                          'Yes',
                                          style: TextStyle(color: Colors.white),
                                        )),
                                    cancel: ElevatedButton(
                                        onPressed: () => Get.back(),
                                        child: Text('No')));
                              },
                              icon: Icon(Icons.delete),
                              color: Colors.red,
                            ),
                          ],
                        ))
                      ]);
                    }))
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: () => Get.toNamed(Routes.ADD_PRODUCT),
        onPressed: () => Get.toNamed(Routes.ADD_KERETA),
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    );
  }
}
