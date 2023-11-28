import 'package:flutter/material.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/empty-box.png',
            height: 200,
            width: 200,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Tidak ada data',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          )
        ],
      ),
    );
  }
}
