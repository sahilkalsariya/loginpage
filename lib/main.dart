
import 'package:flutter/material.dart';
import 'package:login_page/logIn.dart';
import 'package:login_page/splashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Home_Page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  //  bool? isSplashVisited = prefs.getBool('isSplashvisited') == null ? false : prefs.getBool('isSplashVisited'); // nichel lakhel ni jagiyaye aa rite lakhi sako

  bool? isSplashVisited = prefs.getBool('isSplashVisited') ?? false; // upar nu short-cut line
  bool? isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: (isSplashVisited == false)
          ? 'splash_Screen'
          : (isLoggedIn == false)
              ? 'login_Page'
              : '/',
      routes: {
        '/': (context) => homePage(),
        'splash_Screen': (context) => slpashScreen(),
        'login_Page': (context) => logIn(),
        'home_Page': (context) => homePage(),
      },
    ),
  );
}
