import 'package:data_center_badilmiltun/pages/login.dart';
import 'package:data_center_badilmiltun/utils/color_select.dart';
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
        Positioned(
          bottom: 10,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.8),
            ),
            height: 180,
            width: 300,
            margin: EdgeInsets.only(right: 40, left: 50),
            child: Container(
              padding: EdgeInsets.all(30),
              child: Text(
                'Selamat Datang',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(fontSize: 25),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment(0, 0.9),
          child: ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: ColorSelect.green),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ));
              },
              child: Text('Started')),
        ),
      ]),
    );
  }
}
