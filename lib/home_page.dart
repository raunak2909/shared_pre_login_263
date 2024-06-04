import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  static const String PREF_APP_OPEN_NO_KEY = "appOpenNo";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int appOpenNo = 0;

  @override
  void initState() {
    super.initState();
    updateAppOpenNo();
  }

  void updateAppOpenNo() async{

    var prefs = await SharedPreferences.getInstance();
    appOpenNo = prefs.getInt(HomePage.PREF_APP_OPEN_NO_KEY) ?? 0;

    appOpenNo++;
    prefs.setInt(HomePage.PREF_APP_OPEN_NO_KEY, appOpenNo);

    setState(() {

    });


  }

  Color getBgColor(){

    if(appOpenNo%3==0 && appOpenNo%5==0){
      return Colors.green;
    } else if(appOpenNo%3==0){
      return Colors.blue;
    } else if(appOpenNo%5==0){
      return Colors.orange;
    } else {
      return Colors.white;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getBgColor(),
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text('Hi, Welcome Home..', style: TextStyle(fontSize: 25),),
      ),
    );
  }
}
