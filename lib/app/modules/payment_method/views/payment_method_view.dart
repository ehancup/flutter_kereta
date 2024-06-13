// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pas_xi_kereta/app/modules/payment_method/model/model.dart';
import 'package:pas_xi_kereta/app/routes/app_pages.dart';

import '../controllers/payment_method_controller.dart';

class PaymentMethodView extends GetView<PaymentMethodController> {
  const PaymentMethodView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(PaymentMethodController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Metode Pembayaran'),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.status.value
            ? ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  var nomor = index + 1;
                  MetodePembayaran dt = controller.data[index];

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
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          SizedBox(height: 5),
                          Text('Nama Metode: ${dt.nama}',
                              style: TextStyle(fontSize: 16)),
                          SizedBox(height: 5),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () => Get.toNamed(
                                    Routes.EDIT_PAYMENT,
                                    arguments: dt),
                                icon: Icon(Icons.edit),
                                color: Colors.blue,
                              ),
                              IconButton(
                                onPressed: () {
                                  Get.defaultDialog(
                                      title:
                                          'Apakah Anda yakin ingin Menghapus Data?',
                                      middleText: 'Hapus Data Metode ini?',
                                      confirm: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.red),
                                          onPressed: () =>
                                              ctrl.deletePayment(dt.id),
                                          child: Text(
                                            'Yes',
                                            style:
                                                TextStyle(color: Colors.white),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD_PAYMENT),
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    );
  }
}
