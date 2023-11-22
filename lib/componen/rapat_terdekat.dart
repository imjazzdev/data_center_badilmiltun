import 'package:data_center_badilmiltun/utils/color_select.dart';
import 'package:flutter/material.dart';

class RapatTerdekat extends StatelessWidget {
  const RapatTerdekat({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: ColorSelect.blue)
          // boxShadow: [
          //   BoxShadow(
          //       color: ColorSelect.blue.withOpacity(0.2),
          //       offset: Offset(3, 3),
          //       blurRadius: 5)
          // ]
          ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/discuss.png'),
          Text(
            'Rapat Evaluasi',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade800),
          ),
          Text(
            '13.00 - 15.00',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
