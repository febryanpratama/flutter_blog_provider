import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_blog_provider/core/api.dart';
import 'package:flutter_blog_provider/models/authentication/login_model.dart';
import 'package:flutter_blog_provider/utils/local_storage.dart';

class AuthRepository extends Api {

  Future<ModelLogin?> login(String email, String password) async {

    var params = {
      "email": email,
      "password": password,
    };

    // print(params);
    var response =  await post('/auth/login', params: params);
    // print(response);
    if(response != null){
      // LocalStorage.save("token", value)
      return ModelLogin.fromJson(response);
    }

    return null;
  }
}