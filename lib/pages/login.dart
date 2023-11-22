import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
    );
  }
}
