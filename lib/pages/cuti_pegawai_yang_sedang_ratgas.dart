import 'package:data_center_badilmiltun/model/user_ratgas.dart';
import 'package:data_center_badilmiltun/services/repository.dart';
import 'package:data_center_badilmiltun/utils/color_select.dart';
import 'package:flutter/material.dart';

class CutiPegawaiYangSedangRatgas extends StatefulWidget {
  const CutiPegawaiYangSedangRatgas({super.key});

  @override
  State<CutiPegawaiYangSedangRatgas> createState() =>
      _CutiPegawaiYangSedangRatgasState();
}

class _CutiPegawaiYangSedangRatgasState
    extends State<CutiPegawaiYangSedangRatgas> {
  List list_user_ratgas = [];
  Repository repository = Repository();

  getData() async {
    list_user_ratgas = await repository.getData();
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
          title: Text('Pegawai yang sedang ratgas'),
        ),
        body: ListView.builder(
          padding: EdgeInsets.all(15),
          itemCount: list_user_ratgas.length,
          itemBuilder: (context, index) => Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(bottom: 20),
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
                          list_user_ratgas[index].nama,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.fade,
                              color: ColorSelect.blue),
                        ),
                      ),
                      Flexible(
                        child: Text(
                            list_user_ratgas[index].tanggal_pelaksanaan_ratgas,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14, color: Colors.grey)),
                      ),
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue.shade50),
                          child: Text(list_user_ratgas[index].jenis_ratgas,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14, color: ColorSelect.blue)),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
