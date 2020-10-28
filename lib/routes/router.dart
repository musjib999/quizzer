import 'package:flutter/widgets.dart';
import 'package:quizzer/screens/dashboard.dart';
import 'package:quizzer/screens/library.dart';
import 'package:quizzer/screens/quiz.dart';
import 'package:quizzer/screens/topics.dart';
import 'package:quizzer/screens/login.dart';
import 'package:quizzer/screens/profile.dart';
import 'package:quizzer/screens/register.dart';
import '../screens/video_play.dart';

Map<String, WidgetBuilder> routes = {
  Dashboard.id: (context) => Dashboard(),
  Login.id: (context) => Login(),
  Register.id: (context) => Register(),
  Profile.id: (context) => Profile(),
  Topic.id: (context) => Topic(),
  Quiz.id: (context) => Quiz(),
  Library.id: (context) => Library(),
  VideoPlay.id: (contexr) => VideoPlay()
};
