import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/widgets/gradients/blue_gradient_widget.dart';

class LocationPage extends StatelessWidget {
  const LocationPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          BlueGradientWidget(),
        ],
      ),
    );
  }
}
