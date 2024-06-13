// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/add_payment_controller.dart';

class AddPaymentView extends GetView<AddPaymentController> {
  const AddPaymentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Metode Pembayaran'),
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
                controller: controller.nama,
                decoration: InputDecoration(
                  labelText: 'Nama Metode Pembayaran',
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
                onPressed: () => controller.saveData(),
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
