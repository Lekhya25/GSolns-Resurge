import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resurge2/main.dart';
import 'package:resurge2/page/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true;
  bool _isEmailValid = false;
  bool _isPasswordValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/images/background.png'), // Same image path as login page
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Back button
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        // Implement back button functionality
                        print('Back button pressed');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                    ),
                    // Login text with button
                    TextButton(
                      onPressed: () {
                        // Implement login navigation functionality
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainPage(),
                          ),
                        );
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 90),
                      Text(
                        'Sign Up',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: _emailController,
                        onChanged: (value) {
                          setState(() {
                            _isEmailValid = EmailValidator.validate(value);
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'Email',
                          suffixIcon: _isEmailValid
                              ? Icon(Icons.check, color: Colors.green)
                              : null,
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: _passwordController,
                        obscureText: _isObscure,
                        onChanged: (value) {
                          setState(() {
                            _isPasswordValid = _validatePassword(value);
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(_isObscure
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      if (!_isPasswordValid)
                        const Text(
                          'Password must contain at least one uppercase letter, one special character, and be at least 8 characters long.',
                          style: TextStyle(color: Colors.red),
                        ),
                      SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () {
                          // Perform signup logic here
                          String email = _emailController.text;
                          String password = _passwordController.text;

                          // Add your signup logic here, for example, validate the form fields and register the user
                          if (_isEmailValid && _isPasswordValid) {
                            // Successful signup
                            print('Signup successful');
                          } else {
                            // Failed signup
                            print('Signup failed');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color(0xFFA8F1E4), // Background color
                          foregroundColor: Colors.white, // Text color
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 10),
                        ),
                        child: const Text('Sign Up'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _validatePassword(String value) {
    // Password must contain one uppercase letter, one special character, and be at least 8 characters long
    RegExp regex =
        RegExp(r'^(?=.*[A-Z])(?=.*[!@#$%^&*(),.?":{}|<>])(?=.*\d).{8,}$');
    return regex.hasMatch(value);
  }
}
