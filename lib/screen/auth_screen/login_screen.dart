import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController textNum = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Center(
        child: Scaffold(
          body: Center(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(50),
                child: TextField(
                  controller: textNum,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.phone),
                      hintText: 'Enter Your Mobile Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      )),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) {
                    //   LoginScreen();
                    // }));
                  },
                  child: Text("Get OTP"))
            ]),
          ),
        ),
      ),
    );
  }
}
