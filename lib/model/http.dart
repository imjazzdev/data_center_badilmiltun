import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpServices {
  String? nama, tanggal_cuti, jenis_cuti, alasan_cuti;

  HttpServices(
      {this.nama, this.tanggal_cuti, this.jenis_cuti, this.alasan_cuti});

  static Future<HttpServices> connectApiPegawaiSedangCuti() async {
    Uri url = Uri.parse(
        'https://clone-eremis.djmt.id/pegawai/monitoring_cuti/get_pegawai_sedang_cuti');

    var hasilRespone = await http.get(url);

    var data = json.decode(hasilRespone.body)['data'][0];

    return HttpServices(
        nama: data['nama'].toString(),
        tanggal_cuti: data['tanggal_cuti'],
        jenis_cuti: data['jenis_cuti'],
        alasan_cuti: data['alasan_cuti']);
  }
}

class APIPegawaiSedangRatgas {
  String? nama, tanggal_pelaksanaan_ratgas, jenis_ratgas, isi_ratgas;

  APIPegawaiSedangRatgas(
      {this.nama,
      this.tanggal_pelaksanaan_ratgas,
      this.jenis_ratgas,
      this.isi_ratgas});

  static Future<APIPegawaiSedangRatgas> connectApiPegawaiSedangRatgas() async {
    Uri url = Uri.parse(
        'https://clone-eremis.djmt.id/pegawai/ratgas/ratgas_all/get_pegawai_sedang_ratgas');

    var hasilRespone = await http.get(url);

    var data = json.decode(hasilRespone.body)['data'][0];

    return APIPegawaiSedangRatgas(
        nama: data['nama'].toString(),
        tanggal_pelaksanaan_ratgas: data['tanggal_pelaksanaan_ratgas'],
        jenis_ratgas: data['jenis_ratgas'],
        isi_ratgas: data['isi_ratgas']);
  }
}
