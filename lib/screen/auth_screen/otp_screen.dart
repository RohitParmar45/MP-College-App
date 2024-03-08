import 'package:flutter/material.dart';

class Otp_Screen extends StatefulWidget {
  const Otp_Screen({super.key});

  @override
  State<Otp_Screen> createState() => _Otp_ScreenState();
}

class _Otp_ScreenState extends State<Otp_Screen> {
  TextEditingController otp_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Scaffold(
          body: Center(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(50),
                child: TextField(
                  controller: otp_controller,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.phone),
                      hintText: 'Enter OTP',
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
                  child: Text("Submit"))
            ]),
          ),
        ),
      ),
    );
  }
}
