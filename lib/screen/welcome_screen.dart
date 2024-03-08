import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.66,
        child: Stack(children: [
          Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(60),
                  ),
                  color: Colors.blueAccent,
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.66,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.66,
                child: Center(
                    child: Image.asset(
                  "assets/image/study_chair.png",
                  scale: 0.8,
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: MediaQuery.of(context).size.width * 0.66 / 1.2,
                )),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Expanded(
              child: Stack(children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.34,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(60))),
                ),
              ]),
            ),
          )
        ]),
      ),
    );
  }
}
