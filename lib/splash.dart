import 'dart:async';

import 'package:flutter/material.dart';
import 'package:typing_tutior/Index.dart';
import 'package:typing_tutior/main_page.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => SplashState();
}

class SplashState extends State<Splash> {
  startTime() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
                                  //index page will replace hear
        context, MaterialPageRoute(builder: (context) => Index_page()));
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF41586c),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/splash_screen/ic_logo.png'),
                const Text(
                  'TYPING TUTOR',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: CircularProgressIndicator(
                    color: Colors.deepOrange,
                    strokeWidth: 5,
                  ),
                ),
              ],
            ),
            Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Color(0xDDFFFFFFF),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Image.asset(height: 70,
                                "assets/devloper_screen_images/DU_Logo.png")),
                        Expanded(
                            child: Image.asset(height: 90,
                                "assets/devloper_screen_images/ASWDC.png"))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
