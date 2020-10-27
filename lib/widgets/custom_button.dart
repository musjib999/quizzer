import 'package:flutter/material.dart';
import 'package:quizzer/constants.dart';

class CustomButton extends StatelessWidget {
  final String buttonTitle;
  final Function onTap;
  CustomButton({this.buttonTitle, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12.0),
        margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15),
        decoration: BoxDecoration(
          color: darkBlue,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: darkBlue.withOpacity(0.5),
              offset: Offset(0, 2.5),
              blurRadius: 5,
            ),
          ],
        ),
        child: Center(
          child: Text(
            buttonTitle,
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
        ),
      ),
    );
  }
}
