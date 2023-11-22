import 'package:data_center_badilmiltun/pages/home.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(360),
              color: Color.fromARGB(255, 168, 250, 170),
            ),
            margin: EdgeInsets.only(right: 40, left: 100),
            height: 200,
            width: 200,
          ),
        ],
=======
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ));
            },
            child: Text('Home Page')),
>>>>>>> 9dfc666fb384b8669f622d07aa475299f1e78546
      ),
    );
  }
}
