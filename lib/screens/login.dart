import 'package:flutter/material.dart';
import 'package:quizzer/screens/dashboard.dart';
import 'package:quizzer/screens/register.dart';

class Login extends StatefulWidget {
  static String id = '/login';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(Login.id),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, Dashboard.id);
              },
              child: Text('Login', style: TextStyle(color: Colors.white)),
              color: Color(0xffeb4d4d),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, Register.id);
              },
              child: Text('Register', style: TextStyle(color: Colors.white)),
              color: Color(0xff2c3e50),
            ),
          ],
        ),
      ),
    );
  }
}
