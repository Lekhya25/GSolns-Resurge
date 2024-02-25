import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Help extends StatelessWidget {
  final String youtubeVideoUrl = "https://www.youtube.com/";
  final String googleFormUrl = "https://docs.google.com/forms/d/e/1FAIpQLSdUaeR7r7z8QCOJzep3vSx1dD75jRjTRcFiSia0Ag2VESkOAQ/viewform";
  final String feedbackEmail = "feedback@resurgeapp.org";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Help & Feedback'),
          centerTitle: true,
          backgroundColor: Colors.blue[900],
          bottom: TabBar(
            tabs: [
              Tab(text: 'Tutorial'),
              Tab(text: 'Feedback'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            WebView(
              initialUrl: youtubeVideoUrl,
              javascriptMode: JavascriptMode.unrestricted,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Feedback Form:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('Please provide your feedback through the following form:'),
                  SizedBox(height: 5),
                  ElevatedButton(
                    onPressed: () {
                      // Open the Google Form in a webview
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WebView(
                            initialUrl: googleFormUrl,
                            javascriptMode: JavascriptMode.unrestricted,
                          ),
                        ),
                      );
                    },
                    child: Text('Open Feedback Form'),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Alternatively, you can send an email to:',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    feedbackEmail,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
