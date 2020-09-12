import 'dart:async';
import 'package:flutter/material.dart';
import './login.dart';
//import 'package:loginregisterapi/screens/home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Image(
          width: 150,
          // color: Colors.white,
          image: AssetImage("images/blue.png"),
        ),
      ),
    );
  }

  Future<Timer> startTimer() async {
    return Timer(Duration(seconds: 3), onDone);
  }

  void onDone() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
