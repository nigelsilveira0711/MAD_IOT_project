import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'Signup.dart';
import 'login.dart';
import 'Bedroom.dart';
import 'package:madproject/Lobby.dart';
import 'Kitchen.dart';
import 'Dining.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Homestate();
}

class _Homestate extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // State variables to track the state of the bulb effects
  bool bulbEffectEnabled1 = true; // For light bulb 1
  bool bulbEffectEnabled2 = true; // For light bulb 2
  bool bulbEffectEnabled3 = true; // For light bulb 3
  bool bulbEffectEnabled4 = true; // For light bulb 4
  bool bulbEffectEnabled5 = true; // For light bulb 5
  bool bulbEffectEnabled6 = true; // For light bulb 6

  // State variable for the toggle switch
  bool _isSwitchOn = false; // Initialize it as true initially

  // Method to toggle the switch
  void _toggleSwitch(bool value) {
    setState(() {
      _isSwitchOn = value;
      // Update bulb effect state variables based on switch state
      bulbEffectEnabled1 = value;
      bulbEffectEnabled2 = value;
      bulbEffectEnabled3 = value;
      bulbEffectEnabled4 = value;
      bulbEffectEnabled5 = value;
      bulbEffectEnabled6 = value;
    });
  }

  bool isHovering1 = false;
  bool isHovering2 = false;
  bool isHovering3 = false;
  bool isHovering4 = false;

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
          Positioned(
            top: 120,
            left: 240,
            child: Row(
              children: [
                Icon(
                  Icons.power_settings_new,
                  color: Color(0xFFFB2576).withOpacity(0.6),
                  size: 40,
                ),
                Text(
                  '',
                  style: TextStyle(
                    color: Color(0xFFFB2576).withOpacity(0.6),
                    fontSize: 20, fontWeight: FontWeight.w400,
                  ),
                ),
                Switch(
                  value: _isSwitchOn,
                  onChanged: (value) {
                    setState(() {
                      _isSwitchOn = value;
                    });
                  },
                  activeColor: Color(0xFFFB2576),
                  inactiveThumbColor: Color(0xFFFB2576).withOpacity(0.9),
                ),

              ],
            ),
          ),
          Positioned(
            top: 145, // Adjust position as needed
            left: 20, // Adjust position as needed
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.7), // Adjust opacity here
                BlendMode.dstATop,
              ),
              child: Image.asset(
                'assets/layout.jpg', // Path to your overlay image
                width: 320, // Adjust size as needed
                height: 400, // Adjust size as needed
              ),
            ),
          ),

          // Light bulb 1 effect
          Switch(
            value: _isSwitchOn,
            onChanged: _toggleSwitch,
            activeColor: Color(0xFFFB2576),
            inactiveThumbColor: Color(0xFFFB2576).withOpacity(0.9),
          ),

              // Light bulb effects
          Positioned(
            top: 190,
            left: 20,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 500),
              opacity: _isSwitchOn ? 1.0 : 0.0,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    bulbEffectEnabled1 = !bulbEffectEnabled1;
                  });
                },
                child: Container(
                  width: 100,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: bulbEffectEnabled1
                        ? RadialGradient(
                      colors: [
                        Colors.white.withOpacity(1.0),
                        Colors.transparent,
                      ],
                    )
                        : null,
                  ),
                ),
              ),
            ),
          ),
          // Other widgets can be added on top of the images
          // Light bulb 2 effect
          Switch(
            value: _isSwitchOn,
            onChanged: _toggleSwitch,
            activeColor: Color(0xFFFB2576),
            inactiveThumbColor: Color(0xFFFB2576).withOpacity(0.9),
          ),

          // Light bulb effects
          Positioned(
            top: 240,
            left: 260,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 500),
              opacity: _isSwitchOn ? 1.0 : 0.0,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    bulbEffectEnabled2 = !bulbEffectEnabled2;
                  });
                },
                child: Container(
                  width: 100,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: bulbEffectEnabled2
                        ? RadialGradient(
                      colors: [
                        Colors.white.withOpacity(1.0),
                        Colors.transparent,
                      ],
                    )
                        : null,
                  ),
                ),
              ),
            ),
          ),
          // Light bulb 3 effect
          Switch(
            value: _isSwitchOn,
            onChanged: _toggleSwitch,
            activeColor: Color(0xFFFB2576),
            inactiveThumbColor: Color(0xFFFB2576).withOpacity(0.9),
          ),

          // Light bulb effects
          Positioned(
            top: 350,
            left: 40,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 500),
              opacity: _isSwitchOn ? 1.0 : 0.0,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    bulbEffectEnabled3 = !bulbEffectEnabled3;
                  });
                },
                child: Container(
                  width: 100,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: bulbEffectEnabled3
                        ? RadialGradient(
                      colors: [
                        Colors.white.withOpacity(1.0),
                        Colors.transparent,
                      ],
                    )
                        : null,
                  ),
                ),
              ),
            ),
          ),
          // Light bulb 4 effect
          Switch(
            value: _isSwitchOn,
            onChanged: _toggleSwitch,
            activeColor: Color(0xFFFB2576),
            inactiveThumbColor: Color(0xFFFB2576).withOpacity(0.9),
          ),

          // Light bulb effects
          Positioned(
            top: 330,
            left: 200,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 500),
              opacity: _isSwitchOn ? 1.0 : 0.0,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    bulbEffectEnabled4 = !bulbEffectEnabled4;
                  });
                },
                child: Container(
                  width: 100,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: bulbEffectEnabled4
                        ? RadialGradient(
                      colors: [
                        Colors.white.withOpacity(1.0),
                        Colors.transparent,
                      ],
                    )
                        : null,
                  ),
                ),
              ),
            ),
          ),
          // Light bulb 5 effect
          Switch(
            value: _isSwitchOn,
            onChanged: _toggleSwitch,
            activeColor: Color(0xFFFB2576),
            inactiveThumbColor: Color(0xFFFB2576).withOpacity(0.9),
          ),

          // Light bulb effects
          Positioned(
            top: 115,
            left: 120,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 500),
              opacity: _isSwitchOn ? 1.0 : 0.0,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    bulbEffectEnabled5 = !bulbEffectEnabled5;
                  });
                },
                child: Container(
                  width: 100,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: bulbEffectEnabled5
                        ? RadialGradient(
                      colors: [
                        Colors.white.withOpacity(1.0),
                        Colors.transparent,
                      ],
                    )
                        : null,
                  ),
                ),
              ),
            ),
          ),
          // Light bulb 6 effect
          Switch(
            value: _isSwitchOn,
            onChanged: _toggleSwitch,
            activeColor: Color(0xFFFB2576),
            inactiveThumbColor: Color(0xFFFB2576).withOpacity(0.9),
          ),

          // Light bulb effects
          Positioned(
            top: 115,
            left: 210,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 500),
              opacity: _isSwitchOn ? 1.0 : 0.0,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    bulbEffectEnabled6 = !bulbEffectEnabled6;
                  });
                },
                child: Container(
                  width: 100,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: bulbEffectEnabled6
                        ? RadialGradient(
                      colors: [
                        Colors.white.withOpacity(1.0),
                        Colors.transparent,
                      ],
                    )
                        : null,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 560,
            left: 20,
            child: MouseRegion(
              onHover: (_) {
                setState(() {
                  isHovering1 = true;
                });
              },
              onExit: (_) {
                setState(() {
                  isHovering1 = false;
                });
              },
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Bedroom()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(05), // Change the shape here
                  ),
                  backgroundColor: isHovering1
                      ? Color(0xFFFB2576).withOpacity(0.8)  // Change the button color when hovered
                      :  Color(0xFFFB2576).withOpacity(0.2), // Default button color
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child:
                  Icon(
                    Icons.bed,
                    color: Colors.white70.withOpacity(0.6),
                    size: 40,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 560,
            left: 190,
            child: MouseRegion(
              onHover: (_) {
                setState(() {
                  isHovering2 = true;
                });
              },
              onExit: (_) {
                setState(() {
                  isHovering2 = false;
                });
              },
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Lobby()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(05), // Change the shape here
                  ),
                  backgroundColor: isHovering2
                      ? Color(0xFFFB2576).withOpacity(0.8)  // Change the button color when hovered
                      :  Color(0xFFFB2576).withOpacity(0.2), // Default button color
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child:
                  Icon(
                    Icons.meeting_room,
                    color: Colors.white70.withOpacity(0.6),
                    size: 40,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 660,
            left: 20,
            child: MouseRegion(
              onHover: (_) {
                setState(() {
                  isHovering3 = true;
                });
              },
              onExit: (_) {
                setState(() {
                  isHovering3 = false;
                });
              },
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Kitchen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(05), // Change the shape here
                  ),
                  backgroundColor: isHovering3
                      ? Color(0xFFFB2576).withOpacity(0.8)  // Change the button color when hovered
                      :  Color(0xFFFB2576).withOpacity(0.2), // Default button color
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child:
                  Icon(
                    Icons.kitchen,
                    color: Colors.white70.withOpacity(0.6),
                    size: 40,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 660,
            left: 190,
            child: MouseRegion(
              onHover: (_) {
                setState(() {
                  isHovering4 = true;
                });
              },
              onExit: (_) {
                setState(() {
                  isHovering4 = false;
                });
              },
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Dining()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(05), // Change the shape here
                  ),
                  backgroundColor: isHovering4
                      ? Color(0xFFFB2576).withOpacity(0.8)  // Change the button color when hovered
                      :  Color(0xFFFB2576).withOpacity(0.2), // Default button color
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child:
                  Icon(
                    Icons.dining,
                    color: Colors.white70.withOpacity(0.6),
                    size: 40,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 110,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFFB2576).withOpacity(1.0), // Change the start color here
                  Colors.transparent // Change the end color here
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
                padding: EdgeInsets.only(top: 20,left:21,right: 140),
                child: Text(
                  'Contol Panel',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: Colors.white70.withOpacity(0.6), // Change the text color here
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 35,
            right: 20,
            child: IconButton(
              color: Color(0xFFFB2576).withOpacity(0.6),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyLogin()),
                );
              },
              icon: Icon(Icons.logout_outlined, size: 40),
            ),
          ),
        ],
      ),
    );
  }
}
