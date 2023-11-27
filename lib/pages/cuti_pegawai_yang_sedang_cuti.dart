import 'package:data_center_badilmiltun/model/http.dart';
import 'package:flutter/material.dart';

class CutiPegawaiYangSedangCuti extends StatefulWidget {
  @override
  State<CutiPegawaiYangSedangCuti> createState() =>
      _CutiPegawaiYangSedangCutiState();
}

class _CutiPegawaiYangSedangCutiState extends State<CutiPegawaiYangSedangCuti> {
  HttpServices dataResponse = HttpServices();

  @override
  void initState() {
    HttpServices.connectApiPegawaiSedangCuti().then((value) {
      setState(() {
        dataResponse = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pegawai yang sedang cuti'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(15),
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.red),
                  color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.shade200),
                    child: Icon(
                      Icons.person_2_rounded,
                      color: Colors.blue.shade300,
                      size: 60,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (dataResponse.nama == null)
                            ? 'Belum ada data'
                            : dataResponse.nama.toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                          (dataResponse.tanggal_cuti == null)
                              ? 'Belum ada data'
                              : dataResponse.tanggal_cuti.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14, color: Colors.grey)),
                      Text(
                          (dataResponse.jenis_cuti == null)
                              ? 'Belum ada data'
                              : dataResponse.jenis_cuti.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14, color: Colors.grey)),
                      Text(
                          (dataResponse.alasan_cuti == null)
                              ? 'Belum ada data'
                              : dataResponse.alasan_cuti.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14, color: Colors.grey))
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
