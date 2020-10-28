import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final Color cardColor;
  final Widget child;
  final EdgeInsetsGeometry margin;

  CourseCard({this.cardColor, this.child, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 95,
      padding: EdgeInsets.all(15),
      margin: margin,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(0xff2c3e50).withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: child,
    );
  }
}
