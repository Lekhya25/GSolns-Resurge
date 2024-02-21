import 'package:flutter/material.dart';

class MentorshipPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mentorship Programs'),
        centerTitle: true,
        backgroundColor: Colors.red,
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
                // Code to access user's location and fetch workshops near them
                Navigator.of(context).pop();
                // Simulating the workshops near the user
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
    // Simulated workshops near the user
    List<String> workshopsNearMe = [
      'Workshop 1',
      'Workshop 2',
      'Workshop 3',
    ];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Workshops Near You"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (workshopsNearMe.isEmpty) Text('No workshops found near you.'),
              for (var workshop in workshopsNearMe)
                ListTile(
                  title: Text(workshop),
                  onTap: () {
                    // Code to handle tapping on a workshop
                    Navigator.of(context).pop(); // Close the dialog
                    // You can navigate to a detailed page about the selected workshop
                  },
                ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }
}

class MentorshipList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Simulated mentorship/workshop events
    List<String> mentorshipEvents = [
      'Mentorship Event 1',
      'Mentorship Event 2',
      'Mentorship Event 3',
    ];

    return ListView.builder(
      itemCount: mentorshipEvents.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(mentorshipEvents[index]),
          // onTap: () {
          //   // Code to handle tapping on a mentorship event
          //   // You can navigate to a detailed page about the selected event
          // },
        );
      },
    );
  }
}
