import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/pages/otp_page.dart';

void main() {
  runApp(
    const _App(),
  );
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const OtpPage(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.teal,
        ),
      ),
    );
  }
}
