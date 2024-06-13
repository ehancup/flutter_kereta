import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pas_xi_kereta/app/modules/diskon/model/model.dart';
import 'package:pas_xi_kereta/app/routes/app_pages.dart';

import '../controllers/diskon_controller.dart';

class DiskonView extends GetView<DiskonController> {
  const DiskonView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(DiskonController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('DiskonView'),
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
                          Diskon dt = controller.data[index];

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
                                  Text('Diskon: ${dt.percent}%',
                                      style: TextStyle(fontSize: 16)),
                                  SizedBox(height: 5),
                                  Text('Ket.: ${dt.desc}',
                                      style: TextStyle(fontSize: 16)),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed: () => Get.toNamed(
                                            Routes.EDIT_DISKON,
                                            arguments: dt),
                                        icon: Icon(Icons.edit),
                                        color: Colors.blue,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          Get.defaultDialog(
                                              title:
                                                  'Apakah Anda yakin ingin Menghapus Data?',
                                              middleText: 'Hapus Diskon ini?',
                                              confirm: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Colors.red),
                                                  onPressed: () => controller
                                                      .deleteDiskon(dt.id),
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
        onPressed: () => Get.toNamed(Routes.ADD_DISKON),
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    );
  }
}
