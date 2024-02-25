import 'package:flutter/material.dart';

class MentorshipPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mentorship Programs'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: MentorshipList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showLocationAccessDialog(context);
        },
        child: Icon(Icons.explore),
      ),
    );
  }

  void _showLocationAccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Access Location"),
          content: Text(
              "Do you want to access your location to find workshops near you?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("No"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _showWorkshopsNearMeDialog(context);
              },
              child: Text("Yes"),
            ),
          ],
        );
      },
    );
  }

  void _showWorkshopsNearMeDialog(BuildContext context) {
    List<Workshop> workshopsNearMe = [
      Workshop('Mindfulness Workshop', 'Wellness Center', 'Explore the practice of mindfulness for a balanced life.', 'https://th.bing.com/th/id/R.56af816159a00de0d58e76ffb71c2e14?rik=K3Z6bDHg9bvvsg&riu=http%3a%2f%2fwww.womenfitness.net%2fwp%2fwp-content%2fuploads%2f2017%2f06%2fPracticing-Mindfulness.jpg&ehk=sgB1mamWpKGAvgWy1rREyzlWXsfGorn%2fAjabrntnQvE%3d&risl=&pid=ImgRaw&r=0'),
      Workshop('Tech Skills Bootcamp', 'Tech Hub', 'Enhance your technical skills in this intensive bootcamp for beginners.', 'https://th.bing.com/th/id/OIP.ARWzhhHJcYE6h_v-yw_klQHaD3?rs=1&pid=ImgDetMain'),
      Workshop('Art Therapy Session', 'Art Studio', 'Express yourself through art and find healing in this therapeutic session.', 'https://th.bing.com/th/id/OIP._WdjE6DuJGGnq1q3icbh6gHaD4?rs=1&pid=ImgDetMain'),
    ];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Workshops Near You"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (workshopsNearMe.isEmpty)
                Text('No workshops found near you.'),
              for (var workshop in workshopsNearMe)
                WorkshopCard(
                  workshop: workshop,
                  onDetailsClicked: () {
                    Navigator.of(context).pop();
                    _showWorkshopDetailsDialog(context, workshop);
                  },
                ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }

  void _showWorkshopDetailsDialog(BuildContext context, Workshop workshop) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(workshop.title),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.network(workshop.imageUrl),
              Text('Location: ${workshop.location}'),
              SizedBox(height: 8),
              Text('Details: ${workshop.details}'),
              SizedBox(height: 8),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }
}

class Workshop {
  final String title;
  final String location;
  final String details;
  final String imageUrl;

  Workshop(this.title, this.location, this.details, this.imageUrl);
}

class WorkshopCard extends StatelessWidget {
  final Workshop workshop;
  final VoidCallback onDetailsClicked;

  WorkshopCard({required this.workshop, required this.onDetailsClicked});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(workshop.title),
        subtitle: Text(workshop.location),
        onTap: onDetailsClicked,
      ),
    );
  }
}

class MentorshipEvent {
  final String title;
  final String location;
  final String details;
  final String image;

  MentorshipEvent({
    required this.title,
    required this.location,
    required this.details,
    required this.image,
  });
}

class MentorshipList extends StatelessWidget {
  final List<MentorshipEvent> mentorshipEvents = [
    MentorshipEvent(
      title: 'Empowerment Seminar',
      location: 'Mumbai, Maharashtra',
      details: 'Join us for an interactive seminar focused on empowerment and personal growth.',
      image: 'https://th.bing.com/th/id/R.21436eb3159041110fa5504937416007?rik=uNh%2fm72bR27qIg&pid=ImgRaw&r=0',
    ),
    MentorshipEvent(
      title: 'Career Guidance Session',
      location: 'Bengaluru, Karnataka',
      details: 'Get valuable insights into building a successful career. Open to all participants.',
      image: 'https://www.careerguide.com/career/wp-content/uploads/2021/07/1600356731_career-counselling.jpg',
    ),
    MentorshipEvent(
      title: 'Health and Wellness Webinar',
      location: 'Online',
      details: 'Learn about maintaining mental and physical well-being in our virtual health and wellness webinar.',
      image: 'https://th.bing.com/th/id/OIP.A4XFLouVdI8_3qlFvLYLEgHaE8?rs=1&pid=ImgDetMain',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: mentorshipEvents.length,
      itemBuilder: (context, index) {
        return MentorshipCard(event: mentorshipEvents[index]);
      },
    );
  }
}

class MentorshipCard extends StatelessWidget {
  final MentorshipEvent event;

  MentorshipCard({required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(event.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(event.image),
            Text("Location: ${event.location}"),
            Text("Details: ${event.details}"),
          ],
        ),
        onTap: () {
          // Code to handle tapping on a mentorship event
          // You can navigate to a detailed page about the selected event
        },
      ),
    );
  }
}