import 'package:flutter/material.dart';
import 'package:quizzer/routes/router.dart';
import 'package:quizzer/screens/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xff2c3e50),
        accentColor: Color(0xffeb4d4d),
        primaryColorDark: Color(0xff2c3e50),
      ),
      initialRoute: Login.id,
      routes: routes,
    );
  }
}
