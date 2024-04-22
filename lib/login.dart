
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:madproject/Signup.dart';
import 'Home.dart';


class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/blacktheme.jpg"), // Replace 'assets/image_name.png' with your actual image path
          fit: BoxFit.cover,

        ),
      ),

      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.1),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 115),
              child: Text("Welcome", style: TextStyle(color: Color(0xFFFB2576) , fontSize:60 , fontWeight: FontWeight.w700)),
            ),
            Container(
              padding: EdgeInsets.only(left: 35, top: 165),
              child: Text("Back!", style: TextStyle(color: Color(0xFFFB2576).withOpacity(0.9), fontSize:55 , fontWeight: FontWeight.w500)),
            ),
            Container(
              padding: EdgeInsets.only(left: 35, top: 225),
              child: Text("Hey! Good to see u again", style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize:20 , fontWeight: FontWeight.w500)),
            ),
            Container(
              padding: EdgeInsets.only(left: 40, top: 320),
              child: Text("Sign in", style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize:50 , fontWeight: FontWeight.w700)),
            ),

            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.6, right: 40,left: 40),
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
                      height: 20,
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
                              'Sign me in',
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.black, // Change the text color here
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center, // Horizontally aligns the children to the center
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MySignUp()),
                              );
                            },
                            child: Text(
                              "Don't have an account, need help?",
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
