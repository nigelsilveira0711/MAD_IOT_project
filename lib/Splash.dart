import 'dart:async';
import 'login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {

  @override
  State<Splash> createState() => SplashState();
}



class SplashState extends State<Splash>{

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyLogin()));
    });
  }
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Container(
            child: Center(
                child: Icon(
                    Icons.lightbulb_circle,
                  size : 100
                )
            ),
            color: Colors.pink.shade400
        ),

      );
    }

  }
