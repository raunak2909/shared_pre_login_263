import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_pre_login_263/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () async {
      var prefs = await SharedPreferences.getInstance();
      bool? check = prefs.getBool(LoginPage.PREF_USER_LOGIN_KEY);

      Widget nextPage = LoginPage();

      if(check!=null && check){
        nextPage = HomePage();
      }

      /*if (check != null) {
        if (check) {
          nextPage = HomePage();
        } else {}
      } else {}*/

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => nextPage,
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: FlutterLogo(),
      ),
    );
  }
}
