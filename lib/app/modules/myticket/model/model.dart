// To parse this JSON data, do
//
//     final transaksi = transaksiFromJson(jsonString);

import 'dart:convert';

Transaksi transaksiFromJson(String transaksi, String id, String jadwalId,
        String jadwal, String paymentId, String payment) =>
    Transaksi.fromJson(json.decode(transaksi), id, jadwalId, paymentId,
        json.decode(jadwal), json.decode(payment));

String transaksiToJson(Transaksi data) => json.encode(data.toJson());

class Transaksi {
  String id;
  String jadwal_id;
  String payment_id;
  Jadwal jadwal;
  Payment payment;
  bool isScan;
  int jumlahTiket;
  String nama;
  int totalHarga;

  Transaksi({
    required this.id,
    required this.jadwal_id,
    required this.payment_id,
    required this.jadwal,
    required this.payment,
    required this.isScan,
    required this.jumlahTiket,
    required this.nama,
    required this.totalHarga,
  });

  factory Transaksi.fromJson(
          Map<String, dynamic> json,
          String id,
          String jadwalId,
          String paymentId,
          Map<String, dynamic> jadwal,
          Map<String, dynamic> payment) =>
      Transaksi(
        id: id,
        jadwal_id: jadwalId,
        payment_id: paymentId,
        jadwal: Jadwal.fromJson(jadwal),
        payment: Payment.fromJson(payment),
        isScan: json["is_scan"],
        jumlahTiket: json["jumlah_tiket"],
        nama: json["nama"],
        totalHarga: json["total_harga"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "jadwal": jadwal.toJson(),
        "payment": payment.toJson(),
        "is_scan": isScan,
        "jumlah_tiket": jumlahTiket,
        "nama": nama,
        "total_harga": totalHarga,
      };
}

class Jadwal {
  DateTime berangkat;
  int harga;
  DateTime tiba;
  String tujuan;

  Jadwal({
    required this.berangkat,
    required this.harga,
    required this.tiba,
    required this.tujuan,
  });

  factory Jadwal.fromJson(Map<String, dynamic> json) => Jadwal(
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

class Payment {
  String nama;

  Payment({
    required this.nama,
  });

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        nama: json["nama"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
      };
}
