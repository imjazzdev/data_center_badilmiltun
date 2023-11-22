import 'package:data_center_badilmiltun/componen/carousel_banner.dart';
import 'package:data_center_badilmiltun/componen/menu_category.dart';
import 'package:data_center_badilmiltun/componen/rapat_terdekat.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          CarouselBanner(),
          // Container(
          //   height: 200,
          //   color: Colors.amber,
          // ),

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
          Container(
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              height: 190,
              child: Row(
                children: [
                  Expanded(child: RapatTerdekat()),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(child: RapatTerdekat()),
                ],
              ))
        ],
      ),
    );
  }
}
