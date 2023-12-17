import 'dart:convert';

import 'package:data_center_badilmiltun/model/my_response.dart';
import 'package:data_center_badilmiltun/services/repository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../model/login.dart';

class LoginController {
  Repository repository = Repository();
  var emailCon = TextEditingController(text: '199612112020121005');
  var passwordCon = TextEditingController(text: '199612112020121005');
  bool isLoading = false;

  Future<MyResponse> login() async {
    http.Response result =
        await repository.login(emailCon.text, passwordCon.text);

    print('STATUS CODE : ${result.statusCode}');

    if (result.statusCode == 200) {
      // print('RESULT BODY : ${result.body}');
      Map<String, dynamic> myBody = jsonDecode(result.body);

      MyResponse myResponse = MyResponse.fromJson(myBody, UserLogin.fromJson);
      print('MY RESPON  : ${myResponse.message}');

      // if (myResponse.data != null) {
      //   final prefs = await SharedPreferences.getInstance();
      //   //simpan token
      //   await prefs.setString('token', myBody['token'] ?? '');
      // }

      return myResponse;
    } else {
      return MyResponse(
          success: false, message: 'Terjadi kesalahan, coba lagi');
    }
  }
}
