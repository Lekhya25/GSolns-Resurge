import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              image: AssetImage('images/template_cpy.jpg'), // Replace with the path to your image asset
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
                      },
                    ),
                    // Sign Up text
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
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
                        'Login',
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
                            icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
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
                      SizedBox(height: 8),
                      // Forget the password text
                      TextButton(
                        onPressed: () {
                          // Implement forget password functionality
                          print('Forget the password pressed');
                        },
                        child: Text(
                          'Forget the password?',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () {
                          // Perform login logic here
                          String email = _emailController.text;
                          String password = _passwordController.text;

                          // Add your authentication logic here, for example, check against a predefined email and password
                          if (_isEmailValid && _isPasswordValid) {
                            // Successful login
                            print('Login successful');
                          } else {
                            // Failed login
                            print('Login failed');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFFA8F1E4), // Background color
                          onPrimary: Colors.white, // Text color
                          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                        ),
                        child: const Text('Login'),
                      ),

                      const SizedBox(height: 40),

                      // "or login with" text
                      Text(
                        'or login with',
                        style: GoogleFonts.playfairDisplay(color: Colors.black, fontSize: 30, fontWeight: FontWeight.normal),
                      ),

                      SizedBox(height: 40),

                      // Google Icon
                      Image.asset(
                        'images/google.png', // Replace with the path to your Google icon asset
                        width: 40,
                        height: 40,
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
    RegExp regex = RegExp(r'^(?=.*[A-Z])(?=.*[!@#$%^&*(),.?":{}|<>])(?=.*\d).{8,}$');
    return regex.hasMatch(value);
  }
}
