import 'dart:convert';

import 'package:data_center_badilmiltun/model/jadwal_rapat.dart';
import 'package:data_center_badilmiltun/model/pegawai_cuti.dart';
import 'package:data_center_badilmiltun/model/user_ratgas.dart';
import 'package:http/http.dart' as http;

class Repository {
  final urlGetPegawaiCuti =
      'https://clone-eremis.djmt.id/pegawai/monitoring_cuti/get_pegawai_sedang_cuti';

  final urlGetPegawaiRatgas =
      'https://clone-eremis.djmt.id/pegawai/ratgas/ratgas_all/get_pegawai_sedang_ratgas';

  final urlGetJadwalRapatSikoopat =
      'https://clone-sikoopat.djmt.id/dashboard/fullcalendar?start=2023-10-29T00%3A00%3A00%2B07%3A00&end=2023-12-10T00%3A00%3A00%2B07%3A00';

  Future getPegawaiSedangCuti() async {
    try {
      final response = await http.get(Uri.parse(urlGetPegawaiCuti));
      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body)['data'];
        print(jsonDecode(response.body)['data']);
        List<PegawaiCuti> pegawaiCuti =
            it.map((e) => PegawaiCuti.fromJson(e)).toList();
        return pegawaiCuti;
      }
    } catch (e) {
      print(e);
    }
  }

  Future getPegawaiRatgas() async {
    try {
      final response = await http.get(Uri.parse(urlGetPegawaiRatgas));
      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body)['data'];
        print(jsonDecode(response.body)['data']);
        List<UserRatgas> pegawaiRatgas =
            it.map((e) => UserRatgas.fromJson(e)).toList();
        return pegawaiRatgas;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future getJadwalRapatSikoopat() async {
    try {
      final response = await http.get(Uri.parse(urlGetJadwalRapatSikoopat));
      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        // print(jsonDecode(response.body));
        List<JadwalRapat> jadwalRapat = it
            .map((e) => JadwalRapat.fromJson(e))
            .toList()
            .sublist(it.length - 20);
        print(jadwalRapat);
        return jadwalRapat;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
