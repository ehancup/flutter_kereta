import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pas_xi_kereta/app/modules/diskon/model/model.dart';

import '../controllers/edit_diskon_controller.dart';

class EditDiskonView extends GetView<EditDiskonController> {
  const EditDiskonView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    Diskon data = Get.arguments as Diskon;
    controller.updateVariable(data);
    return Scaffold(
      appBar: AppBar(
        title: const Text('EditDiskonView'),
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
                controller: controller.percent,
                decoration: InputDecoration(
                  labelText: 'Percent',
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
                controller: controller.desc,
                decoration: InputDecoration(
                  labelText: 'Keterangan',
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
                onPressed: () => controller.updateDataDiskon(data.id),
                child: Container(
                  width: 150,
                  height: 50,
                  child: Center(
                    child: Text(
                      'Submit Data',
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
