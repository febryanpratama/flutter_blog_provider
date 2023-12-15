import 'package:flutter/material.dart';
import 'package:flutter_blog_provider/modules/authentication/login_controller.dart';
import 'package:flutter_blog_provider/styles/padding.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginController()..checkLogin(context),
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Consumer<LoginController>(
          builder: (context, value, child) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: context.padding2,
                ),
                Container(
                  // width: ,
                  child: TextField(
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      hintText: "Email",
                    ),
                  ),
                ),
                SizedBox(
                  height: context.padding2,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: TextField(
                    controller: _password,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      hintText: "Password",
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(
                  height: context.padding2,
                ),
                ElevatedButton(
                  onPressed: () async {
                    // auth
                    // print(_email.text);
                    LoginController().login(context,
                        email: _email.text, password: _password.text);
                  },
                  child: const Text('Login'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: Size(MediaQuery.of(context).size.width, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
