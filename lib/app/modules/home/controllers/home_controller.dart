import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pas_xi_kereta/app/modules/jadwal/model/model.dart';
class HomeController extends GetxController {
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

  final count = 0.obs;
  @override
  void onInit() async {
    getDatajadwal();

    super.onInit();
  }
}
