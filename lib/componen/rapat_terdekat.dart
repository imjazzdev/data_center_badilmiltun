import 'package:data_center_badilmiltun/utils/color_select.dart';
import 'package:flutter/material.dart';

class RapatTerdekat extends StatelessWidget {
  final String title, tempat, tanggal, pukul;

  RapatTerdekat({
    required this.title,
    required this.tempat,
    required this.tanggal,
    required this.pukul,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.maxFinite,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: ColorSelect.blue.withOpacity(0.3),
                offset: Offset(2, 2),
                blurRadius: 10)
          ]),
      child: Row(
        children: [
          Image.asset('assets/discuss.png'),
          SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800),
              ),
              Text(pukul,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold)),
              Container(
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue.shade50),
                child: Text(pukul,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: ColorSelect.blue)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
