import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/widgets/app_bars/app_bar_widget.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Reset password',
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Icon(
                Icons.lock_outline_rounded,
                color: Colors.grey,
                size: 144.0,
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Reset your Password',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Enter your phone number below to reset your password',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.90,
                child: const TextField(
                  cursorColor: Colors.teal,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.teal,
                      ),
                    ),
                    label: Text(
                      'Phone number',
                    ),
                    floatingLabelStyle: TextStyle(
                      color: Colors.teal,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  child: const Text(
                    'SUBMIT',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.teal,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
