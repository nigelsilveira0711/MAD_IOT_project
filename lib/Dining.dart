import 'package:flutter/material.dart';
import 'package:madproject/Home.dart';

class Dining extends StatefulWidget {
  const Dining({Key? key}) : super(key: key);

  @override
  State<Dining> createState() => _DiningState();
}

class _DiningState extends State<Dining> {
  double _brightness = 0.5; // Initial brightness level

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.1),
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/home.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Light bulb with radial gradient
          Positioned(
            top: 250,
            left: 5,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Colors.yellow.withOpacity(_brightness), // Inner color
                    Colors.transparent, // Outer color
                  ],
                ),
              ),
              child: Icon(
                Icons.lightbulb,
                color: Colors.yellowAccent.withOpacity(_brightness), // Adjust brightness
                size: 350,
              ),
            ),
          ),

          // Slider for brightness control
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Slider(
              value: _brightness,
              onChanged: (value) {
                setState(() {
                  _brightness = value;
                });
              },
              min: 0.0,
              max: 1.0,
              divisions: 100,
              label: _brightness.toStringAsFixed(2),
              activeColor: Colors.yellowAccent,
            ),
          ),
          Container(
            height: 120,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.yellowAccent.withOpacity(0.7), // Change the start color here
                  Colors.white70.withOpacity(0.1), // Change the end color here
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: ElevatedButton(
              onPressed: () {
                // Add your button action here
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Change the shape here
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent), // Make the button transparent
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 20,left:31,right: 190),
                child: Text(
                  'Dining',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: Colors.white, // Change the text color here
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: IconButton(
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()));
              },
              icon: Icon(Icons.arrow_back, size: 40),
            ),

          ),
        ],
      ),
    );
  }
}
