import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/widgets/app_bar_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text_field_widget.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Change password',
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
                'Change your Password',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFieldWidget(
                data: 'Enter old password',
                obscureText: true,
                icon: true,
              ),
              TextFieldWidget(
                data: 'Enter new password',
                obscureText: true,
                icon: true,
              ),
              TextFieldWidget(
                data: 'Repeat new password',
                obscureText: true,
                icon: true,
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
