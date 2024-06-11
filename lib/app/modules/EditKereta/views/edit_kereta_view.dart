import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pas_xi_kereta/app/modules/kereta/model/model.dart';
import '../controllers/edit_kereta_controller.dart';

class EditKeretaView extends GetView<EditKeretaController> {
  const EditKeretaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Kereta data = Get.arguments as Kereta;
    log("tesssssssssssssssssssssssssssssssssssssss");
    print('*************************KERETA*************************');
    print(data.id);
    controller.updateVariable(data);
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Kereta'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Gap(24),
            Container(
              width: screenWidth,
              margin: EdgeInsets.only(bottom: 24),
              padding: EdgeInsets.only(right: 24),
              height: 60,
              child: TextField(
                controller: controller.nama_kereta,
                decoration: InputDecoration(
                  labelText: 'Nama Kereta',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(12),
                  ),
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
                  labelText: 'Type Kereta',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(12),
                  ),
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
                  labelText: 'Jumlah Kursi',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(bottom: 24),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple.shade50),
                onPressed: () => controller.updateDataKereta(data.id),
                child: Container(
                  width: 150,
                  height: 50,
                  child: Center(
                    child: Text(
                      'Update Data',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
