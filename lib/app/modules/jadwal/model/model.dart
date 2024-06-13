// To parse this JSON data, do
//
//     final jadwal = jadwalFromJson(jsonString);

// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

Jadwal jadwalFromJson(
        String jadwal, String kereta, String id, String keretaId) =>
    Jadwal.fromJson(json.decode(jadwal), json.decode(kereta), id, keretaId);

String jadwalToJson(Jadwal data) => json.encode(data.toJson());

class Jadwal {
  String id;
  String kereta_id;
  JadwalClass jadwal;
  Kereta kereta;

  Jadwal({
    required this.id,
    required this.jadwal,
    required this.kereta,
    required this.kereta_id,
  });

  factory Jadwal.fromJson(Map<String, dynamic> jadwal,
          Map<String, dynamic> kereta, String id, String keretaId) =>
      Jadwal(
        id: id,
        kereta_id: keretaId,
        jadwal: JadwalClass.fromJson(jadwal),
        kereta: Kereta.fromJson(kereta),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kereta_id": kereta_id,
        "jadwal": jadwal.toJson(),
        "kereta": kereta.toJson(),
      };
}

class JadwalClass {
  DateTime berangkat;
  int harga;
  DateTime tiba;
  String tujuan;

  JadwalClass({
    required this.berangkat,
    required this.harga,
    required this.tiba,
    required this.tujuan,
  });

  factory JadwalClass.fromJson(Map<String, dynamic> json) => JadwalClass(
        berangkat: DateTime.parse(json["berangkat"]),
        harga: json["harga"],
        tiba: DateTime.parse(json["tiba"]),
        tujuan: json["tujuan"],
      );

  Map<String, dynamic> toJson() => {
        "berangkat":
            "${berangkat.year.toString().padLeft(4, '0')}-${berangkat.month.toString().padLeft(2, '0')}-${berangkat.day.toString().padLeft(2, '0')}",
        "harga": harga,
        "tiba":
            "${tiba.year.toString().padLeft(4, '0')}-${tiba.month.toString().padLeft(2, '0')}-${tiba.day.toString().padLeft(2, '0')}",
        "tujuan": tujuan,
      };
}

class Kereta {
  int jumlahKursi;
  String namaKereta;
  String type;

  Kereta({
    required this.jumlahKursi,
    required this.namaKereta,
    required this.type,
  });

  factory Kereta.fromJson(Map<String, dynamic> json) => Kereta(
        jumlahKursi: json["jumlah_kursi"],
        namaKereta: json["nama_kereta"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "jumlah_kursi": jumlahKursi,
        "nama_kereta": namaKereta,
        "type": type,
      };
}
