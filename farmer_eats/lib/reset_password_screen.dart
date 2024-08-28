import 'package:flutter/material.dart';
import 'login_screen.dart';  // Import the Login screen

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _isPasswordMatching() {
    return _newPasswordController.text == _confirmPasswordController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,  // Set background color to white
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Text(
              "Farmer Eats",
              style: TextStyle(
                fontFamily: 'BeVietnamPro',
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 100),
            Text(
              "Reset Password",
              style: TextStyle(
                fontFamily: 'BeVietnamPro',
                fontSize: 32,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Text(
                  "Remember your password?",
                  style: TextStyle(
                    fontFamily: 'BeVietnamPro',
                    fontStyle: FontStyle.italic,
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen())); // Navigate back to the Login screen
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontFamily: 'BeVietnamPro',
                      fontStyle: FontStyle.italic,
                      fontSize: 14,
                      color: Color(0xFFD5715B),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: _newPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'New Password',
                        prefixIcon: Icon(Icons.lock),
                        filled: true,
                        fillColor: Colors.grey[200],  // Light grey background
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,  // Remove border side
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Confirm New Password',
                        prefixIcon: Icon(Icons.lock),
                        filled: true,
                        fillColor: Colors.grey[200],  // Light grey background
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,  // Remove border side
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_isPasswordMatching()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        } else {
                          // Show an error if passwords do not match
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Passwords do not match"),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          fontFamily: 'BeVietnamPro',
                          fontStyle: FontStyle.italic,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFD5715B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 120.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
