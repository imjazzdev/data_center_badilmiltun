import 'package:data_center_badilmiltun/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Flexible(
          child: Image(
        height: double.maxFinite,
        width: double.maxFinite,
        image: AssetImage(
          'assets/bg.jpg',
        ),
        fit: BoxFit.cover,
      )),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 120,
            width: 300,
            margin: EdgeInsets.only(right: 40, left: 50),
            child: Text(
              "Seketrariat Mahkama Agung",
              textAlign: TextAlign.center,
              style: GoogleFonts.andika(
                textStyle: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    letterSpacing: .5,
                    fontSize: 35),
              ),
            ),
          ),
        ],
      ),
      Positioned(
        bottom: 50,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromARGB(255, 216, 238, 216).withOpacity(0.5),
          ),
          height: 180,
          width: 300,
          margin: EdgeInsets.only(right: 40, left: 50),
          child: Container(
            padding: EdgeInsets.all(30),
            child: Text(
              'Selamat Datang',
              textAlign: TextAlign.center,
              style: GoogleFonts.andika(
                textStyle: TextStyle(
                    color: Color.fromARGB(255, 64, 83, 255),
                    letterSpacing: .5,
                    fontSize: 23),
              ),
            ),
          ),
        ),
      ),
      Positioned(
        bottom: 90,
        right: 160,
        child: Align(
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
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 64, 83, 255))),
        ),
      ),
    ]));
  }
}
