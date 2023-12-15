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
      Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
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
                                color: Colors.blue,
                                fontWeight: FontWeight.w500),
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
            Positioned(
              child: Container(
                width: 300,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/logo-eremis.jpeg',
                      height: 40,
                    ),
                    Image.asset(
                      'assets/logo-sikoopat.png',
                      height: 40,
                    ),
                  ],
                ),
              ),
            )
          ],
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

    if (response.success == true) {
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
