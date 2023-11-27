import 'package:data_center_badilmiltun/pages/home.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/logo-eremis.jpeg',
                  height: 80,
                  width: 80,
                ),
                Image.asset(
                  'assets/logo_miltun.jpg',
                  height: 40,
                  width: 50,
                ),
                Image.asset(
                  'assets/logo-sikoopat.png',
                  height: 150,
                  width: 100,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
            width: 60,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: 40, left: 40),
                height: 300,
                width: 300,
                child: Image.asset('assets/logo_ma.png'),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                      fillColor: Colors.lightBlue[50],
                      filled: true,
                      // icon: Icon(Icons.adb),

                      prefixIcon: Icon(Icons.person),
                      // prefixText: "name :",
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
                    decoration: InputDecoration(
                        fillColor: Colors.lightBlue[50],
                        filled: true,
                        // icon: Icon(Icons.adb),
                        prefixIcon: Icon(Icons.lock),
                        // prefixText: "name :",
                        prefixStyle: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.w500),
                        labelText: "PASSWORD",
                        hintText: "password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25))),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                  width: 10,
                ),
                Container(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ));
                      },
                      child: Text('Login')),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
