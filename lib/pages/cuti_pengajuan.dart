import 'package:data_center_badilmiltun/utils/color_select.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CutiPengajuanPage extends StatefulWidget {
  const CutiPengajuanPage({super.key});

  @override
  State<CutiPengajuanPage> createState() => _CutiPengajuanPageState();
}

class _CutiPengajuanPageState extends State<CutiPengajuanPage> {
  TextEditingController alasanCuti =
      TextEditingController(text: 'Keperluan keluarga');
  TextEditingController alamatSaatMenjalankanCuti =
      TextEditingController(text: 'Jakarta');
  TextEditingController lamaCuti = TextEditingController();

  String? valJenisCuti = 'CUTI TAHUNAN';
  List<String> jenis_cuti = [
    'CUTI TAHUNAN',
    'CUTI BESAR',
    'CUTI SAKIT',
    'CUTI MELAHIRKAN',
    'CUTI KARENA ALASAN PENTING'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jadwal cuti'),
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
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 1,
                  spreadRadius: 1,
                  color: ColorSelect.green.withOpacity(0.1))
            ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Table(
              columnWidths: {
                0: FixedColumnWidth(140.0),
                1: FlexColumnWidth(),
              },
              children: [
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text('Tgl Pengajuan Cuti',
                        style: TextStyle(
                          fontSize: 14,
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.only(left: 10),
                    alignment: Alignment.centerLeft,
                    height: 50,
                    decoration: BoxDecoration(border: Border.all()),
                    child: Text(DateFormat("dd-MM-yyyy").format(DateTime.now()),
                        style: TextStyle(
                          fontSize: 16,
                        )),
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
                        decoration: InputDecoration(border: InputBorder.none),
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
                      decoration: InputDecoration(border: InputBorder.none),
                      controller: alamatSaatMenjalankanCuti,
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
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
