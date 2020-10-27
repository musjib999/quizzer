import 'package:flutter/material.dart';
import 'package:quizzer/constants.dart';
import 'package:quizzer/screens/dashboard.dart';
import 'package:quizzer/screens/login.dart';
import 'package:quizzer/widgets/custom_button.dart';

class Register extends StatefulWidget {
  static String id = '/register';
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                        'Welcome To Quizzer',
                        style: TextStyle(
                          color: darkBlue,
                          fontSize: 30.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Create an Account to Continue'),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      style: TextStyle(
                        color: darkOrange,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Name',
                        suffixIcon: Icon(Icons.person_outline),
                      ),
                    ),
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
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        suffixIcon: Icon(Icons.lock_outline),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15.0, top: 8.0, left: 15.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Login.id);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Already a User?',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            'Sign in',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: darkOrange,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: CustomButton(
                      buttonTitle: 'Register',
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
