import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/pages/terms_and_conditions_page.dart';

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
      home: const TermsAndConditionsPage(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.teal,
        ),
        unselectedWidgetColor: Colors.white,
      ),
    );
  }
}
