import 'dart:convert';

import 'package:data_center_badilmiltun/model/my_response.dart';
import 'package:data_center_badilmiltun/services/repository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../model/login.dart';

class LoginController {
  Repository repository = Repository();
  var emailCon = TextEditingController(text: 'izaaz@gmail.com');
  var passwordCon = TextEditingController(text: '123');
  bool isLoading = false;

  Future<MyResponse> login() async {
    http.Response result =
        await repository.login(emailCon.text, passwordCon.text);

    // print('STATUS CODE : ${result.statusCode}');

    // Map<String, dynamic> myBody = jsonDecode(result.body);
    // print('RESULT BODY : ${myBody}');

    // MyResponse<UserLogin> myResponse =
    //     MyResponse.fromJson(myBody, UserLogin.fromJson);

    // debugPrint('MY RESPON MASSAGE : ${myResponse.massage}');

    if (result.statusCode == 200) {
      Map<String, dynamic> myBody = jsonDecode(result.body);
      print('RESULT BODY : ${myBody}');

      MyResponse<UserLogin> myResponse =
          MyResponse.fromJson(myBody, UserLogin.fromJson);
      debugPrint('MY RESPON MASSAGE : ${myResponse.massage}');

      if (myResponse.code == null) {
        final prefs = await SharedPreferences.getInstance();
        //simpan token
        await prefs.setString('token', myBody['token'] ?? '');
      }

      return myResponse;
    } else {
      return MyResponse(code: 1, massage: 'Terjadi kesalahan, coba lagi');
    }
  }
}
