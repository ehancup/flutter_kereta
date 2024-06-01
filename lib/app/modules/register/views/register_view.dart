import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pas_xi_kereta/app/controllers/auth_controller.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final auth = Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
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
              onSubmitted: (value) {},
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: controller.konfirmasi,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(8)),
                  label: Text("konfirmasi")),
              onSubmitted: (value) {},
            ),
            SizedBox(
              height: 34,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      if (controller.password.text !=
                          controller.konfirmasi.text) {
                        final snackBar = SnackBar(
                          content:
                              const Text('password dan konfirmasi tidak sama'),
                          // backgroundColor: (Colors.black12),
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
                    child: Text('register')),
                ElevatedButton(
                    onPressed: () => {Get.back()}, child: Text('back')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
