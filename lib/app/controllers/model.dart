// To parse this JSON data, do
//
//     final admin = adminFromJson(jsonString);

import 'dart:convert';

Admin adminFromJson(String str) => Admin.fromJson(json.decode(str));

String adminToJson(Admin data) => json.encode(data.toJson());

class Admin {
    String uid;

    Admin({
        required this.uid,
    });

    factory Admin.fromJson(Map<String, dynamic> json) => Admin(
        uid: json["uid"],
    );

    Map<String, dynamic> toJson() => {
        "uid": uid,
    };
}
