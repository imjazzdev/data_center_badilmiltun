import 'package:data_center_badilmiltun/model/jadwal_rapat.dart';
import 'package:data_center_badilmiltun/model/user_ratgas.dart';
import 'package:data_center_badilmiltun/utils/color_select.dart';
import 'package:flutter/material.dart';

import '../services/repository.dart';

class JadwalRapatPage extends StatefulWidget {
  const JadwalRapatPage({super.key});

  @override
  State<JadwalRapatPage> createState() => _JadwalRapatPageState();
}

class _JadwalRapatPageState extends State<JadwalRapatPage> {
  List<JadwalRapat> list_jadwal_rapat = [];
  Repository repository = Repository();

  getData() async {
    list_jadwal_rapat = await repository.getJawalRapatSikoopat();
  }

  @override
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
        title: const Text('Jadwal rapat'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: list_jadwal_rapat.length,
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(bottom: 15),
          height: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.blue.shade300.withOpacity(0.2),
                    blurRadius: 3,
                    offset: Offset(3, 3),
                    spreadRadius: 3)
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 85,
                width: 85,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.shade200),
                child: Icon(
                  Icons.person_2_rounded,
                  color: Colors.blue.shade200,
                  size: 70,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        list_jadwal_rapat[index].title,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.fade,
                            color: ColorSelect.blue),
                      ),
                    ),
                    Flexible(
                      child: Text(list_jadwal_rapat[index].tanggal,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14, color: Colors.grey)),
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue.shade50),
                        child: Text(list_jadwal_rapat[index].pukul,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14, color: ColorSelect.blue)),
                      ),
                    )
                  ],
                ),

                // child: Table(
                //   columnWidths: {
                //     0: const FixedColumnWidth(100.0),
                //     1: const FlexColumnWidth(),
                //   },
                //   children: [
                //     const TableRow(children: [
                //       Text('Nama',
                //           style: TextStyle(
                //             fontSize: 16,
                //           )),
                //       Text(list_jadwal_rapat[index].title,
                //           style: TextStyle(
                //             fontSize: 16,
                //           )),
                //     ]),
                //     const TableRow(children: [
                //       Text('Jabatan',
                //           style: TextStyle(
                //             fontSize: 16,
                //           )),
                //       Text('Pranata Komputer',
                //           style: TextStyle(
                //             fontSize: 16,
                //           )),
                //     ]),
                //     const TableRow(children: [
                //       Text('Unit kerja',
                //           style: TextStyle(
                //             fontSize: 16,
                //           )),
                //       Text('Sekretariat Ditjen Badilmiltun',
                //           style: TextStyle(
                //             fontSize: 16,
                //           )),
                //     ]),
                //     const TableRow(children: [
                //       Text('NIP',
                //           style: TextStyle(
                //             fontSize: 16,
                //           )),
                //       Text('08978676656',
                //           style: TextStyle(
                //             fontSize: 16,
                //           )),
                //     ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
