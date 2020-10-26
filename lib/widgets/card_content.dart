import 'package:flutter/material.dart';
import 'package:quizzer/constants.dart';

class CourseCardContent extends StatelessWidget {
  final IconData cardIcon;
  final String cardTitle;

  CourseCardContent({this.cardIcon, this.cardTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          cardIcon,
          size: 50.0,
          color: darkOrange,
        ),
        SizedBox(
          width: 13.0,
        ),
        Text(
          cardTitle,
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
          ),
        ),
      ],
    );
  }
}
