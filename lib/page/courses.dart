import 'package:flutter/material.dart';


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
  List<String> subjects = ['Math', 'Science', 'History', 'English'];
  List<String> popularCourses = ['Course 1', 'Course 2', 'Course 3', 'Course 4'];

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
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: popularCourses.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(popularCourses[index]),
                          SizedBox(height: 8.0),
                          // Add more details or information about the course
                          Text('Description or details'),
                          // Add more widgets as needed
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Handle "More Courses" button press
              },
              child: Text('More Courses'),
            ),
          ],
        ),
      ),
    );
  }
}
