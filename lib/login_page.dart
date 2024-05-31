import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';

class LoginPage extends StatelessWidget {
  static const String PREF_USER_LOGIN_KEY = "isLogin";

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            ///if user is successfully authenticated
            var prefs = await SharedPreferences.getInstance();
            prefs.setBool(PREF_USER_LOGIN_KEY, true);

            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ));
          },
          child: Text('Login'),
        ),
      ),
    );
  }
}
