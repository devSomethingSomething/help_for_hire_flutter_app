import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:help_for_hire_flutter_app/helpers/delay_helper.dart';
import 'package:help_for_hire_flutter_app/services/firebase_service.dart';
import 'package:help_for_hire_flutter_app/widgets/logos/logo_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/medium_spacer_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage();

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // This has to be above the super call according to the documentation
    // However, after doing some tests, it seems to work the same even if it is
    // after the super call
    FirebaseService.initialize();

    super.initState();

    DelayHelper.delayTimer(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LogoWidget(),
            Text(
              'Please be patient while loading occurs...',
              style: GoogleFonts.lobster(
                fontSize: 18.0,
              ),
            ),
            const MediumSpacerWidget(),
            CircularProgressIndicator(
              color: Colors.blue[900],
            ),
          ],
        ),
      ),
    );
  }
}
