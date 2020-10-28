import 'package:flutter/material.dart';

import 'video_play.dart';

class Library extends StatefulWidget {
  static String id = '/library';
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Library',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(15),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(50),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search Course Library',
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                      left: 15,
                      bottom: 11,
                      top: 11,
                      right: 15,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, left: 15),
              child: Text(
                'All Available Courses',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ),
            LibraryCouresCard(
              courseImage: 'images/datascience.png',
              courseName: 'Data Science For beginners',
              courseCategory: 'Data Science',
              courseAuthor: 'Mubarak na Mairo',
              courseDate: '11-02-2020',
              courseDuration: '2hrs',
              onTap: () {
                Navigator.of(context).pushNamed(VideoPlay.id);
              },
            ),
            LibraryCouresCard(
              courseImage: 'images/cbs.jpg',
              courseName: 'Advance Cyber Securitybeginners',
              courseCategory: 'Security',
              courseAuthor: 'Mubarak na Mairo',
              courseDate: '11-02-2020',
              courseDuration: '11hrs',
            ),
            LibraryCouresCard(
              courseImage: 'images/swe.jpg',
              courseName: 'Software Engineering',
              courseCategory: 'Software',
              courseAuthor: 'Mubarak na Mairo',
              courseDate: '11-02-2020',
              courseDuration: '7hrs 22mins',
            ),
          ],
        ),
      ),
    );
  }
}

class LibraryCouresCard extends StatelessWidget {
  const LibraryCouresCard({
    Key key,
    this.courseName,
    this.courseImage,
    this.courseCategory,
    this.courseDate,
    this.courseAuthor,
    this.courseDuration,
    this.onTap,
  }) : super(key: key);
  final String courseName,
      courseImage,
      courseCategory,
      courseDate,
      courseAuthor,
      courseDuration;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: Offset(0, 2.5),
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(6),
                      topLeft: Radius.circular(6),
                    ),
                    child: Image.asset(
                      '$courseImage',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$courseName',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Category: $courseCategory',
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Date Published: $courseDate',
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Author: $courseAuthor',
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Duration: $courseDuration',
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.orange),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              'START COURSE',
                              style: TextStyle(color: Colors.orange),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
