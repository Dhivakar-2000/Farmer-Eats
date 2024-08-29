import 'package:flutter/material.dart';
import 'login_screen.dart';

class FinishPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 200,),
            // Big Green Tick Icon
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 100,
            ),
            SizedBox(height: 20),
            // "You're all done!" Text
            Text(
              "You're all done!",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontFamily: 'BeVietnamPro',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            // Three lines of text
            Text(
              "Thank you for setting up your account.\nYou can now access all features.\nFeel free to explore!",
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
                fontStyle: FontStyle.italic,
                fontFamily: 'BeVietnamPro',
              ),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            // "Got it!" Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFD5715B), // Color #D5715B
                  padding: EdgeInsets.symmetric(vertical: 12.0,horizontal: 80.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Text(
                  "Got it!",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20), // A bit higher than the bottom
          ],
        ),
      ),
    );
  }
}
