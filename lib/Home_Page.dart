import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.power_settings_new_outlined),
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();


              // await prefs.setBool('isLoggedIn', false); //  niche ni line jagiaye aa line chale
              await prefs.remove('isLoggedIn'); // upar ni line shortCut

              Navigator.of(context).pushNamedAndRemoveUntil('login_Page', (route) => false);
            },
          )
        ],
      ),
      body: Container(
        color: Colors.black,
      ),
    );
  }
}
