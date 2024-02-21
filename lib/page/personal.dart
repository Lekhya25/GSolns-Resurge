import 'package:flutter/material.dart';

class PersonalDetailsPage extends StatefulWidget {
  @override
  _PersonalDetailsPageState createState() => _PersonalDetailsPageState();
}

class _PersonalDetailsPageState extends State<PersonalDetailsPage> {
  String _name = '';
  String _gender = '';
  DateTime? _dob;
  String _skills = '';
  String _fieldsOfInterest = '';
  String _ngoDetails = '';
  String _preferredLocation = '';
  String _otherSpecifications = '';
  bool _isProfilePublic = false;

  void _updateProfileVisibility(bool value) {
    setState(() {
      _isProfilePublic = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Details'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Name'),
                onChanged: (value) {
                  setState(() {
                    _name = value;
                  });
                },
              ),
              SizedBox(height: 10),
              Text('Gender', style: TextStyle(fontSize: 16)),
              Row(
                children: [
                  Radio(
                    value: 'Male',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value.toString();
                      });
                    },
                  ),
                  Text('Male'),
                  Radio(
                    value: 'Female',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value.toString();
                      });
                    },
                  ),
                  Text('Female'),
                  Radio(
                    value: 'Other',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value.toString();
                      });
                    },
                  ),
                  Text('Other'),
                ],
              ),
              SizedBox(height: 10),
              Text('Date of Birth', style: TextStyle(fontSize: 16)),
              ElevatedButton(
                onPressed: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: _dob ?? DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (picked != null) {
                    setState(() {
                      _dob = picked;
                    });
                  }
                },
                child: Text(
                  _dob != null ? '$_dob' : 'Select Date',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(labelText: 'Skills'),
                onChanged: (value) {
                  setState(() {
                    _skills = value;
                  });
                },
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(labelText: 'Fields of Interest'),
                onChanged: (value) {
                  setState(() {
                    _fieldsOfInterest = value;
                  });
                },
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(labelText: 'NGO Details'),
                onChanged: (value) {
                  setState(() {
                    _ngoDetails = value;
                  });
                },
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(labelText: 'Preferred Location'),
                onChanged: (value) {
                  setState(() {
                    _preferredLocation = value;
                  });
                },
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(labelText: 'Other Specifications'),
                onChanged: (value) {
                  setState(() {
                    _otherSpecifications = value;
                  });
                },
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text('Make Profile Public'),
                  Switch(
                    value: _isProfilePublic,
                    onChanged: _updateProfileVisibility,
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle notify button press
                  // Here you can update the user's profile visibility
                },
                child: Text('Notify'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
