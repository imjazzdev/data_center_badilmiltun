import 'dart:async';
import 'dart:convert';

import 'package:data_center_badilmiltun/model/pengajuan_cuti.dart';
import 'package:data_center_badilmiltun/model/pengajuan_cuti_user.dart';
import 'package:data_center_badilmiltun/services/repository.dart';

import 'package:data_center_badilmiltun/utils/color_select.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../utils/val_global.dart';

class CutiPengajuanPage extends StatefulWidget {
  const CutiPengajuanPage({Key? key}) : super(key: key);

  @override
  State<CutiPengajuanPage> createState() => _CutiPengajuanPageState();
}

Future<PengajuanCuti> submitData(
    String id_user,
    String tanggal_pengajuan_cuti,
    String cuti_nama,
    String cuti_nip,
    String cuti_jabatan,
    String cuti_masa_kerja,
    String cuti_unit_kerja,
    String jenis_cuti,
    String alasan_cuti,
    String lama_cuti,
    String ket_lama_cuti,
    String mulai_cuti,
    String selesai_cuti,
    String alamat_cuti,
    String id_atasan,
    String id_pejabat,
    String id_mengetahui) async {
  var response = await http.post(
    Uri.https('clone-eremis.djmt.id', '/pegawai/cuti/tambah_data'),
    body: {
      "id_user": id_user,
      "tanggal_pengajuan_cuti": tanggal_pengajuan_cuti,
      "cuti_nama": cuti_nama,
      "cuti_nip": cuti_nip,
      "cuti_jabatan": cuti_jabatan,
      "cuti_masa_kerja": cuti_masa_kerja,
      "cuti_unit_kerja": cuti_unit_kerja,
      "jenis_cuti": jenis_cuti,
      "alasan_cuti": alasan_cuti,
      "lama_cuti": lama_cuti,
      "ket_lama_cuti": ket_lama_cuti,
      "mulai_cuti": mulai_cuti,
      "selesai_cuti": selesai_cuti,
      "alamat_cuti": alamat_cuti,
      "id_atasan": id_atasan,
      "id_pejabat": id_pejabat,
      "id_mengetahui": id_mengetahui
    },
  );

  // var response = await http.post(
  //     Uri.https('https://clone-eremis.djmt.id/pegawai/cuti/tambah'),
  // body: {""});
  // var data = response.body;

  VarGlobal.pesanSnackBar = jsonDecode(response.body)['message'];
  // print('PRINT MASSAGE : ${data}');

  if (response.statusCode == 200) {
    String responseString = response.body;
    print(responseString);
    return pengajuanCutiFromJson(responseString);
  } else {
    return null!;
  }
}

class _CutiPengajuanPageState extends State<CutiPengajuanPage> {
  late PengajuanCuti _dataModel;
  TextEditingController alasanCuti =
      TextEditingController(text: 'Keperluan keluarga');
  TextEditingController alamatSaatMenjalankanCuti =
      TextEditingController(text: 'Jakarta');
  TextEditingController lamaCuti = TextEditingController();
  TextEditingController tglPengajuanCuti = TextEditingController();
  TextEditingController atasanLangsung = TextEditingController();
  TextEditingController pejabatBerwenang = TextEditingController();

  String? valJenisCuti = 'CUTI TAHUNAN';
  List<String> jenis_cuti = [
    'CUTI TAHUNAN',
    'CUTI BESAR',
    'CUTI SAKIT',
    'CUTI MELAHIRKAN',
    'CUTI KARENA ALASAN PENTING'
  ];
  DateTime _dateMulai = DateTime.now();
  DateTime _dateSelesai = DateTime.now();
  DateTime _dateTime = DateTime.now();
  void _showDate() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1),
            lastDate: DateTime(2050))
        .then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }

  void _showDateMulai() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2050))
        .then((value) {
      setState(() {
        _dateMulai = value!;
      });
    });
  }

  void _showDateSelesai() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2050))
        .then((value) {
      setState(() {
        _dateSelesai = value!;
      });
    });
  }

  List<PengajuanCutiUser> pengajuan_cuti_user = [];
  Repository repository = Repository();

  getData() async {
    pengajuan_cuti_user = (await repository.submitData1(
        "id_user", "tanggal_pengajuan_cuti")) as List<PengajuanCutiUser>;
  }

  void initState() {
    getData();
    // Future.delayed(
    //   Duration(seconds: 2),
    //   () {
    //     setState(() {});
    //   },
    // );
    setState(() {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengajuan cuti'),
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 1,
                  spreadRadius: 1,
                  color: ColorSelect.green.withOpacity(0.1))
            ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                Text(
                  'Data Pegawai',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Table(
                  columnWidths: {
                    0: FixedColumnWidth(100.0),
                    1: FlexColumnWidth(),
                  },
                  children: [
                    TableRow(children: [
                      Text('Nama',
                          style: TextStyle(
                            fontSize: 16,
                          )),
                      Text('Theo Alfianto, S.T',
                          style: TextStyle(
                            fontSize: 16,
                          )),
                    ]),
                    TableRow(children: [
                      Text('Jabatan',
                          style: TextStyle(
                            fontSize: 16,
                          )),
                      Text('Pranata Komputer',
                          style: TextStyle(
                            fontSize: 16,
                          )),
                    ]),
                    TableRow(children: [
                      Text('Unit kerja',
                          style: TextStyle(
                            fontSize: 16,
                          )),
                      Text('Sekretariat Ditjen Badilmiltun',
                          style: TextStyle(
                            fontSize: 16,
                          )),
                    ]),
                    TableRow(children: [
                      Text('NIP',
                          style: TextStyle(
                            fontSize: 16,
                          )),
                      Text('08978676656',
                          style: TextStyle(
                            fontSize: 16,
                          )),
                    ]),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 1,
                  spreadRadius: 1,
                  color: ColorSelect.green.withOpacity(0.1))
            ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Table(
                  columnWidths: {
                    0: FixedColumnWidth(140.0),
                    1: FlexColumnWidth(),
                  },
                  children: [
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text('Tgl Pengajuan Cuti'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          padding: EdgeInsets.only(left: 10),
                          height: 50,
                          decoration: BoxDecoration(border: Border.all()),
                          child: MaterialButton(
                            onPressed: _showDate,
                            child: Text(
                              DateFormat('dd-MM-yyyy')
                                  .format(_dateTime)
                                  .toString(),
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text('Jenis Cuti'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          padding: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(border: Border.all()),
                          child: DropdownButton(
                            hint: Text("Select Status"),
                            underline: SizedBox(),
                            isExpanded: true,
                            value: valJenisCuti,
                            items: jenis_cuti.map((value) {
                              return DropdownMenuItem(
                                child: Text(value),
                                value: value,
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                valJenisCuti = value;
                              });
                            },
                          ),
                        ),
                      )
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text('Alasan Cuti'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          padding: EdgeInsets.only(left: 10),
                          height: 50,
                          decoration: BoxDecoration(border: Border.all()),
                          child: TextField(
                            decoration:
                                InputDecoration(border: InputBorder.none),
                            controller: alasanCuti,
                          ),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text('Tanggal Cuti'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                child: MaterialButton(
                                  onPressed: _showDateMulai,
                                  child: Text(
                                    DateFormat('dd-MM-yyyy')
                                        .format(_dateMulai)
                                        .toString(),
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                                padding: EdgeInsets.only(left: 10),
                                height: 50,
                                decoration: BoxDecoration(border: Border.all()),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                'sd',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                child: MaterialButton(
                                  onPressed: _showDateSelesai,
                                  child: Text(
                                    DateFormat('dd-MM-yyyy')
                                        .format(_dateSelesai)
                                        .toString(),
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                                padding: EdgeInsets.only(left: 10),
                                height: 50,
                                decoration: BoxDecoration(border: Border.all()),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text('Lama Cuti'),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        padding: EdgeInsets.only(left: 10),
                        height: 50,
                        decoration: BoxDecoration(border: Border.all()),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "jumlah hari"),
                          controller: lamaCuti,
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text('Alamat Saat Menjalankan Cuti'),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        padding: EdgeInsets.only(left: 10),
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: TextField(
                          decoration: InputDecoration(border: InputBorder.none),
                          controller: alamatSaatMenjalankanCuti,
                        ),
                      ),
                    ]),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.fromBorderSide(BorderSide(
                            width: 0.5, color: Colors.grey.shade300))),
                  ),
                ),
                Text(
                  'Data atasan',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Table(
                  columnWidths: {
                    0: FixedColumnWidth(140.0),
                    1: FlexColumnWidth(),
                  },
                  children: [
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text('Atasan Lansung'),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        padding: EdgeInsets.only(left: 10),
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: TextField(
                          decoration: InputDecoration(border: InputBorder.none),
                          controller: atasanLangsung,
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text('Pejabat yang berwenang'),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        padding: EdgeInsets.only(left: 10),
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: TextField(
                          decoration: InputDecoration(border: InputBorder.none),
                          controller: pejabatBerwenang,
                        ),
                      ),
                    ]),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            child: Text('SAVE'),
            onPressed: () async {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(VarGlobal.pesanSnackBar),
                action: SnackBarAction(
                  label: 'oke',
                  onPressed: () {
                    // Code to execute.
                  },
                ),
              ));
              String id_user = "100";
              String tanggal_pengajuan_cuti =
                  DateFormat('dd-MM-yyyy').format(_dateTime).toString();
              String cuti_nama = "as";
              String cuti_nip = "08978676656";
              String cuti_jabatan = "tes";
              String cuti_masa_kerja = "1";
              String cuti_unit_kerja = "sa";
              String jenis_cuti = "CUTI TAHUNAN";
              String alasan_cuti = alasanCuti.text;
              String lama_cuti = lamaCuti.text;
              String ket_lama_cuti = "2";
              String mulai_cuti =
                  DateFormat('dd-MM-yyyy').format(_dateMulai).toString();
              String selesai_cuti =
                  DateFormat('dd-MM-yyyy').format(_dateSelesai).toString();
              String alamat_cuti = alamatSaatMenjalankanCuti.text;
              String id_atasan = atasanLangsung.text;
              String id_pejabat = pejabatBerwenang.text;
              String id_mengetahui = "2";

              PengajuanCuti? data = await submitData(
                  id_user,
                  tanggal_pengajuan_cuti,
                  cuti_nama,
                  cuti_nip,
                  cuti_jabatan,
                  cuti_masa_kerja,
                  cuti_unit_kerja,
                  jenis_cuti,
                  alasan_cuti,
                  lama_cuti,
                  ket_lama_cuti,
                  mulai_cuti,
                  selesai_cuti,
                  alamat_cuti,
                  id_atasan,
                  id_pejabat,
                  id_mengetahui);

              setState(() {
                _dataModel = data!;
              });
            },
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
