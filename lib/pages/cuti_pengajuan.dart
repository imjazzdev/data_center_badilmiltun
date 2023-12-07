import 'package:data_center_badilmiltun/services/repository.dart';
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

  String? valAtasanLangsung =
      'Jefri Ardianto, S.T., M.M. (Kabag Organisasi dan Tata Laksana Sekretariat)';
  List<String> atasan_langsung = [
    'Jefri Ardianto, S.T., M.M. (Kabag Organisasi dan Tata Laksana Sekretariat)',
  ];

  String? valPejabatBerwenang =
      'Jefri Ardianto, S.T., M.M. (Kabag Organisasi dan Tata Laksana Sekretariat)';
  List<String> pejabat_berwenang = [
    'Jefri Ardianto, S.T., M.M. (Kabag Organisasi dan Tata Laksana Sekretariat)',
  ];

  DateTime? _dateTime;

  Repository repository = Repository();

  getPost() async {
    bool response = await repository.postPengajuanCuti();
  }

  @override
  void initState() {
    getPost();
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
                        child: Text(
                            DateFormat("dd-MM-yyyy").format(DateTime.now()),
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
                              child: InkWell(
                                onTap: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2099),
                                  ).then((date) {
                                    //tambahkan setState dan panggil variabel _dateTime.
                                    setState(() {
                                      _dateTime = date;
                                    });
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(left: 10),
                                  height: 50,
                                  decoration:
                                      BoxDecoration(border: Border.all()),
                                  child: Text(_dateTime.toString()),
                                ),
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
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          padding: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(border: Border.all()),
                          child: DropdownButton(
                            hint: Text("Select Status"),
                            underline: SizedBox(),
                            isExpanded: true,
                            value: valAtasanLangsung,
                            items: atasan_langsung.map((value) {
                              return DropdownMenuItem(
                                child: Text(
                                  value,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                value: value,
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                valAtasanLangsung = value;
                              });
                            },
                          ),
                        ),
                      )
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text('Pejabat yang berwenang'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          padding: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(border: Border.all()),
                          child: DropdownButton(
                            hint: Text(
                              "Select Status",
                            ),
                            underline: SizedBox(),
                            isExpanded: true,
                            value: valPejabatBerwenang,
                            items: pejabat_berwenang.map((value) {
                              return DropdownMenuItem(
                                child: Text(
                                  value,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                value: value,
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                valPejabatBerwenang = value;
                              });
                            },
                          ),
                        ),
                      )
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
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.check),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Save',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              )),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
