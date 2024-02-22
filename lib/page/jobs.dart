import 'package:flutter/material.dart';

class JobPage extends StatelessWidget {
  final List<Job> jobs = [
    Job(
      company: 'Company A',
      title: 'Job Title A',
      location: 'Location A',
      logoUrl: 'assets/images/company.png',
    ),
    Job(
      company: 'Company B',
      title: 'Job Title B',
      location: 'Location B',
      logoUrl: 'assets/images/company.png',
    ),
    Job(
      company: 'Company C',
      title: 'Job Title C',
      location: 'Location C',
      logoUrl: 'assets/images/company.png',
    ),
    Job(
      company: 'Company D',
      title: 'Job Title D',
      location: 'Location D',
      logoUrl: 'assets/images/company.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Openings'),
        centerTitle: true,
        backgroundColor: Colors.red,
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
  final String logoUrl;

  Job({
    required this.company,
    required this.title,
    required this.location,
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
