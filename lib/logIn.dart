import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class logIn extends StatefulWidget {
  const logIn({Key? key}) : super(key: key);

  @override
  State<logIn> createState() => _logInState();
}

class _logInState extends State<logIn> {
  final GlobalKey<FormState> loginForm = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Log In"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(18),
        child: Form(
          key: loginForm,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter Email",
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
                controller: emailController,
                validator: (val) {
                  return (val!.isEmpty) ? "Enter Your Email..." : null;
                },
                onSaved: (val) {
                  email = val!;
                },
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter Passwords",
                  labelText: "Passwords",
                  border: OutlineInputBorder(),
                ),
                controller: passwordController,
                validator: (val) {
                  return (val!.isEmpty) ? "Enter Your Passwords..." : null;
                },
                onSaved: (val) {
                  password = val!;
                },
                keyboardType: TextInputType.number,
                obscureText: true,
              ),
              SizedBox(height: 8),
              ElevatedButton(
                child: Text("Submit"),
                onPressed: () async {
                  if (loginForm.currentState!.validate()) {
                    loginForm.currentState!.save();

                    if (emailController.text == 'admin@gmail.com' &&
                        passwordController.text == '123456') {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setBool('isLoggedIn', true);

                      Navigator.of(context).pushReplacementNamed('/');
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
