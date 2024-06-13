// ignore_for_file: avoid_function_literals_in_foreach_calls, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pas_xi_kereta/app/modules/jadwal/model/model.dart';
import 'package:pas_xi_kereta/app/routes/app_pages.dart';

class JadwalController extends GetxController {
  //TODO: Implement JadwalController
  FirebaseFirestore fs = FirebaseFirestore.instance;
  RxBool status = false.obs;
  List<Jadwal> data = [];

  getDatajadwal() async {
    final jadwal = await fs.collection('jadwal').get();

    if (jadwal.docs.isNotEmpty) {
      jadwal.docs.forEach((element) async {
        final jadwalId = element.id;
        final jadwalData = element.data();
        final keretaRef = jadwalData['kereta'] as DocumentReference;

        final keretaId = keretaRef.id;

        final keretaDocs = await fs.collection('kereta').doc(keretaId).get();
        final keretaData = keretaDocs.data() as Map;
        Jadwal schedule = Jadwal.fromJson(Map.from(jadwalData),
            Map.from(keretaData), jadwalId, keretaDocs.id);

        try {
          data.add(schedule);
          // print('berhasil');
        } catch (e) {
          print(e);
        }

        status.value = true;
        print(data.length);
      });
    }
  }

  deleteJadwal(String id) async {
    try {
      await fs.collection('jadwal').doc(id).delete();
      Get.showSnackbar(GetSnackBar(
        title: 'Success',
        message: 'delete success',
        duration: Duration(seconds: 3),
      ));
      Get.offAllNamed(Routes.JADWAL);
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        title: 'Error',
        message: 'err - $e',
        duration: Duration(seconds: 3),
      ));
    }
  }

  final count = 0.obs;
  @override
  void onInit() async {
    getDatajadwal();

    super.onInit();
  }
}
