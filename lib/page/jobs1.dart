import 'package:flutter/material.dart';

class JobPage extends StatelessWidget {
  final List<Job> jobs = [
    Job(
      company: 'TechEmpower Learning Solutions',
      title: 'Digital Literacy Trainer',
      location: 'Kolkata, West Bengal',
      salary: 'INR 4,00,000-5,00,000 per annum',
      description: 'Train individuals in basic digital skills, including computer usage, internet navigation, and email communication. Support learners in gaining essential digital literacy for personal and professional development.',
      logoUrl: 'assets/images/company.png',
    ),
    Job(
      company: 'CommunityConnect Services',
      title: 'Social Communication Assistant',
      location: 'Hyderabad,Telangana',
      salary: 'INR 3,00,000-4,00,000 per annum',
      description: 'Assist in crafting communication strategies for social causes. Manage social media platforms, create content, and engage with online communities to raise awareness about human trafficking issues.',
      logoUrl: 'assets/images/company.png',
    ),
    Job(
      company: 'SkillBridge Education',
      title: 'Basic Communication Instructor',
      location: 'Bengaluru, Karnataka',
      salary: 'INR 4,50,000-5,50,000 per annum',
      description: 'Teach practical communication skills, including conversational English and writing, to individuals aiming to enhance their employability. Focus on building confidence and interpersonal skills.',
      logoUrl: 'assets/images/company.png',
    ),
    Job(
      company: 'CraftArt Studios',
      title: 'Artisan-Handcrafted Goods',
      location: 'Jaipur, Rajasthan',
      salary: 'INR 3,00,000-4,00,000 per annum',
      description: 'Create handcrafted art and crafts, contributing to the production of unique and marketable items. Support economic empowerment through skill-based employment.',
      logoUrl: 'assets/images/company.png',
    ),
    Job(
      company: 'GreenHarbor Sustainable Living',
      title: 'Community Gardening Facilitator',
      location: 'Chennai, Tamil Nadu',
      salary: 'INR 3,00,000-4,00,000 per annum',
      description: 'Facilitate community gardening programs, teaching sustainable gardening practices. Empower survivors with skills in urban gardening and contribute to environmental sustainability.',
      logoUrl: 'assets/images/company.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Openings'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Text(
            'Recommended for You',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(
            'Based on your learning path and profile',
            style: TextStyle(fontSize: 12),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: jobs.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: JobCard(job: jobs[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Job {
  final String company;
  final String title;
  final String location;
  final String salary;
  final String description;
  final String logoUrl;

  Job({
    required this.company,
    required this.title,
    required this.location,
    required this.salary,
    required this.description,
    required this.logoUrl,
  });
}

class JobCard extends StatelessWidget {
  final Job job;

  JobCard({required this.job});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  job.logoUrl,
                  width: 50,
                  height: 50,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      job.company,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      job.title,
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      job.location,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    // On "Know More" button pressed
                  },
                  child: Text(
                    'Know More',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // On "Apply" button pressed
                  },
                  child: Text('Apply'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
