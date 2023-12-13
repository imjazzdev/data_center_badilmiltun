import 'dart:convert';

import 'package:data_center_badilmiltun/model/jadwal_rapat.dart';
import 'package:data_center_badilmiltun/model/pegawai_cuti.dart';
import 'package:data_center_badilmiltun/model/user_ratgas.dart';
import 'package:http/http.dart' as http;

class Repository {
  final _urlGetPegawaiCuti =
      'https://clone-eremis.djmt.id/pegawai/monitoring_cuti/get_pegawai_sedang_cuti';

  final _urlGetPegawaiRatgas =
      'https://clone-eremis.djmt.id/pegawai/ratgas/ratgas_all/get_pegawai_sedang_ratgas';

  // final _urlGetJadwalRapatSikoopat =
  //     'https://clone-sikoopat.djmt.id/dashboard/fullcalendar?start=2023-10-29T00%3A00%3A00%2B07%3A00&end=2023-12-10T00%3A00%3A00%2B07%3A00';

  final _urlGetJadwalRapatSikoopat =
      'https://clone-sikoopat.djmt.id/dashboard/fullcalendar_start_end';

  final _urlPostPengajuanCuti =
      'https://clone-eremis.djmt.id/pegawai/cuti/get_pegawai';

  final _urlLogin = 'http://restapi.adequateshop.com/api/AuthAccount/Login';

  final _urlLoginNew = 'https://clone-eremis.djmt.id/dashboard/login_app';

  Future getPegawaiSedangCuti() async {
    try {
      final response = await http.get(Uri.parse(_urlGetPegawaiCuti));
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
      final response = await http.get(Uri.parse(_urlGetPegawaiRatgas));
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
      final response = await http.get(Uri.parse(_urlGetJadwalRapatSikoopat));
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

  Future postPengajuanCuti() async {
    try {
      final response = await http.post(Uri.parse(_urlPostPengajuanCuti),
          body: {'id_user': '86', 'tanggal_pengajuan_cuti': '04-12-2023'});
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<http.Response> login(String email, String password) async {
    return http.post(Uri.parse(_urlLoginNew),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(
            <String, String>{'username': email, 'password': password}));
  }
}

getPegawaiRatgas() {}
