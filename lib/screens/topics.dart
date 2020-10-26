import 'package:flutter/material.dart';
import 'package:quizzer/constants.dart';
import 'package:quizzer/screens/quiz.dart';

class Topic extends StatefulWidget {
  static String id = '/topic';
  @override
  _TopicState createState() => _TopicState();
}

class _TopicState extends State<Topic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Topics'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            TopicsCard(
              topicTitle: 'English',
              onTap: () {
                Navigator.pushNamed(context, Quiz.id);
              },
            ),
            TopicsCard(
              topicTitle: 'Creative and Visual Arts',
            ),
            TopicsCard(
              topicTitle: 'Political Science',
            ),
            TopicsCard(
              topicTitle: 'Psychology',
            ),
            TopicsCard(
              topicTitle: 'Linguistics',
            ),
            TopicsCard(
              topicTitle: 'Mass Communication',
            ),
            TopicsCard(
              topicTitle: 'Music',
            ),
          ],
        ),
      ),
    );
  }
}

class TopicsCard extends StatelessWidget {
  const TopicsCard({
    Key key,
    this.topicTitle,
    this.onTap,
  }) : super(key: key);
  final String topicTitle;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(13),
        margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
        decoration: BoxDecoration(
          color: darkBlue,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: Offset(0, 2.5),
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  '$topicTitle',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Icon(
              Icons.chevron_right,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
