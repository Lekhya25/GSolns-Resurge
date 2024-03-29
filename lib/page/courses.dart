import 'package:flutter/material.dart';
import 'package:resurge2/data/courses_data.dart';

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
  List<String> subjects = ['All','Arts', 'Driving', 'Gardening', 'Handicraft','IT'];
  List<Course> courses = [];


  void _showCourseDetails(Course course) {
  showDialog(
    context: context,
    builder: (BuildContext context) {

      bool isEnrolled = (course.enrollment == 'Currently Enrolled');

      return AlertDialog(
        title: Column(
          children: [
            Image.network(course.imageUrl, height: 100.0),
            SizedBox(height: 8.0),
            Text(
              course.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDetailText('Duration:', course.duration),
              _buildDetailText('Subject:', course.subject),
              _buildDetailText('Details:', course.details),
              _buildDetailText('Instructor:', course.instructor),
              _buildDetailText('Provider:' ,course.provider),
              _buildDetailText('Enrollment:', course.enrollment),
              _buildDetailText('Certification:',course.certification),
              _buildDetailText('Rating:',course.rating),
              _buildDetailText('Prerequisites:',course.prerequisites),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isEnrolled = !isEnrolled;
                    course.enrollment = isEnrolled ? 'Currently Enrolled' : 'Not Enrolled';
                  });
                },
                child: Text(isEnrolled ? 'Unenroll' : 'Enroll'),
              ),
            ],
          ),
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

Widget _buildDetailText(String label, String value) {
  return RichText(
    text: TextSpan(
      style: DefaultTextStyle.of(context).style,
      children: <TextSpan>[
        TextSpan(
          text: '$label ',
          style: TextStyle(
            fontFamily: 'Verdana',
            //fontWeight: FontWeight.bold,
            fontSize: 16.0, // Adjust the font size as needed
            color: Colors.teal, // Set the font color to black
            decoration: TextDecoration.none,
          ),
        ),
        TextSpan(
          text: value,
          style: TextStyle(
            fontFamily: 'Verdana',
            color: Colors.black, // Adjust the font size as needed
            fontSize: 16.0,
            decoration: TextDecoration.none,
          ),
        ),
      ],
    ),
  );
}

  @override
  void initState() {
    super.initState();
    courses = List.from(allCourses);
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
                        setState(() {
                            if (subject == 'All') {
                              courses = List.from(allCourses); // Fetch or initialize the full list of courses
                            } else if (selected) {
                            courses = allCourses
                                .where((course) => course.subject == subject)
                                .toList();
                            } else {
                              courses = courses
                                  .where((course) => course.subject == subject)
                                  .toList();
                            }
                        });
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
                      _showCourseDetails(courses[index]);
                    },
                    child: Card(
                      margin: EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 200.0,
                        height: 120.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              courses[index].imageUrl, 
                              height: 80.0,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(courses[index].name),
                                  SizedBox(height: 8.0),
                                ],
                              ),
                            ),
                          ],
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
                      _showCourseDetails(courses[index]);
                    },
                    child: Card(
                      margin: EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(courses[index].name),
                        subtitle: Text('Subject: ${courses[index].subject}'),
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

void main() {
  runApp(MaterialApp(
    home: CoursePage(),
  ));
}
