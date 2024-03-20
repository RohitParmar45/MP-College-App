import 'package:college_app/screen/select_college_course.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool _isLoading = false;

  Future<void> _signup() async {
    setState(() {
      _isLoading = true;
    });

    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _password.text,
      );

      if (userCredential.user != null) {
        String uid = userCredential.user!.uid;

        // Store user details in Firestore
        await _firestore.collection('users').doc(uid).set({
          'name': _nameController.text,
          'email': _emailController.text,
          'mobile': _mobileController.text,
          'password': _password.text,
        });

        // Store user details in Shared Preferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('name', _nameController.text);
        prefs.setString('email', _emailController.text);
        prefs.setString('mobile', _mobileController.text);
        prefs.setString('uid', uid); // Store the unique ID (UID) in SharedPreferences

        // Navigate to the next screen or perform any action you need
        // For example:
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NextScreen()));
      }
    } catch (e) {
      print("Error: $e");
      // Handle error
    }

      _isLoading = false;
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return SelectCollegeCourse();
      }));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _mobileController,
              decoration: InputDecoration(labelText: 'Mobile Number'),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _password,
              decoration: InputDecoration(labelText: 'Password'),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _signup,
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
