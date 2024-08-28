import 'package:flutter/material.dart';
import 'reset_password_screen.dart';  // Import the Reset Password screen
import 'login_screen.dart';  // Import the Login screen

class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> _controllers = List.generate(6, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  @override
  void initState() {
    super.initState();

    // Add listeners to handle OTP input
    for (int i = 0; i < _controllers.length; i++) {
      _controllers[i].addListener(() {
        if (_controllers[i].text.length == 1) {
          if (i < _controllers.length - 1) {
            FocusScope.of(context).requestFocus(_focusNodes[i + 1]);
          }
        }
      });
    }
  }

  @override
  void dispose() {
    // Dispose of controllers and focus nodes
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
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
              "Forgot Password?",
              style: TextStyle(
                fontFamily: 'BeVietnamPro',
                fontSize: 32,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 20),  // Adjusted space
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
            SizedBox(height: 20),  // Adjusted space
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(5, (index) {
                        return SizedBox(
                          width: 60,
                          height: 60,
                          child: TextField(
                            controller: _controllers[index],
                            focusNode: _focusNodes[index],
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            maxLength: 1,  // Restrict input to a single character
                            decoration: InputDecoration(
                              counterText: '',  // Hide character counter
                              filled: true,
                              fillColor: Colors.grey[200],  // Light grey background
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none,  // Remove border side
                              ),
                            ),
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                if (index < 5) {
                                  FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                                }
                              }
                            },
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResetPasswordScreen(),
                          ),
                        );
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
                            vertical: 10.0, horizontal: 100.0),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        // Handle resend code
                      },
                      child: Text(
                        "Resend Code",
                        style: TextStyle(
                          fontFamily: 'BeVietnamPro',
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                        ),
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
