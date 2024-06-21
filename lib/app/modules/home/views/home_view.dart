// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pas_xi_kereta/app/controllers/auth_controller.dart';
import 'package:pas_xi_kereta/app/modules/DetailBooking/views/detail_booking_view.dart';
import 'package:pas_xi_kereta/app/modules/jadwal/model/model.dart';
import 'package:pas_xi_kereta/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'User Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.qr_code_scanner),
              title: Text('Scan QR Code'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.train_rounded),
              title: Text('My Ticket'),
              onTap: () => Get.toNamed(Routes.MYTICKET),
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('Histori Pemesanan'),
              onTap: () => Get.toNamed(Routes.HISTORI),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Handle Settings tap
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                auth.logout();
              },
            ),
          ],
        ),
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
                        return InkWell(
                          onTap: () {
                            // Navigate to detail page or perform any action
                            Get.toNamed(Routes.DETAIL_BOOKING, arguments: dt);
                          },
                          child: Card(
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
                                  ]),
                            ),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    )),
            ],
          ),
        ),
      ),
    );
  }
}
