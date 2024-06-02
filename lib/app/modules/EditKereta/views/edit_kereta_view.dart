import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:pas_xi_kereta/app/modules/kereta/model/model.dart';

import '../controllers/edit_kereta_controller.dart';

class EditKeretaView extends GetView<EditKeretaController> {
  const EditKeretaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Kereta data = Get.arguments;
    controller.updateVariable(data);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: const Text('EditKeretaView'),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text('Add Kereta'),
              ),
              Gap(24),
              Container(
                width: screenWidth,
                margin: EdgeInsets.only(bottom: 24),
                padding: EdgeInsets.only(right: 24),
                height: 60,
                child: TextField(
                  controller: controller.nama_kereta,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(12)),
                    hintText: 'Nama Kereta',
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
              Container(
                width: screenWidth,
                margin: EdgeInsets.only(bottom: 24),
                padding: EdgeInsets.only(right: 24),
                height: 60,
                child: TextField(
                  controller: controller.type,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(12)),
                    hintText: 'Type Kereta',
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
              Container(
                width: screenWidth,
                margin: EdgeInsets.only(bottom: 24),
                padding: EdgeInsets.only(right: 24),
                height: 60,
                child: TextField(
                  controller: controller.jumlah_Kursi,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(12)),
                    hintText: 'Jumlah Kursi',
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => controller.updateDataKereta(data.id),
                child: Text('Submit Data'),
              )
            ],
          ),
        ));
  }
}
