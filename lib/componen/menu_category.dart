import 'package:data_center_badilmiltun/pages/cuti.dart';
import 'package:data_center_badilmiltun/pages/jadwal_rapat.dart';
import 'package:data_center_badilmiltun/utils/color_select.dart';
import 'package:flutter/material.dart';

class MenuCategory extends StatelessWidget {
  const MenuCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.all(20),
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => JadwalRapatPage(),
                  ));
            },
            child: Container(
              width: 100,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: ColorSelect.blue.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 5,
                    offset: Offset(1, 1))
              ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
              margin: EdgeInsets.only(left: 20, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/rapat.png'),
                  Text(
                    'Jadwal\nRapat',
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CutiPage(),
                  ));
            },
            child: Container(
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: ColorSelect.blue.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 5,
                        offset: Offset(1, 1))
                  ]),
              margin: EdgeInsets.only(left: 20, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/cuti.png'),
                  Text(
                    'Pengajuan\nCuti',
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
