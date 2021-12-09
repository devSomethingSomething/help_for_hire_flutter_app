/// Imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Custom Text container widget
class TextContainerWidget extends StatelessWidget {
  /// Variables
  final String contents;

  /// Constructor with required fields
  const TextContainerWidget({
    Key? key,
    required this.contents,
  }) : super(key: key);

  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 3, bottom: 3),
      child: Container(
        width: MediaQuery.of(context).size.width / 3 * 2,
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(
          width: 1,
          color: Colors.black,
        )),
        child: Center(
          child: Text(contents),
        ),
      ),
    );
  }
}
