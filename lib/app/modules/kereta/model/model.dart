// To parse this JSON data, do
//
//     final kereta = keretaFromJson(jsonString);

import 'dart:convert';

Kereta keretaFromJson(String str, String id) =>
    Kereta.fromJson(json.decode(str), id);

String keretaToJson(Kereta data) => json.encode(data.toJson());

class Kereta {
  String namaKereta;
  String type;
  String id;
  int jumlahKursi;

  Kereta({
    required this.namaKereta,
    required this.type,
    required this.jumlahKursi,
    required this.id,
  });

  factory Kereta.fromJson(Map<String, dynamic> json, String id) => Kereta(
        namaKereta: json["nama_kereta"],
        type: json["type"],
        jumlahKursi: json["jumlah_kursi"],
        id: id,
      );

  Map<String, dynamic> toJson() => {
        "nama_kereta": namaKereta,
        "type": type,
        "jumlah_kursi": jumlahKursi,
      };
}
