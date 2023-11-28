import 'package:data_center_badilmiltun/componen/carousel_banner.dart';
import 'package:data_center_badilmiltun/componen/menu_category.dart';
import 'package:data_center_badilmiltun/componen/rapat_terdekat.dart';
import 'package:data_center_badilmiltun/services/repository.dart';
import 'package:data_center_badilmiltun/utils/color_select.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List list_jadwal_rapat = [];
  // Repository repository = Repository();

  // getData() async {
  //   list_jadwal_rapat = await repository.getJadwalRapatSikoopat();
  // }

  // @override
  // void initState() {
  //   getData();
  //   Future.delayed(
  //     Duration(seconds: 1),
  //     () {
  //       setState(() {});
  //     },
  //   );

  //   super.initState();
  // }

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
      body: ListView(
        children: [
          CarouselBanner(),
          Padding(
            padding: const EdgeInsets.all(15.0),
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
          // Container(
          //     height: 400,
          //     margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          //     child: Column(
          //       children: [
          //         RapatTerdekat(
          //           title: list_jadwal_rapat[0].pukul,
          //           tanggal: list_jadwal_rapat[0].tanggal,
          //           pukul: list_jadwal_rapat[0].pukul,
          //           tempat: list_jadwal_rapat[0].tempat,
          //         ),
          //         // SizedBox(
          //         //   width: 20,
          //         // ),
          //         // RapatTerdekat(),
          //       ],
          //     ))
        ],
      ),
    );
  }
}
