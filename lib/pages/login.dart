import 'package:data_center_badilmiltun/controller/login_controller.dart';
import 'package:data_center_badilmiltun/model/login.dart';
import 'package:data_center_badilmiltun/model/my_response.dart';
import 'package:data_center_badilmiltun/pages/home.dart';
import 'package:data_center_badilmiltun/utils/color_select.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;
  String inkwell = '';

  LoginController _controller = LoginController();

  void sessionCheck() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    if (token != null) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
          (route) => false);
    }
  }

  @override
  void initState() {
    sessionCheck();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 12, 112, 226).withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 1.5,
              offset: Offset(0, 0),
            )
          ],
        ),
        child: Flexible(
            child: Image(
                opacity: AlwaysStoppedAnimation(0.5),
                height: 400,
                width: 409,
                image: AssetImage("assets/gdlogg.jpeg"))),
      ),
      Container(
        padding: EdgeInsets.all(5),
        height: 50,
        child: Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(height: 50, image: AssetImage("assets/logo_miltun.jpg")),
              Image(height: 50, image: AssetImage("assets/logo-sikoopat.png")),
              Image(height: 35, image: AssetImage("assets/logo-eremis.jpeg"))
            ],
          ),
        ),
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
                onPressed: login,
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 2, 60, 155),
                  fixedSize: const Size(100, 100),
                  shape: const CircleBorder(),
                ),
                child: _controller.isLoading
                    ? CircularProgressIndicator()
                    : Text(
                        'Log In',
                        style: TextStyle(fontSize: 18),
                      ),
              ),
            ],
          ),
        ),
      ),
      Flexible(
        child: Align(
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
                      controller: _controller.emailCon,
                      decoration: InputDecoration(
                          fillColor: Colors.lightBlue[50],
                          filled: true,
                          prefixIcon: Icon(Icons.person),
                          prefixStyle: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.w500),
                          hintText: "Email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25))),
                    ),
                    SizedBox(
                      height: 10,
                      width: 10,
                    ),
                    Container(
                      child: TextField(
                        controller: _controller.passwordCon,
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                            fillColor: Colors.lightBlue[50],
                            filled: true,
                            prefixIcon: Icon(Icons.lock),
                            prefixStyle: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w500),
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
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    ]));
  }

  void login() async {
    setState(() {
      _controller.isLoading = true;
    });
    MyResponse response = await _controller.login();
    setState(() {
      _controller.isLoading = false;
    });

    if (response.code == 0) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
          (route) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Terjadi kesalahan, coba lagi.'),
        backgroundColor: Colors.red,
      ));
    }
  }
}
