import 'package:data_center_badilmiltun/utils/color_select.dart';
import 'package:flutter/material.dart';

class JadwalCutiPage extends StatefulWidget {
  const JadwalCutiPage({super.key});

  @override
  State<JadwalCutiPage> createState() => _JadwalCutiPageState();
}

class _JadwalCutiPageState extends State<JadwalCutiPage> {
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
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: TextField(),
                  )
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
                  Text('Sekretariat Ditjen Badilmiltun'),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text('Tanggal Cuti'),
                  ),
                  Text('08978676656'),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text('Lama Cuti'),
                  ),
                  Text('Pranata Komputer'),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text('Alamat Saat Menjalankan Cuti'),
                  ),
                  Text('Sekretariat Ditjen Badilmiltun'),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
