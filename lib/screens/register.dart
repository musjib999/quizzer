import 'package:flutter/material.dart';
import 'package:quizzer/screens/dashboard.dart';
import 'package:quizzer/screens/login.dart';

class Register extends StatefulWidget {
  static String id = '/register';
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(Register.id),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, Dashboard.id);
              },
              child: Text('Register', style: TextStyle(color: Colors.white)),
              color: Color(0xffeb4d4d),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, Login.id);
              },
              child: Text('Login', style: TextStyle(color: Colors.white)),
              color: Color(0xff2c3e50),
            ),
          ],
        ),
      ),
    );
  }
}
