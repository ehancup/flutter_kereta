import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pas_xi_kereta/app/modules/jadwal/model/model.dart';
import 'package:pas_xi_kereta/app/modules/kereta/controllers/kereta_controller.dart';

import '../controllers/edit_jadwal_controller.dart';

class EditJadwalView extends GetView<EditJadwalController> {
  const EditJadwalView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Jadwal data = Get.arguments as Jadwal;
    final keretaCtrl = Get.put(KeretaController());
    final screenWidth = MediaQuery.of(context).size.width;
    print('*************************** JADWAL *************************');
    print(data.id);
    print(data.jadwal.berangkat);
    print(data.jadwal.tiba);
    print(data.jadwal.tujuan);
    print(data.kereta_id);
    controller.updateVariable(data);
    // print();
    return Scaffold(
      appBar: AppBar(
        title: const Text('EditJadwalView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Gap(24),
            Container(
              width: screenWidth,
              margin: EdgeInsets.only(bottom: 24),
              height: 60,
              child: TextField(
                controller: controller.tujuan,
                decoration: InputDecoration(
                  labelText: 'Tujuan',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            Container(
              width: screenWidth,
              margin: EdgeInsets.only(bottom: 24),
              height: 60,
              child: TextField(
                controller: controller.harga,
                decoration: InputDecoration(
                  labelText: 'Harga',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            Container(
              width: screenWidth,
              margin: EdgeInsets.only(bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Berangkat',
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(DateFormat('dd MMM yyyy')
                          .format(controller.berangkat)),
                      ElevatedButton(
                          onPressed: () {
                            showDatePicker(
                                    context: context,
                                    firstDate: DateTime.now(),
                                    initialDate: controller.berangkat,
                                    lastDate: DateTime(2030))
                                .then((value) {
                              controller.setBerangkat(value);
                              print(value);
                            });
                          },
                          child: Text("Pick a date"))
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: screenWidth,
              margin: EdgeInsets.only(bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tiba',
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(DateFormat('dd MMM yyyy').format(controller.tiba)),
                      ElevatedButton(
                          onPressed: () {
                            showDatePicker(
                                    context: context,
                                    firstDate: DateTime.now(),
                                    initialDate: controller.tiba,
                                    lastDate: DateTime(2030))
                                .then((value) {
                              controller.setTiba(value);
                              print(value);
                            });
                          },
                          child: Text("Pick a date"))
                    ],
                  )
                ],
              ),
            ),
            Container(
                margin: EdgeInsetsDirectional.only(bottom: 24),
                child: Obx(() => keretaCtrl.status.value
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Kereta',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold),
                          ),
                          DropdownButton(
                              value: controller.kereta.value,
                              items: [
                                DropdownMenuItem(
                                  child: Text('Select kereta'),
                                  value: '',
                                  enabled: false,
                                ),
                                ...keretaCtrl.data
                                    .map<DropdownMenuItem<String>>((e) {
                                  return DropdownMenuItem<String>(
                                    value: e.id,
                                    child: Text(e.namaKereta),
                                  );
                                }),
                              ],
                              onChanged: (e) {
                                if (e != null) {
                                  controller.setKereta(e);
                                  print('&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&');
                                  print(controller.kereta.value);
                                }
                              })
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [CircularProgressIndicator()],
                      ))),
            Container(
              margin: EdgeInsetsDirectional.only(bottom: 24),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple.shade50),
                onPressed: () => controller.updateDataJadwal(data.id),
                child: Container(
                  width: 150,
                  height: 50,
                  child: Center(
                    child: Text(
                      'Submit Data',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
