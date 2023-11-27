import 'dart:convert';

import 'package:data_center_badilmiltun/model/jadwal_rapat.dart';
import 'package:data_center_badilmiltun/model/user_ratgas.dart';
import 'package:http/http.dart' as http;

class Repository {
  final urlGetPegawaiRatgas =
      'https://clone-eremis.djmt.id/pegawai/ratgas/ratgas_all/get_pegawai_sedang_ratgas';

  final urlGetJadwalRapatSikoopat =
      'https://clone-sikoopat.djmt.id/dashboard/fullcalendar?start=2023-10-29T00%3A00%3A00%2B07%3A00&end=2023-12-10T00%3A00%3A00%2B07%3A00';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(urlGetPegawaiRatgas));
      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body)['data'];
        print(jsonDecode(response.body)['data']);
        List<UserRatgas> userRatgas =
            it.map((e) => UserRatgas.fromJson(e)).toList();
        return userRatgas;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future getJawalRapatSikoopat() async {
    try {
      final response = await http.get(Uri.parse(urlGetJadwalRapatSikoopat));
      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body)[6]['500'];
        print(jsonDecode(response.body));
        List<JadwalRapat> jadwalRapat =
            it.map((e) => JadwalRapat.fromJson(e)).toList();
        return jadwalRapat;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
