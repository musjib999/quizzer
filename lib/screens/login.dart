import 'package:flutter/material.dart';
import 'package:quizzer/widgets/custom_button.dart';
import 'package:quizzer/constants.dart';
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
      backgroundColor: darkBlue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Container(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Q',
                  style: TextStyle(
                    color: darkOrange,
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'UIZZER',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: ListView(
                children: <Widget>[
                  Column(
                    children: [
                      Text(
                        'Welcome Back',
                        style: TextStyle(
                          color: darkBlue,
                          fontSize: 30.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Login to Continue'),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      style: TextStyle(
                        color: darkOrange,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Email',
                        suffixIcon: Icon(Icons.email_outlined),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        suffixIcon: Icon(Icons.lock_outline),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15.0, top: 8.0, left: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, Register.id);
                          },
                          child: Text(
                            'Create Account',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          'Forgot Password?',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: CustomButton(
                      buttonTitle: 'Login',
                      onTap: () {
                        Navigator.of(context).pushNamed(Dashboard.id);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
