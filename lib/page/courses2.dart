import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CoursePage extends StatefulWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Courses'),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 9, 91, 92),
        ),
      );
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
   List<dynamic> courses = [];
    List<String> subjects = ['Math', 'Science', 'History', 'English'];
   @override
  void initState() {
    super.initState();
    fetchCourses();
  }

  Future<void> fetchCourses() async {
    final response = await http.get(Uri.parse('http://127.0.0.1:5000/courses'));
    if (response.statusCode == 200) {
      setState(() {
        courses = json.decode(response.body)['courses'];
      });
    } else {
      // Handle error
      print('Failed to load courses');
    }
  }

void showCourseDetails(dynamic course) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(course['course_name']),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Duration: ${course['duration']}'),
              Text('Subject: ${course['subject']}'),
              Text('Details/Syllabus: ${course['course_details_syllabus']}'),
              Text('Instructor: ${course['course_instructor']}'),
              Text('Provider: ${course['course_provider']}'),
              Text('Link: ${course['link']}'),
              Text('Enrolled: ${course['enrolled']}'),
              Text('Certification: ${course['certification']}'),
              Text('Rating: ${course['rating']}'),
              Text('Prerequisites: ${course['prerequisites'].join(', ')}'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Courses'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for courses',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 16.0),
            Text('Filter by Subject:'),
            Wrap(
              spacing: 8.0,
              children: subjects
                  .map(
                    (subject) => FilterChip(
                      label: Text(subject),
                      onSelected: (bool selected) {
                        // Handle filter logic here
                      },
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: 16.0),
            Text('Popular Courses:'),
            Container(
              height: 160.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      showCourseDetails(courses[index]);
                    },
                    child: Card(
                      margin: EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 200.0,
                        height: 120.0,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(courses[index]['course_name']),
                              SizedBox(height: 8.0),
                              Text('Description or details'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),
            Text('New Courses:'),
            Expanded(
              child: ListView.builder(
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      showCourseDetails(courses[index]);
                    },
                    child: Card(
                      margin: EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(courses[index]['course_name']),
                        subtitle: Text('Description or details'),
                        // Add more widgets as needed
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}