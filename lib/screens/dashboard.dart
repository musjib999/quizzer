import 'package:flutter/material.dart';
import 'package:quizzer/screens/topics.dart';
import 'package:quizzer/widgets/menu_drawer.dart';
import 'package:quizzer/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizzer/widgets/card.dart';
import 'package:quizzer/widgets/card_content.dart';

class Dashboard extends StatefulWidget {
  static String id = '/dashboard';
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
        ),
        actions: [
          Icon(Icons.email),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Icon(Icons.notifications),
          ),
        ],
      ),
      drawer: Drawer(
        child: DrawerItems(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CourseCard(
              cardColor: darkOrange,
              margin: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'All courses',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        '121',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 70,
                    child: VerticalDivider(color: Colors.white),
                  ),
                  Column(
                    children: [
                      Text(
                        'Quiz ranking',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        children: [
                          Text(
                            '1234',
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Topic.id);
              },
              child: CourseCard(
                cardColor: darkBlue,
                margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                child: CourseCardContent(
                  cardIcon: FontAwesomeIcons.paintBrush,
                  cardTitle: 'Art and Literature',
                ),
              ),
            ),
            CourseCard(
              cardColor: darkBlue,
              margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
              child: CourseCardContent(
                cardIcon: Icons.science,
                cardTitle: 'Science and Nature',
              ),
            ),
            CourseCard(
              cardColor: darkBlue,
              margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
              child: CourseCardContent(
                cardIcon: FontAwesomeIcons.brain,
                cardTitle: 'General Knowledge',
              ),
            ),
            CourseCard(
              cardColor: darkBlue,
              margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
              child: CourseCardContent(
                cardIcon: FontAwesomeIcons.microchip,
                cardTitle: 'Technology',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
