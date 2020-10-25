import 'package:flutter/material.dart';
import 'package:quizzer/widgets/menu_drawer.dart';

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
        title: Text('Dashboard'),
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
      body: Center(
        child: Text('Dashboard'),
      ),
    );
  }
}
