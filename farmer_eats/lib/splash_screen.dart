import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';  // Import the login screen

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final CarouselController _controller = CarouselController();
  int _currentIndex = 0;

  final List<Map<String, dynamic>> splashData = [
    {
      "image": "assets/images/image1.png",
      "title": "Quality",
      "description1": "  Sell your farm fresh products directly to   ",
      "description2": " consumers, cutting out the middleman and",
      "description3": "reducing emissions of the global supply chain.",
      "buttonColor": Color(0xFF5EA25F)
,
    },
    {
      "image": "assets/images/image2.png",
      "title": "Convenient",
      "description1": "Our team of delivery drivers will make sure ",
      "description2": " your orders are picked up on time and ",
      "description3": "  promptly delivered to your customers.",
      "buttonColor": Color(0xFFD5715B),
    },
    {
      "image": "assets/images/image3.png",
      "title": "Local",
      "description1": "We love the earth and know you do too! Join us  ",
      "description2": "in reducing our local carbon footprint one order ",
      "description3": "        at a time.",
      "buttonColor": Color(0xFFF8C569),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: CarouselSlider(
              items: splashData.map((item) {
                return Image.asset(
                  item['image']!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                );
              }).toList(),
              options: CarouselOptions(
                height: double.infinity,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              carouselController: _controller,
            ),
          ),
          Expanded(
            flex: 5,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 20),
                        Text(
                          splashData[_currentIndex]['title']!,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          splashData[_currentIndex]['description1']!,
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          splashData[_currentIndex]['description2']!,
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          splashData[_currentIndex]['description3']!,
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(splashData.length, (index) {
                            return AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              height: 8.0,
                              width: _currentIndex == index ? 24.0 : 8.0,
                              decoration: BoxDecoration(
                                color: _currentIndex == index
                                    ? Colors.black
                                    : Colors.grey,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            );
                          }),
                        ),
                        SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: () {
                            // Navigate to another screen if needed
                          },
                          child: Text("Join The Movement",
                          style: TextStyle(color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: splashData[_currentIndex]['buttonColor'],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 32.0),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Navigate to the Login Screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.black,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
