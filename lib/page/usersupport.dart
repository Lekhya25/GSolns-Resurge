import 'package:flutter/material.dart';

class UserSupportPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Support & Counseling'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact Information:',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50),
            Text('For Support', style: TextStyle(fontSize:20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text('Email: support@resurgeapp.org',style: TextStyle(fontSize:16)),
            SizedBox(height: 30),
            Text('For Counseling', style: TextStyle(fontSize:20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text('Email: counseling@resurgeapp.org',style: TextStyle(fontSize:16)),
            SizedBox(height: 30),
            Text('Child line India:',style: TextStyle(fontSize:20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text('Website: http://www.childlineindia.org.in/',style: TextStyle(fontSize:16)),
            SizedBox(height: 10),
            Text('Email: dial1098@childlineindia.org.in',style: TextStyle(fontSize:16)),
            SizedBox(height: 10),
            Text('Phone: 91-022-2388 1098',style: TextStyle(fontSize:16)),
            // Add more helpline numbers as needed
          ],
        ),
      ),
    );
  }
}