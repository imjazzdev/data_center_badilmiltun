import 'dart:convert';

PengajuanCutiUser pengajuanCutiUserFromJson(String str) =>
    PengajuanCutiUser.fromJson(json.decode(str));

String pengajuanCutiUserToJson(PengajuanCutiUser data) =>
    json.encode(data.toJson());

class PengajuanCutiUser {
  Data data;

  PengajuanCutiUser({
    required this.data,
  });
  factory PengajuanCutiUser.fromJson(dynamic json) {
    if (json is String) {
      final Map<String, dynamic> jsonData = jsonDecode(json);
      return PengajuanCutiUser(data: Data.fromJson(jsonData['data']));
    } else if (json is Map<String, dynamic>) {
      return PengajuanCutiUser(data: Data.fromJson(json['data']));
    } else {
      throw ArgumentError('Invalid JSON format');
    }
  }
  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Pegawai pegawai;
  String masaKerja;
  String atasan;
  String pejabat;
  String mengetahui;
  String alamatCuti;

  Data({
    required this.pegawai,
    required this.masaKerja,
    required this.atasan,
    required this.pejabat,
    required this.mengetahui,
    required this.alamatCuti,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        pegawai: Pegawai.fromJson(json["pegawai"]),
        masaKerja: json["masa_kerja"],
        atasan: json["atasan"],
        pejabat: json["pejabat"],
        mengetahui: json["mengetahui"],
        alamatCuti: json["alamat_cuti"],
      );

  Map<String, dynamic> toJson() => {
        "pegawai": pegawai.toJson(),
        "masa_kerja": masaKerja,
        "atasan": atasan,
        "pejabat": pejabat,
        "mengetahui": mengetahui,
        "alamat_cuti": alamatCuti,
      };
}

class Pegawai {
  String idUser;
  String username;
  String pass;
  String nama;
  String namaTanpaGelar;
  String levelUser;
  String atasan;
  String nip;
  String idJabatan;
  String pangkat;
  String golongan;
  String golonganPenyetaraan;
  String email;
  String status;
  DateTime wLogin;
  String photo;
  String nohp;
  String jenisKelamin;
  String asalSatker;
  String asalSatkerProvinsi;
  String asalSatkerKota;
  dynamic notActive;
  String isRealUser;
  DateTime createdAt;
  DateTime updatedAt;
  String superadmin;
  dynamic deletedAt;
  String namaJabatan;
  String grupJabatan;
  String formatAgenda;
  String unitKerja;
  String unitKerjaLong;

  Pegawai({
    required this.idUser,
    required this.username,
    required this.pass,
    required this.nama,
    required this.namaTanpaGelar,
    required this.levelUser,
    required this.atasan,
    required this.nip,
    required this.idJabatan,
    required this.pangkat,
    required this.golongan,
    required this.golonganPenyetaraan,
    required this.email,
    required this.status,
    required this.wLogin,
    required this.photo,
    required this.nohp,
    required this.jenisKelamin,
    required this.asalSatker,
    required this.asalSatkerProvinsi,
    required this.asalSatkerKota,
    required this.notActive,
    required this.isRealUser,
    required this.createdAt,
    required this.updatedAt,
    required this.superadmin,
    required this.deletedAt,
    required this.namaJabatan,
    required this.grupJabatan,
    required this.formatAgenda,
    required this.unitKerja,
    required this.unitKerjaLong,
  });

  factory Pegawai.fromJson(Map<String, dynamic> json) => Pegawai(
        idUser: json["id_user"],
        username: json["username"],
        pass: json["pass"],
        nama: json["nama"],
        namaTanpaGelar: json["nama_tanpa_gelar"],
        levelUser: json["level_user"],
        atasan: json["atasan"],
        nip: json["nip"],
        idJabatan: json["id_jabatan"],
        pangkat: json["pangkat"],
        golongan: json["golongan"],
        golonganPenyetaraan: json["golongan_penyetaraan"],
        email: json["email"],
        status: json["status"],
        wLogin: DateTime.parse(json["w_login"]),
        photo: json["photo"],
        nohp: json["nohp"],
        jenisKelamin: json["jenis_kelamin"],
        asalSatker: json["asal_satker"],
        asalSatkerProvinsi: json["asal_satker_provinsi"],
        asalSatkerKota: json["asal_satker_kota"],
        notActive: json["not_active"],
        isRealUser: json["is_real_user"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        superadmin: json["superadmin"],
        deletedAt: json["deleted_at"],
        namaJabatan: json["nama_jabatan"],
        grupJabatan: json["grup_jabatan"],
        formatAgenda: json["format_agenda"],
        unitKerja: json["unit_kerja"],
        unitKerjaLong: json["unit_kerja_long"],
      );

  Map<String, dynamic> toJson() => {
        "id_user": idUser,
        "username": username,
        "pass": pass,
        "nama": nama,
        "nama_tanpa_gelar": namaTanpaGelar,
        "level_user": levelUser,
        "atasan": atasan,
        "nip": nip,
        "id_jabatan": idJabatan,
        "pangkat": pangkat,
        "golongan": golongan,
        "golongan_penyetaraan": golonganPenyetaraan,
        "email": email,
        "status": status,
        "w_login": wLogin.toIso8601String(),
        "photo": photo,
        "nohp": nohp,
        "jenis_kelamin": jenisKelamin,
        "asal_satker": asalSatker,
        "asal_satker_provinsi": asalSatkerProvinsi,
        "asal_satker_kota": asalSatkerKota,
        "not_active": notActive,
        "is_real_user": isRealUser,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "superadmin": superadmin,
        "deleted_at": deletedAt,
        "nama_jabatan": namaJabatan,
        "grup_jabatan": grupJabatan,
        "format_agenda": formatAgenda,
        "unit_kerja": unitKerja,
        "unit_kerja_long": unitKerjaLong,
      };
}
