import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:college_app/firebase_options.dart';
import 'package:college_app/home_page.dart';
import 'package:college_app/screen/ai_chat_bot/ChatPage.dart';
import 'package:college_app/screen/ai_chat_bot/model.dart';
import 'package:college_app/screen/auth_screen/login_screen.dart';
import 'package:college_app/screen/home_screen.dart';
import 'package:college_app/screen/main_screen.dart';
import 'package:college_app/screen/pdf_screen.dart';
import 'package:college_app/screen/see_all_course.dart';
import 'package:college_app/screen/select_college_course.dart';
import 'package:college_app/screen/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseFirestore.instance.settings =
      const Settings(persistenceEnabled: true);
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
      home: SignupPage(),
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
    );
  }
}
