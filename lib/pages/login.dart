import 'package:data_center_badilmiltun/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;
  String inkwell = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Column(
        children: [
          Flexible(
              child: Image(
                  height: 400, width: 409, image: AssetImage("assets/bg.jpg"))),
        ],
      ),
      Positioned(
        bottom: 40,
        right: 140,
        child: Material(
          borderRadius: BorderRadius.circular(50),
          elevation: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 2, 60, 155),
                  fixedSize: const Size(100, 100),
                  shape: const CircleBorder(),
                ),
                child: const Text(
                  'Log In',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
      Align(
        alignment: Alignment.center,
        child: Material(
          borderRadius: BorderRadius.circular(20),
          elevation: 15,
          color: Color.fromARGB(255, 2, 60, 155).withOpacity(1),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: 300,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.only(top: 15, bottom: 15),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Login",
                    style: GoogleFonts.andika(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        fillColor: Colors.lightBlue[50],
                        filled: true,
                        prefixIcon: Icon(Icons.person),
                        prefixStyle: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.w500),
                        labelText: "ID",
                        hintText: "no id",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25))),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  SizedBox(
                    height: 10,
                    width: 10,
                  ),
                  Container(
                    child: TextField(
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                          fillColor: Colors.lightBlue[50],
                          filled: true,
                          prefixIcon: Icon(Icons.lock),
                          prefixStyle: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.w500),
                          labelText: "PASSWORD",
                          hintText: "password",
                          suffixIcon: IconButton(
                            icon: Icon(_isObscure
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25))),
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                ]),
          ),
        ),
      ),
    ]));
  }
}
