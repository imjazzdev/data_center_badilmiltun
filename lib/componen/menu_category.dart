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
          Container(
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
          Container(
            margin: EdgeInsets.only(left: 20, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/cuti.png'),
                Text(
                  'Jadwal\nCuti',
                  textAlign: TextAlign.center,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
