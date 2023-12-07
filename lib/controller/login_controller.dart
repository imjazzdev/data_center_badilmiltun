import 'dart:convert';

import 'package:data_center_badilmiltun/model/my_response.dart';
import 'package:data_center_badilmiltun/services/repository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/login.dart';

class LoginController {
  Repository repository = Repository();
  var emailCon = TextEditingController();
  var passwordCon = TextEditingController();

  Future<MyResponse> login() async {
    http.Response result =
        await repository.login(emailCon.text, passwordCon.text);

    Map<String, dynamic> myBody = jsonDecode(result.body);
    MyResponse<Login> myResponse = MyResponse.fromJson(myBody, Login.fromJson);
    return myResponse;
  }
}
