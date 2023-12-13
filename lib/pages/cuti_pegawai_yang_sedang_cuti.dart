import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:data_center_badilmiltun/componen/card_shimmer.dart';
import 'package:data_center_badilmiltun/componen/no_data_widget.dart';
import 'package:data_center_badilmiltun/model/pegawai_cuti.dart';
import 'package:flutter/material.dart';

import '../services/repository.dart';
import '../utils/color_select.dart';

class CutiPegawaiYangSedangCuti extends StatefulWidget {
  @override
  State<CutiPegawaiYangSedangCuti> createState() =>
      _CutiPegawaiYangSedangCutiState();
}

class _CutiPegawaiYangSedangCutiState extends State<CutiPegawaiYangSedangCuti> {
  bool isDataReady = false;
  List list_pegawai_cuti = [];
  Repository repository = Repository();

  getData() async {
    list_pegawai_cuti = await repository.getPegawaiSedangCuti();
  }

  @override
  void initState() {
    getData();
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
          title: Text('Pegawai yang sedang cuti'),
        ),
        body: isDataReady == false
            ? CardShimmer()
            : ListView.builder(
                padding: EdgeInsets.all(15),
                itemCount: list_pegawai_cuti.length,
                itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.info,
                          animType: AnimType.rightSlide,
                          body: Column(
                            children: [
                              Container(
                                height: 120,
                                width: 120,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    'https://clone-eremis.djmt.id/assets/upload/profile/${list_pegawai_cuti[index].photo}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text(
                                'Nama',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                list_pegawai_cuti[index].nama,
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                'Tanggal',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                list_pegawai_cuti[index].tanggal_cuti,
                              ),
                              Text(
                                'Jenis Cuti',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                list_pegawai_cuti[index].jenis_cuti,
                              ),
                              Text(
                                'Alasan Cuti',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                list_pegawai_cuti[index].alasan_cuti,
                              ),
                            ],
                          ),
                          btnOkOnPress: () {},
                        ).show();
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
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
                              height: 90,
                              width: 90,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  'https://clone-eremis.djmt.id/assets/upload/profile/${list_pegawai_cuti[index].photo}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  list_pegawai_cuti[index].nama,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue),
                                ),
                                Text(list_pegawai_cuti[index].tanggal_cuti,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey)),
                                Container(
                                  padding: EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.blue.shade50),
                                  child: Text(
                                      list_pegawai_cuti[index].jenis_cuti,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: ColorSelect.blue)),
                                ),
                                // Text(list_pegawai_cuti[index].alasan_cuti,
                                //     textAlign: TextAlign.center,
                                //     style:
                                //         TextStyle(fontSize: 14, color: Colors.grey))
                              ],
                            )
                          ],
                        ),
                      ),
                    ))
        // : NoDataWidget(),
        );
  }
}
