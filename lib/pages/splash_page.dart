import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    var imageHeight = MediaQuery.of(context).size.height;
    var imageWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/help_for_hire_tb.png',
              width: imageWidth / 1.5,
              height: imageHeight * 0.25,

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text('Please be patient while loading occurs...',
                        style: GoogleFonts.aladin(
                          fontSize: 20,
                          color: Colors.black,
                        )),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            CircularProgressIndicator(
              color: Colors.teal,
            ),
          ],
        ),
      ),
    );
  }

  void delayTimer() {
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed('homePage');
    });
  }

  void initState() {
    super.initState();
    delayTimer();
  }
}