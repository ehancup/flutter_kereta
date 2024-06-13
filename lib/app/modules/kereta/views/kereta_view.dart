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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Obx(
                () => controller.status.value
                    ? ListView.builder(
                        itemCount: controller.data.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var nomor = index + 1;
                          Kereta dt = controller.data[index];

                          return Card(
                            margin: EdgeInsets.all(10),
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('No: $nomor',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: 5),
                                  Text('Nama Kereta: ${dt.namaKereta}',
                                      style: TextStyle(fontSize: 16)),
                                  SizedBox(height: 5),
                                  Text('Type: ${dt.type}',
                                      style: TextStyle(fontSize: 16)),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed: () => Get.toNamed(
                                            Routes.EDIT_KERETA,
                                            arguments: dt),
                                        icon: Icon(Icons.edit),
                                        color: Colors.blue,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          Get.defaultDialog(
                                              title:
                                                  'Apakah Anda yakin ingin Menghapus Data?',
                                              middleText:
                                                  'Hapus Data Kereta ini?',
                                              confirm: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Colors.red),
                                                  onPressed: () =>
                                                      ctrl.deleteKereta(dt.id),
                                                  child: Text(
                                                    'Yes',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )),
                                              cancel: ElevatedButton(
                                                  onPressed: () => Get.back(),
                                                  child: Text('No')));
                                        },
                                        icon: Icon(Icons.delete),
                                        color: Colors.red,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () => Get.offAllNamed(Routes.ADMIN),
                        child: Text('back to dasboard'))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD_KERETA),
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    );
  }
}
