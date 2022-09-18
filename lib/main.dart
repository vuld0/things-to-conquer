import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:things_to_conquer/screens/signin.dart';
import 'package:things_to_conquer/screens/signup.dart';
import './screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.black));
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Things to Conquer',
      home: SignIn(),
    );
  }
}