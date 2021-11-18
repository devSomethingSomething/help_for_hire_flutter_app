import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/widgets/app_bars/app_bar_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/terms_and_conditions_text_widget.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';

class TermsAndConditionsPage extends StatefulWidget {
  const TermsAndConditionsPage();

  @override
  State<TermsAndConditionsPage> createState() => _TermsAndConditionsPageState();
}

class _TermsAndConditionsPageState extends State<TermsAndConditionsPage> {
  bool _isClicked = false;
  bool _displayErrorText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        data: 'Terms and conditions',
      ),
      body: Center(
        child: Column(
          children: [
            Flexible(
                flex: 10,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListView(
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
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                            color: Colors.blue.shade900,
                          ),
                          child: Row(
                            children: [
                              Checkbox(
                                activeColor: Colors.white,
                                checkColor: Colors.blue.shade900,
                                value: _isClicked,
                                onChanged: (_) {
                                  setState(() {
                                    _isClicked = !_isClicked;
                                  });

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
                )),
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.blue.shade900),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (_isClicked) {
                          Navigator.pushNamed(
                              context, RouteManager.registrationSuccessPage);
                        } else {
                          setState(
                            () {
                              _displayErrorText = true;
                            },
                          );
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        child: Text(
                          'submit',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    _displayErrorText
                        ? const Text(
                            'please read the Terms and accept to continue.',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 10,
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
