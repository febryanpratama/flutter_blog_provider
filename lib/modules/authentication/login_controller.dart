import 'package:flutter/material.dart';
import 'package:flutter_blog_provider/constant/url.dart';
import 'package:flutter_blog_provider/repository/authentication/auth_repository.dart';
import 'package:flutter_blog_provider/utils/local_storage.dart';
import 'package:flutter_blog_provider/utils/routes/routes_name.dart';

class LoginController extends ChangeNotifier {
  final AuthRepository _authRepository = AuthRepository();

  final requestBaseUrl = AppUrl.baseUrl;

  Future login(BuildContext context, {
    required String email,
    required String password,
  }) async {

    // print(password);
    var resp = await _authRepository.login(email, password);
  
    if(resp != null){
      LocalStorage.save("token", resp.data.token);
      Navigator.pushNamedAndRemoveUntil(context, RoutesName.home, (route) => false);
    }
  }


  Future checkLogin(BuildContext context) async {
    var token = await LocalStorage.read("token");
    print(token);
    if(token.isNotEmpty){
      Navigator.pushNamedAndRemoveUntil(context, RoutesName.home, (route) => false);
    }
  }
}