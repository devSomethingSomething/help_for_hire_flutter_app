import 'package:flutter/material.dart';

class ExpandedButtonWidget extends StatelessWidget {
  final String _data;

  const ExpandedButtonWidget({
    required String data,
  }) : _data = data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              right: 50.0,
              left: 50.0,
            ),
            child: SizedBox(
              height: 50.0,
              child: ElevatedButton(
                child: Text(
                  _data,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ),
        ),
      ],
    );
  }
}
