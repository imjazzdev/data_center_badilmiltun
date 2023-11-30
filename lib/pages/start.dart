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
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 170,
            margin: EdgeInsets.only(bottom: 70),
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white.withOpacity(0.8)),
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Selamat Datang',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(fontSize: 25),
                ),
                Text(
                  'Lorem ipsum  is simply dummy text of the',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(fontSize: 16),
                ),
                Align(
                  alignment: Alignment(0, 0.9),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorSelect.green),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ));
                      },
                      child: Text('Masuk')),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
