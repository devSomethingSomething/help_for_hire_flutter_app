import 'package:flutter/material.dart';

class AccountTypeCardWidget extends StatelessWidget {
  final String _data;

  final void Function() _onTap;

  const AccountTypeCardWidget({
    required String data,
    required void Function() onTap,
  })  : _data = data,
        _onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Row(
          children: [
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(
                  16.0,
                ),
                child: Placeholder(
                  color: Colors.black,
                  strokeWidth: 3.0,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _data,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            16.0,
          ),
          color: Colors.white,
        ),
        height: MediaQuery.of(context).size.height * 0.25,
      ),
      onTap: _onTap,
    );
  }
}
