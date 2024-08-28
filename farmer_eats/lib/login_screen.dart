import 'package:flutter/material.dart';
import 'signup_screen.dart';  // Import the sign-up screen
import 'forgot_password_screen.dart';  // Import the forgot password screen

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Text(
                "Farmer Eats",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'BeVietnamPro',
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 70),
              Text(
                "Welcome Back",
                style: TextStyle(
                  fontSize: 32,
                  fontFamily: 'BeVietnamPro',
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "New here?",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'BeVietnamPro',
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      // Navigate to the sign-up page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Create account",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'BeVietnamPro',
                        fontStyle: FontStyle.italic,
                        color: Color(0xFFD5715B), // Set color to #D5715B
                        // No underline
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 60),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: SizedBox(
                    width: 24,
                    height: 24,
                    child: Icon(
                      Icons.email,
                      size: 18,
                      color: Colors.grey,
                    ),
                  ),
                  hintText: "Email address",
                  hintStyle: TextStyle(fontFamily: 'BeVietnamPro', fontStyle: FontStyle.italic),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: SizedBox(
                    width: 24,
                    height: 24,
                    child: Icon(
                      Icons.lock,
                      size: 18,
                      color: Colors.grey,
                    ),
                  ),
                  hintText: "Password",
                  hintStyle: TextStyle(fontFamily: 'BeVietnamPro', fontStyle: FontStyle.italic),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      // Navigate to the forgot password page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgotPasswordScreen(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 16.0, top: 15.0),
                      child: Text(
                        "Forgot?",
                        style: TextStyle(
                          fontFamily: 'BeVietnamPro',
                          fontStyle: FontStyle.italic,
                          color: Color(0xFFD5715B), // Set color to #D5715B
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // Handle login
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFD5715B), // Set color to #D5715B
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0), // More curved corners
                  ),
                ),
                child: Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontFamily: 'BeVietnamPro',
                      color: Colors.white,
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Center(
                child: Text(
                  "Or login with",
                  style: TextStyle(
                    fontFamily: 'BeVietnamPro',
                    fontStyle: FontStyle.italic,
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: IconButton(
                      icon: Image.asset('assets/images/google.png'),
                      iconSize: 24, // Adjust this value for appropriate icon size
                      onPressed: () {
                        // Handle Google login
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Flexible(
                    child: IconButton(
                      icon: Image.asset('assets/images/apple.png'),
                      iconSize: 24, // Adjust this value for appropriate icon size
                      onPressed: () {
                        // Handle Apple login
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Flexible(
                    child: IconButton(
                      icon: Image.asset('assets/images/facebook.png'),
                      iconSize: 24, // Adjust this value for appropriate icon size
                      onPressed: () {
                        // Handle Facebook login
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
