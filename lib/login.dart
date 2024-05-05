
import 'package:flutter/material.dart';
import 'package:madproject/Signup.dart';
import 'Home.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signInWithEmailAndPassword(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        if (userCredential.user != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Home()),
          );
        }
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message ?? 'An error occurred during sign-in'),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('An unexpected error occurred during sign-in'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/blacktheme.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
            backgroundColor: Colors.black.withOpacity(0.1),
            body: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 35, top: 115),
                        child: Text("Welcome",
                            style: TextStyle(
                                color: Color(0xFFFB2576),
                                fontSize: 60,
                                fontWeight: FontWeight.w700)),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 35, top: 165),
                        child: Text("Back!",
                            style: TextStyle(
                                color: Color(0xFFFB2576).withOpacity(0.9),
                                fontSize: 55,
                                fontWeight: FontWeight.w500)),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 35, top: 225),
                        child: Text("Hey! Good to see u again",
                            style: TextStyle(
                                color: Colors.grey.withOpacity(0.9),
                                fontSize: 20,
                                fontWeight: FontWeight.w500)),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 40, top: 320),
                        child: Text("Sign in",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 50,
                                fontWeight: FontWeight.w700)),
                      ),
                      SingleChildScrollView(
                          child: Container(
                              padding: EdgeInsets.only(
                                  top: MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.6,
                                  right: 40,
                                  left: 40),
                              child: Form(
                                  key: _formKey,
                                  child: Column(
                                      children: [
                                        TextFormField(
                                          controller: _emailController,
                                          style: TextStyle(color: Colors
                                              .white70),
                                          decoration: InputDecoration(
                                            fillColor: Colors.transparent,
                                            filled: true,
                                            hintText: 'Email',
                                            hintStyle:
                                            TextStyle(color: Colors.white70
                                                .withOpacity(0.8)),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide:
                                              BorderSide(
                                                  color: Color(0xFFFB2576)
                                                      .withOpacity(0.8)),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xFFFB2576)),
                                            ),
                                            prefixIcon: Icon(
                                              Icons.email,
                                              color: Color(0xFFFB2576)
                                                  .withOpacity(0.6),
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter your email';
                                            }
                                            if (!value.contains('@')) {
                                              return 'Please enter a valid email';
                                            }
                                            return null;
                                          },
                                        ),
                                        SizedBox(height: 30),
                                        TextFormField(
                                          controller: _passwordController,
                                          style: TextStyle(color: Colors
                                              .white70),
                                          obscureText: true,
                                          decoration: InputDecoration(
                                            fillColor: Colors.transparent,
                                            filled: true,
                                            hintText: 'Password',
                                            hintStyle:
                                            TextStyle(color: Colors.white70
                                                .withOpacity(0.8)),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide:
                                              BorderSide(
                                                  color: Color(0xFFFB2576)
                                                      .withOpacity(0.8)),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white70),
                                            ),
                                            prefixIcon: Icon(
                                              Icons.password_rounded,
                                              color: Color(0xFFFB2576)
                                                  .withOpacity(0.7),
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter your password';
                                            }
                                            if (value.length < 6) {
                                              return 'Password must be at least 6 characters long';
                                            }
                                            return null;
                                          },
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        ElevatedButton(
                                          onPressed: () =>
                                              _signInWithEmailAndPassword(
                                                  context),
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius
                                                  .circular(30),
                                            ),
                                            backgroundColor: Colors.white70
                                                .withOpacity(0.7),
                                          ),
                                          child: Padding(
                                            padding:
                                            EdgeInsets.only(left: 45,
                                                top: 10,
                                                right: 45,
                                                bottom: 10),
                                            child: Text(
                                              'Sign me in',
                                              style: TextStyle(
                                                fontSize: 22,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Center(
                                            child: Row(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (
                                                                  context) =>
                                                                  MySignUp()),
                                                        );
                                                      },
                                                      child: Text(
                                                          "Don't have an account, need help?",
                                                          style: TextStyle(
                                                            decoration: TextDecoration
                                                                .underline,
                                                            fontSize: 14,
                                                          )
                                                      )
                                                  )
                                                ]
                                            )
                                        )
                                      ])
                              )
                          )
                      )
                    ])
            )
        )
    );
  }
}
