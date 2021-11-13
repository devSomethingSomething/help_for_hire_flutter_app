import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/widgets/app_bars/app_bar_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/elevated_button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/icon_widget.dart';

class OtpPage extends StatelessWidget {
  const OtpPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'OTP',
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const IconWidget(
                icon: Icons.perm_device_information_rounded,
              ),
              const Text(
                'Enter your OTP',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Enter your OTP below to reset your password',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: const TextField(
                  cursorColor: Colors.teal,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.teal,
                      ),
                    ),
                    label: Text(
                      'OTP',
                    ),
                    floatingLabelStyle: TextStyle(
                      color: Colors.teal,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Never got the OTP?',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  TextButton(
                    child: const Text(
                      'Click here to resend',
                      style: TextStyle(
                        color: Colors.teal,
                      ),
                    ),
                    onPressed: () {},
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all<Color>(
                        Colors.teal.shade50,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              const ElevatedButtonWidget(
                data: 'SUBMIT',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
