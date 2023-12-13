import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:data_center_badilmiltun/componen/card_shimmer.dart';
import 'package:data_center_badilmiltun/componen/no_data_widget.dart';
import 'package:data_center_badilmiltun/model/jadwal_rapat.dart';
import 'package:data_center_badilmiltun/model/user_ratgas.dart';
import 'package:data_center_badilmiltun/pages/jadwal_rapat_search.dart';
import 'package:data_center_badilmiltun/utils/color_select.dart';
import 'package:data_center_badilmiltun/utils/val_global.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../services/repository.dart';

class JadwalRapatPage extends StatefulWidget {
  const JadwalRapatPage({super.key});

  @override
  State<JadwalRapatPage> createState() => _JadwalRapatPageState();
}

class _JadwalRapatPageState extends State<JadwalRapatPage> {
  bool isDataReady = false;
  // List list_jadwal_terdekat = [];
  Repository repository = Repository();

  getData() async {
    VarGlobal.list_jadwal_rapat = await repository.getJadwalRapatSikoopat();
    // list_jadwal_rapat = list_jadwal_rapat.reversed.toList();
    // list_jadwal_terdekat =
    //     list_jadwal_rapat.sublist(list_jadwal_rapat.length - 3);
    // print('INI DATA FILTER : $list_jadwal_terdekat[0]');
  }

  @override
  void initState() {
    // getData();
    Future.delayed(
      Duration(seconds: 2),
      () {
        isDataReady = true;
        setState(() {});
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Jadwal rapat'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => JadwalRapatSearch(),
                      ));
                },
                icon: Icon(
                  Icons.search,
                  size: 28,
                )),
            IconButton(
                onPressed: () {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    animType: AnimType.rightSlide,
                    body: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Text(
                        //   'Rapat',
                        //   style: TextStyle(
                        //       color: Colors.blue, fontWeight: FontWeight.bold),
                        // ),
                        Text(
                          'Menampilkan beberapa rapat kedepan, untuk lebih lengkapnya silahkan kunjungi website',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.red.shade400),
                        ),
                        TextButton(
                            onPressed: () async {
                              const url =
                                  'https://sikoopat.djmt.id/dashboard/loginpage';
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            child: Text(
                              'SIKOOPAT',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ))
                      ],
                    ),
                    btnOkOnPress: () {},
                  ).show();
                },
                icon: Icon(Icons.info_outline_rounded))
          ],
        ),
        body: isDataReady == false
            ? CardShimmer()
            : VarGlobal.list_jadwal_rapat.isEmpty
                ? Center(
                    child: NoDataWidget(),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 20, bottom: 10),
                    itemCount: VarGlobal.list_jadwal_rapat.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.info,
                          animType: AnimType.rightSlide,
                          body: Column(
                            children: [
                              Text(
                                'Rapat',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                VarGlobal.list_jadwal_rapat[index].title,
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                'Tempat',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                VarGlobal.list_jadwal_rapat[index].tempat,
                              ),
                              Text(
                                'Tanggal',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                VarGlobal.list_jadwal_rapat[index].tanggal,
                              ),
                              Text(
                                'Pukul',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                VarGlobal.list_jadwal_rapat[index].pukul,
                              ),
                            ],
                          ),
                          btnOkOnPress: () {},
                        ).show();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(bottom: 20),
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
                            Flexible(
                              flex: 3,
                              child: Container(
                                  height: 85,
                                  width: 85,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.grey.shade100),
                                  child: Image.asset('assets/rapat.png')),
                            ),
                            Flexible(
                              flex: 1,
                              child: SizedBox(
                                width: 15,
                              ),
                            ),
                            Flexible(
                              flex: 8,
                              child: Container(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        VarGlobal
                                            .list_jadwal_rapat[index].title,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: ColorSelect.blue),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                          VarGlobal
                                              .list_jadwal_rapat[index].tanggal,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.all(7),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.blue.shade50),
                                        child: Text(
                                            VarGlobal
                                                .list_jadwal_rapat[index].pukul,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: ColorSelect.blue)),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ));
  }
}
