import 'package:data_center_badilmiltun/componen/card_shimmer.dart';
import 'package:data_center_badilmiltun/componen/carousel_banner.dart';
import 'package:data_center_badilmiltun/componen/menu_category.dart';
import 'package:data_center_badilmiltun/componen/rapat_terdekat.dart';
import 'package:data_center_badilmiltun/model/jadwal_rapat.dart';
import 'package:data_center_badilmiltun/services/repository.dart';
import 'package:data_center_badilmiltun/utils/color_select.dart';
import 'package:flutter/material.dart';
import '../componen/no_data_widget.dart';
import '../utils/val_global.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDataReady = false;
  Repository repository = Repository();

  getData() async {
    VarGlobal.list_jadwal_rapat = await repository.getJadwalRapatSikoopat();
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
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                  Color.fromARGB(255, 76, 168, 175),
                  ColorSelect.blue
                ])),
          ),
          title: Text('Home'),
          centerTitle: true,
        ),
        body: ListView(children: [
          CarouselBanner(),
          Padding(
            padding:
                const EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 10),
            child: Text(
              'Menu',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          MenuCategory(),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Rapat terdekat',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          isDataReady == false
              ? CardShimmer()
              : VarGlobal.list_jadwal_rapat.isEmpty
                  ? Center(
                      child: NoDataWidget(),
                    )
                  : Container(
                      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (context, index) => Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(bottom: 20),
                          height: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color:
                                        Colors.blue.shade300.withOpacity(0.2),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            VarGlobal.list_jadwal_rapat[index]
                                                .tanggal,
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
                                              VarGlobal.list_jadwal_rapat[index]
                                                  .pukul,
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
                      ))
        ]));
  }
}
