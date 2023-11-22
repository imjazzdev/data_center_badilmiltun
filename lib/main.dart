import 'package:data_center_badilmiltun/pages/home.dart';
import 'package:data_center_badilmiltun/pages/jadwal_cuti.dart';
import 'package:data_center_badilmiltun/pages/start.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // status bar color
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        // appBarTheme: AppBarTheme(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        // )
      ),
      home: JadwalCutiPage(),
    );
  }
}
