import 'package:college_app/home_page.dart';
import 'package:college_app/screen/auth_screen/login_screen.dart';
import 'package:college_app/screen/home_screen.dart';
import 'package:college_app/screen/pdf_screen.dart';
import 'package:college_app/screen/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MP College App',
      debugShowCheckedModeBanner: false,
      home: Home_Screen(),
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
    );
  }
}
