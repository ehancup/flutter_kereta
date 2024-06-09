import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController konfirmasi = TextEditingController();
  var isPasswordVisible = false.obs;
  var isConfirmationVisible = false.obs;
}
