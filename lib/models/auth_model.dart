// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
    User user;
    String accessToken;

    AuthModel({
        required this.user,
        required this.accessToken,
    });

    factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        user: User.fromJson(json["user"]),
        accessToken: json["access_token"],
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "access_token": accessToken,
    };
}

class User {
    String name;
    String nim;
    String email;
    String na;
    String year;
    String namaBagus;
    String role;
    String avatar;

    User({
        required this.name,
        required this.nim,
        required this.email,
        required this.na,
        required this.year,
        required this.namaBagus,
        required this.role,
        required this.avatar,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        nim: json["nim"],
        email: json["email"],
        na: json["na"],
        year: json["year"],
        namaBagus: json["nama_bagus"],
        role: json["role"],
        avatar: json["avatar"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "nim": nim,
        "email": email,
        "na": na,
        "year": year,
        "nama_bagus": namaBagus,
        "role": role,
        "avatar": avatar,
    };
}
