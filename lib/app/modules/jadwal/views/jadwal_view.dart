// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pas_xi_kereta/app/modules/jadwal/model/model.dart';
import 'package:pas_xi_kereta/app/routes/app_pages.dart';
import 'package:intl/intl.dart';

import '../controllers/jadwal_controller.dart';

class JadwalView extends GetView<JadwalController> {
  const JadwalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(JadwalController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('JadwalView'),
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
                        Jadwal dt = controller.data[index];
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
                                  Text('Kereta: ${dt.kereta.namaKereta}',
                                      style: TextStyle(fontSize: 16)),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed: () => Get.toNamed(
                                            Routes.EDIT_JADWAL,
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
                                                  onPressed: () => controller
                                                      .deleteJadwal(dt.id),
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
        onPressed: () => Get.toNamed(Routes.ADD_JADWAL),
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    );
  }
}
