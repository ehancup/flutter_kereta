import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pas_xi_kereta/app/controllers/auth_controller.dart';
import 'package:pas_xi_kereta/app/routes/app_pages.dart';

import '../controllers/admin_controller.dart';

class AdminView extends GetView<AdminController> {
  const AdminView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final auth = Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('AdminView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
              child: IconButton(
                  onPressed: () => auth.logout(), icon: Icon(Icons.logout))),
          Center(
              child: IconButton(
            onPressed: () => Get.offAllNamed(Routes.KERETA),
            icon: Icon(Icons.data_array_outlined),
          )),
        ],
      ),
    );
  }
}
