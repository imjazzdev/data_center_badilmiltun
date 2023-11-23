import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpServices {
  String? nama, jabatan, unit_kerja, nip;

  HttpServices({this.nama, this.jabatan, this.unit_kerja, this.nip});

  static Future<HttpServices> connectApi(String name, job) async {
    Uri url = Uri.parse('https://reqres.in/api/users/2');

    var hasilRespon = await http.post(url, body: {
      'name': name,
      'job': job,
    });

    var data = json.decode(hasilRespon.body);

    return HttpServices(
        nama: data['id'],
        jabatan: data['name'],
        unit_kerja: data['job'],
        nip: data['createdAt']);
  }
}
