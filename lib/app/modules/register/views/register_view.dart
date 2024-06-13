// ignore_for_file: prefer_const_constructors, void_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pas_xi_kereta/app/controllers/auth_controller.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Get.put(AuthController());
    final controller = Get.put(RegisterController());
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Register',
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        margin: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            TextField(
              controller: controller.email,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                label: Text(
                  "email",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Obx(
              () => TextField(
                controller: controller.password,
                obscureText: !controller.isPasswordVisible.value,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: Text("password"),
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.isPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      controller.isPasswordVisible.value =
                          !controller.isPasswordVisible.value;
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Obx(
              () => TextField(
                controller: controller.konfirmasi,
                obscureText: !controller.isConfirmationVisible.value,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: Text("konfirmasi"),
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.isConfirmationVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      controller.isConfirmationVisible.value =
                          !controller.isConfirmationVisible.value;
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 34,
            ),
            Container(
              width: screenWidth,
              height: 60,
              margin: EdgeInsetsDirectional.only(bottom: 24),
              child: ElevatedButton(
                onPressed: () {
                  if (controller.password.text != controller.konfirmasi.text) {
                    final snackBar = SnackBar(
                      content: const Text('password dan konfirmasi tidak sama'),
                      action: SnackBarAction(
                        label: 'ok',
                        onPressed: () {},
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    return auth.register(
                        controller.email.text, controller.password.text);
                  }
                },
                child: Text(
                  'register',
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            // Container(
            //   width: screenWidth,
            //   height: 60,
            //   margin: EdgeInsetsDirectional.only(bottom: 24),
            //   child: ElevatedButton(
            //     onPressed: () {
            //       Get.back();
            //     },
            //     child: Text(
            //       'kembali',
            //       style: GoogleFonts.poppins(
            //           fontSize: 16, fontWeight: FontWeight.w400),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
