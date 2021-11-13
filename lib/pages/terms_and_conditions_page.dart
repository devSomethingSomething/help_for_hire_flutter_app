import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/widgets/app_bars/app_bar_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/terms_and_conditions_text_widget.dart';

class TermsAndConditionsPage extends StatefulWidget {
  const TermsAndConditionsPage();

  @override
  State<TermsAndConditionsPage> createState() => _TermsAndConditionsPageState();
}

class _TermsAndConditionsPageState extends State<TermsAndConditionsPage> {
  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Terms and conditions',
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const TermsAndConditionsTextWidget(),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.all(
                  16.0,
                ),
                child: Text(
                    'BY CHECKING THIS BOX YOU AGREE TO THE ABOVE TERMS AND CONDITIONS\n',
                    textAlign: TextAlign.justify),
              ),
              Container(
                color: Colors.pink,
                child: Row(
                  children: [
                    Checkbox(
                      activeColor: Colors.white,
                      checkColor: Colors.pink,
                      value: _isClicked,
                      onChanged: (_) {
                        setState(
                          () => _isClicked = !_isClicked,
                        );

                        // if (_isClicked) {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(
                        //       content: Text(
                        //         'ACCEPTED',
                        //       ),
                        //     ),
                        //   );
                        // } else {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(
                        //       content: Text(
                        //         'DECLINED',
                        //       ),
                        //     ),
                        //   );
                        // }
                      },
                    ),
                    const Text(
                      'I ACCEPT THE TERMS AND CONDITIONS',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
