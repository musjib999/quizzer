import 'package:flutter/material.dart';
import 'package:quizzer/screens/login.dart';
import 'package:quizzer/screens/profile.dart';

class DrawerItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff2c3e50),
      ),
      height: 10,
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Q',
                  style: TextStyle(
                    color: Color(0xffeb4d4d),
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'UIZZER',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.white,
          ),
          Flexible(
            child: Container(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Home',
                      style: TextStyle(color: Colors.white),
                    ),
                    enabled: true,
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Profile',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.of(context).popAndPushNamed(Profile.id);
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.library_books,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Library',
                      style: TextStyle(color: Colors.white),
                    ),
                    enabled: true,
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.calculate,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Exams',
                      style: TextStyle(color: Colors.white),
                    ),
                    enabled: true,
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.bar_chart,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Analytics',
                      style: TextStyle(color: Colors.white),
                    ),
                    enabled: true,
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 10,
              bottom: 10,
              left: 10,
              right: 10,
            ),
            child: Column(
              children: [
                Divider(
                  color: Colors.white,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, Login.id);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Log Out',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      Icon(
                        Icons.exit_to_app,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
