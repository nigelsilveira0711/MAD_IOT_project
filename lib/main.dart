
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:madproject/Splash.dart';
import 'package:madproject/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login':(context) => Splash()
    },
  ));
}