// To parse this JSON data, do
//
//     final diskon = diskonFromJson(jsonString);

import 'dart:convert';

Diskon diskonFromJson(String str, String id) => Diskon.fromJson(json.decode(str), id);

String diskonToJson(Diskon data) => json.encode(data.toJson());

class Diskon {
  String id;
  String desc;
  int percent;

  Diskon({
    required this.id,
    required this.desc,
    required this.percent,
  });

  factory Diskon.fromJson(Map<String, dynamic> json, String id) => Diskon(
        id: id,
        desc: json["desc"],
        percent: json["percent"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "desc": desc,
        "percent": percent,
      };
}
