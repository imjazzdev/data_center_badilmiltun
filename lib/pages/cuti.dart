import 'package:data_center_badilmiltun/model/http.dart';
import 'package:data_center_badilmiltun/pages/cuti_pegawai_yang_sedang_cuti.dart';
import 'package:data_center_badilmiltun/pages/cuti_pegawai_yang_sedang_ratgas.dart';
import 'package:data_center_badilmiltun/pages/cuti_pengajuan.dart';
import 'package:flutter/material.dart';

class CutiPage extends StatefulWidget {
  const CutiPage({super.key});

  @override
  State<CutiPage> createState() => _CutiPageState();
}

class _CutiPageState extends State<CutiPage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cuti'),
        ),
        body: ListView(
          children: [
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CutiPengajuanPage(),
                    ));
              },
              title: Text('Pengajuan cuti'),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CutiPegawaiYangSedangCuti(),
                    ));
              },
              title: Text('Pegawai yang sedang cuti'),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CutiPegawaiYangSedangRatgas(),
                    ));
              },
              title: Text('Pegawai yang sedang ratgas'),
            ),
          ],
        ));
  }
}
