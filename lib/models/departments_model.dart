// To parse this JSON data, do
//
//     final departmentsModel = departmentsModelFromJson(jsonString);

import 'dart:convert';

List<DepartmentsModel> departmentsModelFromJson(String str) => List<DepartmentsModel>.from(json.decode(str).map((x) => DepartmentsModel.fromJson(x)));

String departmentsModelToJson(List<DepartmentsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DepartmentsModel {
    DepartmentsModel({
        required this.id,
        required this.namaDepartment,
        required this.pengurusDepartment,
        required this.stafAhli,
        required this.stafMuda,
        required this.kegiatanDepartment,
    });

    int id;
    String namaDepartment;
    List<PengurusDepartment> pengurusDepartment;
    int stafAhli;
    int stafMuda;
    List<KegiatanDepartment> kegiatanDepartment;

    factory DepartmentsModel.fromJson(Map<String, dynamic> json) => DepartmentsModel(
        id: json["id"],
        namaDepartment: json["nama_department"],
        pengurusDepartment: List<PengurusDepartment>.from(json["pengurus_department"].map((x) => PengurusDepartment.fromJson(x))),
        stafAhli: json["staf_ahli"],
        stafMuda: json["staf_muda"],
        kegiatanDepartment: List<KegiatanDepartment>.from(json["kegiatan_department"].map((x) => KegiatanDepartment.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama_department": namaDepartment,
        "pengurus_department": List<dynamic>.from(pengurusDepartment.map((x) => x.toJson())),
        "staf_ahli": stafAhli,
        "staf_muda": stafMuda,
        "kegiatan_department": List<dynamic>.from(kegiatanDepartment.map((x) => x.toJson())),
    };
}

class KegiatanDepartment {
    KegiatanDepartment({
        required this.namaKegiatan,
        required this.ketuaPelaksana,
        required this.progresKegiatan,
    });

    String namaKegiatan;
    String ketuaPelaksana;
    int progresKegiatan;

    factory KegiatanDepartment.fromJson(Map<String, dynamic> json) => KegiatanDepartment(
        namaKegiatan: json["nama_kegiatan"],
        ketuaPelaksana: json["ketua_pelaksana"],
        progresKegiatan: json["progres_kegiatan"],
    );

    Map<String, dynamic> toJson() => {
        "nama_kegiatan": namaKegiatan,
        "ketua_pelaksana": ketuaPelaksana,
        "progres_kegiatan": progresKegiatan,
    };
}

class PengurusDepartment {
    PengurusDepartment({
        required this.nama,
        required this.role,
    });

    String nama;
    String role;

    factory PengurusDepartment.fromJson(Map<String, dynamic> json) => PengurusDepartment(
        nama: json["nama"],
        role: json["role"],
    );

    Map<String, dynamic> toJson() => {
        "nama": nama,
        "role": role,
    };
}
