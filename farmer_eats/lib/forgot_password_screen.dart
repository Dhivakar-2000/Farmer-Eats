import 'package:flutter/material.dart';
import 'login_screen.dart';  // Import the login screen
import 'otp_screen.dart';    // Import the OTP screen

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            SizedBox(height: 70),
            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.local_phone_outlined,
                  size: 18,
                  color: Colors.black,
                ),
                hintText: "Phone number",
                hintStyle: TextStyle(fontFamily: 'BeVietnamPro',fontStyle: FontStyle.italic),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () async {
                // Handle sending OTP and navigating to OTP screen
                // Here you should call your REST API to send the OTP
                // Example: await sendOtp(phoneNumber);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OtpScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFD5715B), // Button color
                padding: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: Center(
                child: Text(
                  "Send Code",
                  style: TextStyle(
                    fontFamily: 'BeVietnamPro',
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
