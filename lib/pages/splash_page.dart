import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:help_for_hire_flutter_app/helpers/delay_helper.dart';

class SplashPage extends StatefulWidget {
  const SplashPage();

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    DelayHelper.delayTimer(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(
                32.0,
              ),
              child: Image.asset(
                'assets/images/help_for_hire_tb.png',
              ),
            ),
            Text(
              'Please be patient while loading occurs...',
              style: GoogleFonts.aladin(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const CircularProgressIndicator(
              color: Colors.teal,
            ),
          ],
        ),
      ),
    );
  }
}
