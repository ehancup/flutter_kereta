import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pas_xi_kereta/app/modules/jadwal/model/model.dart';
import 'package:pas_xi_kereta/app/modules/payment_method/controllers/payment_method_controller.dart';
import 'package:pas_xi_kereta/app/modules/payment_method/model/model.dart';
import 'package:pas_xi_kereta/app/routes/app_pages.dart';

import '../controllers/detail_booking_controller.dart';

class DetailBookingView extends GetView<DetailBookingController> {
  const DetailBookingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final paymentCtrl =
        Get.put(PaymentMethodController()); // Access PaymentMethodController

    Jadwal data = Get.arguments as Jadwal;
    controller.harga.value = data.jadwal.harga; // Set the initial price
    controller.tujuan.value = data.jadwal.tujuan;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Booking'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          children: [
            TextField(
              controller: controller.nama,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                label: Text(
                  "Nama",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Gap(24),
            Container(
              width: screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.grey.shade300,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Tujuan: ${data.jadwal.tujuan}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text(
                        'Berangkat: ${DateFormat('dd MMM yyyy').format(data.jadwal.berangkat)}',
                        style: TextStyle(fontSize: 18)),
                    SizedBox(height: 10),
                    Text(
                        'Tiba: ${DateFormat('dd MMM yyyy').format(data.jadwal.tiba)}',
                        style: TextStyle(fontSize: 18)),
                    SizedBox(height: 10),
                    Text('Kereta: ${data.kereta.namaKereta}',
                        style: TextStyle(fontSize: 18)),
                    Text('Harga: ${data.jadwal.harga}',
                        style: TextStyle(fontSize: 18)),
                    // Add more details as needed
                  ],
                ),
              ),
            ),
            Gap(24),
            Container(
                margin: EdgeInsetsDirectional.only(bottom: 24),
                child: Obx(() => paymentCtrl.status.value
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Pembayaran',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold),
                          ),
                          DropdownButton(
                            value: controller.payment
                                .value, // Pastikan nilai dropdown sesuai dengan nilai payment dari controller
                            items: [
                              DropdownMenuItem(
                                child: Text('Pilih Pembayaran'),
                                value: '',
                                enabled: false,
                              ),
                              ...paymentCtrl.data
                                  .map<DropdownMenuItem<String>>((e) {
                                return DropdownMenuItem<String>(
                                  value: e.id,
                                  child: Text(e.nama),
                                );
                              }),
                            ],
                            onChanged: (e) {
                              if (e != null) {
                                controller.setPayment(e);
                                print('Payment method: $e');
                              }
                            },
                          )
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [CircularProgressIndicator()],
                      ))),
            Gap(24),
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Jumlah Tiket',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                    ),
                    DropdownButton(
                        value: controller.jumlahTiket.value.toString(),
                        items: List.generate(10, (index) => index + 1)
                            .map<DropdownMenuItem<String>>((e) {
                          return DropdownMenuItem<String>(
                            value: e.toString(),
                            child: Text(e.toString()),
                          );
                        }).toList(),
                        onChanged: (e) {
                          if (e != null) {
                            controller.setTicketCount(int.parse(e));
                            print('&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&');
                            print(controller.jumlahTiket.value);
                          }
                        })
                  ],
                )),
            Gap(24),
            Obx(() => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Harga',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${controller.totalHarga.value}',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                )),
            Gap(24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.offAllNamed(Routes.HOME);
                  },
                  child: Text('Kembali'),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.handleBooking(data.id);
                  },
                  child: Text('Pesan'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
