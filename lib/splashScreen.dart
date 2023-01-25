import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class slpashScreen extends StatefulWidget {
  const slpashScreen({Key? key}) : super(key: key);

  @override
  State<slpashScreen> createState() => _slpashScreenState();
}

class _slpashScreenState extends State<slpashScreen> {
  checkPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool('isSplashVisited', true);

    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed('login_Page');
    });
  }

  
  @override
  void initState() {
    super.initState();
    checkPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              FlutterLogo(size: 200),
              Spacer(),
              CircularProgressIndicator(),
              Spacer(),
              Text("Welcome To App 💖",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
