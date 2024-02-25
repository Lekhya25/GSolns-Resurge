import 'package:flutter/material.dart';

class Course {
  String name;
  String duration;
  String subject;
  String details;
  String instructor;
  String provider;
  String enrollment;
  String certification;
  String rating;
  String prerequisites;
  String imageUrl;

  Course({
    required this.name,
    required this.duration,
    required this.subject,
    required this.details,
    required this.instructor,
    required this.provider,
    required this.enrollment,
    required this.certification,
    required this.rating,
    required this.prerequisites,
    required this.imageUrl,
  });
}

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
  List<Course> allCourses = [
    Course(
      name: 'Digital Mastery',
      duration: '8 weeks',
      subject: 'IT',
      details: 'Introduction to Computers, Internet Essentials, E-Governance Basics' ,
      instructor: 'Priya Sharma',
      provider: 'National Institute of Digital Learning',
      enrollment: 'Currently Enrolled',
      certification: 'Yes',
      rating: 'N.A',
      prerequisites: 'None',
      imageUrl: 'https://th.bing.com/th/id/OIP.yspjUMXB-f_q0l8kRt5I9AAAAA?rs=1&pid=ImgDetMain',
    ),
    Course(
      name: 'Computer Operator',
      duration: '9 weeks',
      subject: 'IT',
      details: 'Computers Operating System, Basics of Computer Hardware & Software, Office 365, Internet, etc.' ,
      instructor: 'Skill India',
      provider: 'Ministry of Skill Development and Entrepreneurship (MSDE)',
      enrollment: 'Currently Enrolled',
      certification: 'Yes',
      rating: '5/5',
      prerequisites: 'None',
      imageUrl: 'https://dynamic.placementindia.com/blog_images/20200805154712_image1.jpg',
    ),
    Course(
      name: 'Yoga and Mindfulness for Wellness',
      duration: '6 weeks',
      subject: 'Health',
      details: 'Introduction to Yoga, Mindfulness Practices, Stress Reduction Techniques' ,
      instructor: 'Swati Mishra',
      provider: 'Yogic Living Institute',
      enrollment: 'Currently Enrolled',
      certification: 'Yes',
      rating: '4.7/5',
      prerequisites: 'None',
      imageUrl: 'https://th.bing.com/th/id/R.a6c773786a5e834087aa6aa44832aa00?rik=lrD6XcP99ZkB7Q&pid=ImgRaw&r=0',
    ),
    Course(
      name: 'Trucks Driving',
      duration: '8 weeks',
      subject: 'Driving',
      details: 'Training that covers theoretical and practical training and issues Learner’s Driving License. Drivers are trained on LMVs, HMVs, Tippers, Construction equipment vehicles.' ,
      instructor: 'Ajith Nair',
      provider: 'Tata Motors Drivers Training Institute',
      enrollment: 'Currently Enrolled',
      certification: 'Yes',
      rating: '5/5',
      prerequisites: 'None',
      imageUrl: 'https://th.bing.com/th?id=OIP.4rPwB_zguzDJAcb7ktS9twHaE8&w=306&h=204&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2',
    ),
    Course(
      name: 'Handcrafted Art and Crafts Workshop',
      duration: '8 weeks',
      subject: 'Arts',
      details: 'Basic Drawing, Paper Crafts, DIY Projects' ,
      instructor: 'Artisan Crafts Collective',
      provider: 'Craftsmanship Academy',
      enrollment: 'Currently Enrolled',
      certification: 'Yes',
      rating: 'N.A',
      prerequisites: 'None',
      imageUrl: 'https://th.bing.com/th/id/R.eac42aa271e623ed6871d3b1ff46bef9?rik=TKDoKNgOMGAAtQ&pid=ImgRaw&r=0',
    ),
    Course(
      name: 'Practical Home Gardening',
      duration: '6 weeks',
      subject: 'Gardening',
      details: 'Basics of Gardening, Plant Care, Urban Gardening' ,
      instructor: 'Green Thumbs Society',
      provider: 'EcoLiving Institute',
      enrollment: 'Currently Enrolled',
      certification: 'Yes',
      rating: '4/5',
      prerequisites: 'None',
      imageUrl: 'https://th.bing.com/th/id/OIP.GCMQ2KH3t7eRa8KJhOphuwAAAA?rs=1&pid=ImgDetMain',
    ),
    Course(
      name: 'Introduction to Handicraft Entrepreneurship',
      duration: '10 weeks',
      subject: 'Handicraft',
      details: 'Handicraft Creation, Basics of Selling, Entrepreneurial Skills' ,
      instructor: 'Seema Devi',
      provider: 'Handicraft Entrepreneurs Guild',
      enrollment: 'Currently Enrolled',
      certification: 'Yes',
      rating: '4.5/5',
      prerequisites: 'None',
      imageUrl: 'https://th.bing.com/th/id/OIP.hmutZgysjEZviuQqYt3zAwHaE7?rs=1&pid=ImgDetMain',
    ),
  ];
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
