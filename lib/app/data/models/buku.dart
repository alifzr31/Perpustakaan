// To parse this JSON data, do
//
//     final buku = bukuFromJson(jsonString);

import 'dart:convert';

Buku bukuFromJson(String str) => Buku.fromJson(json.decode(str));

String bukuToJson(Buku data) => json.encode(data.toJson());

List<Buku> listBukuFromJson(String str) =>
    List<Buku>.from(json.decode(str).map((x) => Buku.fromJson(x)));

String listBukuToJson(List<Buku> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Buku {
    int? id;
    String? judul;
    String? tahunTerbit;
    String? pengarang;
    String? penerbit;
    DateTime? createdAt;
    DateTime? updatedAt;

    Buku({
        this.id,
        this.judul,
        this.tahunTerbit,
        this.pengarang,
        this.penerbit,
        this.createdAt,
        this.updatedAt,
    });

    factory Buku.fromJson(Map<String, dynamic> json) => Buku(
        id: json["id"],
        judul: json["judul"],
        tahunTerbit: json["tahun_terbit"],
        pengarang: json["pengarang"],
        penerbit: json["penerbit"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "judul": judul,
        "tahun_terbit": tahunTerbit,
        "pengarang": pengarang,
        "penerbit": penerbit,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
