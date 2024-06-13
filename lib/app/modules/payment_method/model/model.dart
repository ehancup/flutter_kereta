// To parse this JSON data, do
//
//     final metodePembayaran = metodePembayaranFromJson(jsonString);

import 'dart:convert';

MetodePembayaran metodePembayaranFromJson(String str, String id) =>
    MetodePembayaran.fromJson(json.decode(str), id);

String metodePembayaranToJson(MetodePembayaran data) =>
    json.encode(data.toJson());

class MetodePembayaran {
  String nama;
  String id;

  MetodePembayaran({
    required this.nama,
    required this.id,
  });

  factory MetodePembayaran.fromJson(Map<String, dynamic> json, String id) =>
      MetodePembayaran(
        nama: json["nama"],
        id: id,
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
      };
}
