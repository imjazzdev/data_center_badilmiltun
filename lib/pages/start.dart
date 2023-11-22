import 'package:data_center_badilmiltun/pages/login.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Flexible(
            child: Image(
          height: double.maxFinite,
          width: double.maxFinite,
          image: AssetImage(
            'assets/bg.jpg',
          ),
          fit: BoxFit.cover,
        )),
        Positioned(
          bottom: 10,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 168, 250, 170),
            ),
            height: 180,
            width: 300,
            margin: EdgeInsets.only(right: 40, left: 50),
            child: Container(
              padding: EdgeInsets.all(30),
              child: Text(
                'Selamat Datang',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment(0, 0.9),
          child: ElevatedButton(
            child: Text("MULAI"),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ));
            },
          ),
        ),
      ],
    ));
  }
}
