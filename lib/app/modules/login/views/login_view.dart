import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pas_xi_kereta/app/controllers/auth_controller.dart';
import 'package:pas_xi_kereta/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final auth = Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
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
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(8)),
                  label: Text("email")),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: controller.password,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(8)),
                  label: Text("password")),
              onSubmitted: (value) =>
                  auth.login(controller.email.text, controller.password.text),
            ),
            SizedBox(
              height: 34,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // TextButton(
                //   onPressed: () {
                //     Get.toNamed(Routes.LUPA_PASSWORD);
                //   },
                //   child: Text("Lupa password"),
                // ),
                TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.REGISTER);
                  },
                  child: Text("Belum punya akun?"),
                )
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () => auth.login(
                        controller.email.text, controller.password.text),
                    child: Text('login')),
                ElevatedButton(
                    onPressed: () => auth.signInWithGoogle(),
                    child: Text('google')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
