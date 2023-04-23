// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
    AuthModel({
        required this.user,
        required this.accessToken,
    });

    User user;
    String accessToken;

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
    User({
        required this.id,
        required this.nim,
        required this.na,
        required this.namaBagus,
        required this.avatar,
        required this.email,
        required this.name,
        required this.year,
        this.emailVerifiedAt,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    String nim;
    String na;
    String namaBagus;
    String avatar;
    String email;
    String name;
    String year;
    dynamic emailVerifiedAt;
    DateTime createdAt;
    DateTime updatedAt;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        nim: json["nim"],
        na: json["na"],
        namaBagus: json["nama_bagus"],
        avatar: json["avatar"],
        email: json["email"],
        name: json["name"],
        year: json["year"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nim": nim,
        "na": na,
        "nama_bagus": namaBagus,
        "avatar": avatar,
        "email": email,
        "name": name,
        "year": year,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
