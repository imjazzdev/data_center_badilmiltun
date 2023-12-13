// To parse this JSON data, do
//

import 'dart:convert';

PengajuanCuti pengajuanCutiFromJson(String str) =>
    PengajuanCuti.fromJson(json.decode(str));

String pengajuanCutiToJson(PengajuanCuti data) => json.encode(data.toJson());

class PengajuanCuti {
  String idUser;
  String tanggalPengajuanCuti;
  String cutiNama;
  String cutiNip;
  String cutiJabatan;
  String cutiMasaKerja;
  String cutiUnitKerja;
  String jenisCuti;
  String alasanCuti;
  String lamaCuti;
  String ketLamaCuti;
  String mulaiCuti;
  String selesaiCuti;
  String alamatCuti;
  String idAtasan;
  String idPejabat;
  String idMengetahui;

  PengajuanCuti({
    required this.idUser,
    required this.tanggalPengajuanCuti,
    required this.cutiNama,
    required this.cutiNip,
    required this.cutiJabatan,
    required this.cutiMasaKerja,
    required this.cutiUnitKerja,
    required this.jenisCuti,
    required this.alasanCuti,
    required this.lamaCuti,
    required this.ketLamaCuti,
    required this.mulaiCuti,
    required this.selesaiCuti,
    required this.alamatCuti,
    required this.idAtasan,
    required this.idPejabat,
    required this.idMengetahui,
  });

  factory PengajuanCuti.fromJson(Map<String, dynamic> json) => PengajuanCuti(
        idUser: json["id_user"],
        tanggalPengajuanCuti: json["tanggal_pengajuan_cuti"],
        cutiNama: json["cuti_nama"],
        cutiNip: json["cuti_nip"],
        cutiJabatan: json["cuti_jabatan"],
        cutiMasaKerja: json["cuti_masa_kerja"],
        cutiUnitKerja: json["cuti_unit_kerja"],
        jenisCuti: json["jenis_cuti"],
        alasanCuti: json["alasan_cuti"],
        lamaCuti: json["lama_cuti"],
        ketLamaCuti: json["ket_lama_cuti"],
        mulaiCuti: json["mulai_cuti"],
        selesaiCuti: json["selesai_cuti"],
        alamatCuti: json["alamat_cuti"],
        idAtasan: json["id_atasan"],
        idPejabat: json["id_pejabat"],
        idMengetahui: json["id_mengetahui"],
      );

  Map<String, dynamic> toJson() => {
        "id_user": idUser,
        "tanggal_pengajuan_cuti": tanggalPengajuanCuti,
        "cuti_nama": cutiNama,
        "cuti_nip": cutiNip,
        "cuti_jabatan": cutiJabatan,
        "cuti_masa_kerja": cutiMasaKerja,
        "cuti_unit_kerja": cutiUnitKerja,
        "jenis_cuti": jenisCuti,
        "alasan_cuti": alasanCuti,
        "lama_cuti": lamaCuti,
        "ket_lama_cuti": ketLamaCuti,
        "mulai_cuti": mulaiCuti,
        "selesai_cuti": selesaiCuti,
        "alamat_cuti": alamatCuti,
        "id_atasan": idAtasan,
        "id_pejabat": idPejabat,
        "id_mengetahui": idMengetahui,
      };
}
