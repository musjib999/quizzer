import 'package:flutter/widgets.dart';
import 'package:quizzer/screens/dashboard.dart';
import 'package:quizzer/screens/login.dart';
import 'package:quizzer/screens/profile.dart';
import 'package:quizzer/screens/register.dart';

Map<String, WidgetBuilder> routes = {
  Dashboard.id: (context) => Dashboard(),
  Login.id: (context) => Login(),
  Register.id: (context) => Register(),
  Profile.id: (context) => Profile()
};
