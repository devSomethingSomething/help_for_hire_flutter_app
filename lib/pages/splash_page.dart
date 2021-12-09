/// Imports
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:help_for_hire_flutter_app/helpers/delay_helper.dart';
import 'package:help_for_hire_flutter_app/widgets/logos/logo_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/medium_spacer_widget.dart';

/// Displays the splash page to the user
class SplashPage extends StatefulWidget {
  /// Constructor
  const SplashPage();

  /// Creates the state for this page
  @override
  _SplashPageState createState() => _SplashPageState();
}

/// State class for the splash page
class _SplashPageState extends State<SplashPage> {
  /// Gets called when the page is created
  @override
  void initState() {
    // This has to be above the super call according to the documentation
    // However, after doing some tests, it seems to work the same even if it is
    // after the super call
    // --- 2021/11/26 - This call now happens before the app runs
    // Should fix any issues we have had with firebase not initializing
    // correctly
    // FirebaseService.initialize();

    super.initState();

    // Allow the page to load for a few seconds while things like shared preferences
    // load
    DelayHelper.delayTimer(context);
  }

  /// Builds the widget
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
                color: Colors.black,
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
