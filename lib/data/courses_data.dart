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
      enrollment: 'Not Enrolled',
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
      enrollment: 'Not Enrolled',
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
      enrollment: 'Not Enrolled',
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
      enrollment: 'Not Enrolled',
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
      enrollment: 'Not Enrolled',
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