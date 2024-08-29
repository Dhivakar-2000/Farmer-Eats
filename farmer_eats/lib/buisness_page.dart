import 'package:flutter/material.dart';
import 'finish_page.dart';

class BusinessPage extends StatefulWidget {
  @override
  _BusinessPageState createState() => _BusinessPageState();
}

class _BusinessPageState extends State<BusinessPage> {
  // A list to keep track of the selected time slots
  List<bool> selectedTimeSlots = List.generate(5, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Text(
              "FarmerEats",
              style: TextStyle(
                fontFamily: 'BeVietnamPro',
                fontSize: 22,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Signup 4 of 4",
              style: TextStyle(
                fontFamily: 'BeVietnamPro',
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 40),
            Text(
              "Business Hours",
              style: TextStyle(
                fontFamily: 'BeVietnamPro',
                fontSize: 32,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Please select your available hours.",
              style: TextStyle(
                fontFamily: 'BeVietnamPro',
                fontSize: 15,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
            Text(
              "You can change this later in your settings.",
              style: TextStyle(
                fontFamily: 'BeVietnamPro',
                fontSize: 15,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDaySquare("M", Colors.grey),
                _buildDaySquare("T", Colors.grey),
                _buildDaySquare("W", Colors.grey),
                _buildDaySquare("Th", Color(0xFFD5715B)),
                _buildDaySquare("F", Colors.white),
                _buildDaySquare("S", Colors.white),
                _buildDaySquare("Su", Colors.white),
              ],
            ),
            SizedBox(height: 30),
            _buildTimeSlotRow(0, "8:00 AM - 10:00 AM", "10:00 AM - 1:00 PM"),
            SizedBox(height: 10),
            _buildTimeSlotRow(2, "1:00 PM - 4:00 PM", "4:00 PM - 7:00 PM"),
            SizedBox(height: 10),
            _buildTimeSlot("7:00 PM - 10:00 PM", 4),
            SizedBox(height: 250), // Added spacing to position the buttons higher
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black,size: 40,),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                     Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FinishPage(),
                        ),
                      );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFD5715B),
                    padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDaySquare(String day, Color color) {
    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey),
      ),
      child: Text(
        day,
        style: TextStyle(
          fontFamily: 'BeVietnamPro',
          fontSize: 16,
          fontStyle: FontStyle.italic,
          color: color == Colors.white ? Colors.black : Colors.white,
        ),
      ),
    );
  }

  Widget _buildTimeSlotRow(int index1, String time1, String time2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTimeSlot(time1, index1),
        SizedBox(width: 10),
        _buildTimeSlot(time2, index1 + 1),
      ],
    );
  }

  Widget _buildTimeSlot(String time, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTimeSlots[index] = !selectedTimeSlots[index];
        });
      },
      child: Container(
        width: (MediaQuery.of(context).size.width - 68) / 2,
        padding: EdgeInsets.symmetric(vertical: 16.0),
        decoration: BoxDecoration(
          color: selectedTimeSlots[index] ? Color(0XFFF8C569) : Colors.grey[200],//#F8C569
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          time,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'BeVietnamPro',
            fontSize: 16,
            fontStyle: FontStyle.italic,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
