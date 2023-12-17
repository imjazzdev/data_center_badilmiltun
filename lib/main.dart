// import 'package:data_center_badilmiltun/pages/home.dart';
import 'package:data_center_badilmiltun/pages/start.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:data_center_badilmiltun/pages/home.dart';
import 'package:data_center_badilmiltun/pages/login.dart';
import 'package:data_center_badilmiltun/pages/start.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'utils/color_select.dart';

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
          appBarTheme: AppBarTheme(
            backgroundColor: ColorSelect.blue.withOpacity(0.8),
            elevation: 0,
          )),
      home: const StartPage(),
    );
  }
}
