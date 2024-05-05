import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Home.dart';
import 'login.dart';

class MySignUp extends StatefulWidget {
  const MySignUp({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<MySignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _signUpWithEmailAndPassword(BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      // Navigate to the Get Started page after successful sign-up
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()), // Replace Home() with the desired class
      );

    } catch (e) {
      print('Failed to create user: $e');
      // Handle sign-up errors here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/blacksu.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.1),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 125),
              child: Text("Sign up",
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 65,
                      fontWeight: FontWeight.w500)),
            ),
            Container(
              padding: EdgeInsets.only(left: 35, top: 220),
              child: Text("We are happy to see you here!",
                  style: TextStyle(
                      color: Color(0xFFFB2576),
                      fontSize: 20,
                      fontWeight: FontWeight.w700)),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: 375, right: 36, left: 36),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
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
                            borderSide: BorderSide(color: Color(0xFFFB2576)), // The color when the field is focused
                          ),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Color(0xFFFB2576).withOpacity(0.6),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          // You can add more complex email validation if needed
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        style: TextStyle(color: Colors.white70),
                        decoration: InputDecoration(
                          fillColor: Colors.transparent,
                          filled: true,
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.white70.withOpacity(0.8)),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFB2576).withOpacity(0.8)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFB2576)), // The color when the field is focused
                          ),
                          prefixIcon: Icon(
                            Icons.app_registration,
                            color: Color(0xFFFB2576).withOpacity(0.6),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          }
                          // You can add more complex password validation if needed
                          return null;
                        },
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        controller: _confirmPasswordController,
                        style: TextStyle(color: Colors.white70),
                        obscureText: true,
                        decoration: InputDecoration(
                          fillColor: Colors.transparent,
                          filled: true,
                          hintText: 'Confirm Password',
                          hintStyle: TextStyle(color: Colors.white70.withOpacity(0.8)),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFB2576).withOpacity(0.8)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFB2576)), // The color when the field is focused
                          ),
                          prefixIcon: Icon(
                            Icons.password_rounded,
                            color: Color(0xFFFB2576).withOpacity(0.7),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _signUpWithEmailAndPassword(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30), // Change the shape here
                          ),
                          backgroundColor: Colors.white70.withOpacity(0.5), // Change the button color here
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 45),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.black, // Change the text color here
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
