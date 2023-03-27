// To parse this JSON data, do
//
//     final kepengurusanM = kepengurusanMFromJson(jsonString);

import 'dart:convert';

KepengurusanM kepengurusanMFromJson(String str) => KepengurusanM.fromJson(json.decode(str));

String kepengurusanMToJson(KepengurusanM data) => json.encode(data.toJson());

class KepengurusanM {
    KepengurusanM({
        required this.users,
    });

    Map<String, User> users;

    factory KepengurusanM.fromJson(Map<String, dynamic> json) => KepengurusanM(
        users: Map.from(json["users"]).map((k, v) => MapEntry<String, User>(k, User.fromJson(v))),
    );

    Map<String, dynamic> toJson() => {
        "users": Map.from(users).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    };
}

class User {
    User({
        required this.nim,
        required this.name,
        required this.role,
        required this.avatar,
        required this.status,
    });

    String nim;
    String name;
    String role;
    String avatar;
    String status;

    factory User.fromJson(Map<String, dynamic> json) => User(
        nim: json["nim"],
        name: json["name"],
        role: json["role"],
        avatar: json["avatar"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "nim": nim,
        "name": name,
        "role": role,
        "avatar": avatar,
        "status": status,
    };
}
