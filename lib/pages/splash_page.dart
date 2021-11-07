import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/helpers/delay_helper.dart';
import 'package:help_for_hire_flutter_app/widgets/logo_widget.dart';

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
          children: const [
            LogoWidget(),
            Text(
              'Please be patient while loading occurs...',
            ),
            SizedBox(
              height: 32,
            ),
            CircularProgressIndicator(
              color: Colors.teal,
            ),
          ],
        ),
      ),
    );
  }
}
