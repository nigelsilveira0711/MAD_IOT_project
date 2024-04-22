import 'package:flutter/material.dart';
import 'package:madproject/login.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login':(context) => MyLogin()
    },
  ));
}