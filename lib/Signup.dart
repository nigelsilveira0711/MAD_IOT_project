import 'package:gap/gap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Home.dart';
import 'login.dart';


class MySignUp extends StatefulWidget {
  const MySignUp({super.key});

  @override
  State<MySignUp> createState() => _MySignUpState();
}

class _MySignUpState extends State<MySignUp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/blacksu.png"), // Replace 'assets/image_name.png' with your actual image path
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.1),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 125),
              child: Text("Sign up", style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize:65 , fontWeight: FontWeight.w500)),
            ),
            Container(
              padding: EdgeInsets.only(left: 35, top: 220),
              child: Text("We are happy to see you here!", style: TextStyle(color: Color(0xFFFB2576), fontSize:20 , fontWeight: FontWeight.w700)),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: 375, right: 36,left: 36),
                child: Column(
                  children: [
                    TextField(
                      style: TextStyle(color: Colors.white70),
                      decoration: InputDecoration(
                        fillColor: Colors.transparent,
                        filled: true,
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.white70.withOpacity(0.8)),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFFB2576).withOpacity(0.8)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFFB2576) ), // The color when the field is focused
                        ),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Color(0xFFFB2576).withOpacity(0.6),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      style: TextStyle(color: Colors.white70),
                      decoration: InputDecoration(
                        fillColor: Colors.transparent,
                        filled: true,
                        hintText: 'Registration_ID',
                        hintStyle: TextStyle(color: Colors.white70.withOpacity(0.8)),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFFB2576).withOpacity(0.8)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFFB2576) ), // The color when the field is focused
                        ),
                        prefixIcon: Icon(
                          Icons.app_registration,
                          color: Color(0xFFFB2576).withOpacity(0.6),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      style: TextStyle(color: Colors.white70),
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: Colors.transparent,
                        filled: true,
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.white70.withOpacity(0.8)),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFFB2576).withOpacity(0.8)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white70), // The color when the field is focused
                        ),
                        prefixIcon: Icon(
                          Icons.password_rounded,
                          color: Color(0xFFFB2576).withOpacity(0.7),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Positioned(

                      child: Opacity(
                        opacity: 0.7, // Change the opacity here
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Home()));
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30), // Change the shape here
                            ),
                            backgroundColor: Colors.white70.withOpacity(0.5), // Change the button color here
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 45, top: 10,right: 45,bottom: 10),
                            child: Text(
                              'Sign up me',
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.black, // Change the text color here
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Gap(15),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center, // Horizontally aligns the children to the center
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MyLogin()),
                              );
                            },
                            child: Text(
                              "Already have an account?",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 14,
                                color: Color(0xFFFB2576).withOpacity(0.9),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
