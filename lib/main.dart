import 'package:resurge2/page/home.dart';
import 'package:resurge2/provider/menubar_provider.dart';
import 'package:resurge2/widgets/menubar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:resurge2/data/courses_data.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'Resurge';

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => NavigationProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: const Color(0x00f0faf8)),
            useMaterial3: true,
            fontFamily: 'CustomIcons',
          ),
          home: Home(),
        ),
      );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Course> enrolledCourses = [];

  @override
  void initState() {
    super.initState();
    // Filter the courses with status "Currently Enrolled"
    enrolledCourses = allCourses
        .where((course) => course.enrollment == 'Currently Enrolled')
        .toList();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          backgroundColor: const Color(0x00a8f1e4),
          title: Text(MyApp.title),
          centerTitle: true,
        ),
        body: SingleChildScrollView( 
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi User,',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Enrolled Courses:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              // Displaying only enrolled courses
              for (var course in enrolledCourses)
                CourseCard(
                  imageUrl: course.imageUrl,
                  courseName: course.name,
                  instructor: course.instructor,
                ),
              SizedBox(height: 20),
              Text(
                'Recommended Jobs:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: [
                    JobCard(
                      //logoUrl: 'assets/images/logo1.png',
                      jobTitle: 'Digital Literacy Trainer',
                      company: 'TechEmpower Learning Solutions',
                    ),
                    JobCard(
                      //logoUrl: 'assets/images/logo4.png',
                      jobTitle: 'Artisan-Handicrafted Goods',
                      company: 'CraftArt Studios',
                    ),
                  ],
                ), 
            ],
          
          ),
        ),
        )
    );
}

class CourseCard extends StatelessWidget {
  final String courseName;
  final String instructor;
  final String imageUrl;

  CourseCard({
    required this.courseName,
    required this.instructor,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              imageUrl,
              height: 80.0, // Adjust height as needed
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Text(
              courseName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Instructor: $instructor',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  final String jobTitle;
  final String company;
  //final String logoUrl;

  JobCard({
    required this.jobTitle,
    required this.company,
    //required this.logoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            /*Image.network(
              logoUrl,
              height: 80.0, // Adjust height as needed
              width: double.infinity,
              fit: BoxFit.cover,
            ),*/
            SizedBox(height: 10),
            Text(
              jobTitle,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Company: $company',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    ),
   );
  }
}
