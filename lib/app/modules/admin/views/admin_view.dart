// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_xi_kereta/app/controllers/auth_controller.dart';
import 'package:pas_xi_kereta/app/modules/admin/components/dashboardCard.dart';
import 'package:pas_xi_kereta/app/routes/app_pages.dart';

import '../controllers/admin_controller.dart';

class AdminView extends GetView<AdminController> {
  const AdminView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Get.put(AuthController());
    final controller = Get.put(AdminController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
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
                'Admin Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text('Dashboard'),
              onTap: () {
                // Handle Dashboard tap
              },
            ),
            ListTile(
              leading: Icon(Icons.train),
              title: Text('Kereta'),
              onTap: () => Get.offAllNamed(Routes.KERETA),
            ),
            ListTile(
              leading: Icon(Icons.schedule),
              title: Text('Jadwal Kereta'),
              onTap: () => Get.offAllNamed(Routes.JADWAL),
            ),
            ListTile(
              leading: Icon(Icons.wallet),
              title: Text('Metode Pembayaran'),
              onTap: () => Get.offAllNamed(Routes.PAYMENT_METHOD),
            ),
            ListTile(
              leading: Icon(Icons.percent_outlined),
              title: Text('Diskon'),
              onTap: () => Get.offAllNamed(Routes.DISKON),
            ),
            ListTile(
              leading: Icon(Icons.qr_code_scanner),
              title: Text('Scan QR Code'),
              onTap: () {},
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to the Admin Dashboard',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  DashboardCard(
                    icon: Icons.percent_outlined,
                    title: 'Diskon',
                    color: Colors.blue,
                    onTap: () => Get.toNamed(Routes.DISKON),
                  ),
                  DashboardCard(
                    icon: Icons.train,
                    title: 'Kereta',
                    color: Colors.greenAccent,
                    onTap: () => Get.toNamed(Routes.KERETA),
                  ),
                  DashboardCard(
                    icon: Icons.schedule,
                    title: 'Jadwal',
                    color: Colors.orangeAccent,
                    onTap: () => Get.toNamed(Routes.JADWAL),
                  ),
                  DashboardCard(
                    icon: Icons.wallet,
                    title: 'Metode Pembayaran',
                    color: Colors.redAccent,
                    onTap: () => Get.toNamed(Routes.PAYMENT_METHOD),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
