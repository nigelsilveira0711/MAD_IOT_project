import 'package:flutter/material.dart';
import 'package:madproject/Home.dart';

class Dining extends StatefulWidget {
  const Dining({Key? key}) : super(key: key);

  @override
  State<Dining> createState() => DiningState();
}

class DiningState extends State<Dining> {
  double _brightness = 0.5;
  Color _lightColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.1),
      body: Stack(
        children: [

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
                    _lightColor.withOpacity(_brightness), // Inner color
                    Colors.transparent, // Outer color
                  ],
                ),
              ),
              child: Icon(
                Icons.lightbulb,
                color: _lightColor.withOpacity(_brightness), // Adjust brightness
                size: 350,
              ),
            ),
          ),

          // Slider for brightness control
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Column(
              children: [
                Slider(
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
                  activeColor: Colors.white,
                ),
                SizedBox(height: 20),
                // Color picker
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Light Color:' , style: TextStyle(
                        fontSize: 18, // Change the font size here
                        color: Colors.white)),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        _pickColor();
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: _lightColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 120,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFFB2576).withOpacity(0.8).withOpacity(0.7), // Change the start color here
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
                backgroundColor:
                MaterialStateProperty.all<Color>(Colors.transparent), // Make the button transparent
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 20, left: 50, right: 185),
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
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              icon: Icon(Icons.arrow_back, size: 40),
            ),
          ),
        ],
      ),
    );
  }

  void _pickColor() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pick a color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              onSelectColor: (color) {
                setState(() {
                  _lightColor = color;
                });
                Navigator.of(context).pop();
              },
            ),
          ),
        );
      },
    );
  }
}

class ColorPicker extends StatelessWidget {
  final Function(Color) onSelectColor;

  const ColorPicker({Key? key, required this.onSelectColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Define your color options here
          _ColorOption(color: Colors.red, onSelectColor: onSelectColor),
          _ColorOption(color: Colors.blue, onSelectColor: onSelectColor),
          _ColorOption(color: Colors.green, onSelectColor: onSelectColor),
          _ColorOption(color: Colors.white, onSelectColor: onSelectColor),
          // Add more color options if needed
        ],
      ),
    );
  }
}

class _ColorOption extends StatelessWidget {
  final Color color;
  final Function(Color) onSelectColor;

  const _ColorOption({Key? key, required this.color, required this.onSelectColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelectColor(color);
      },
      child: Container(
        width: 30,
        height: 30,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
