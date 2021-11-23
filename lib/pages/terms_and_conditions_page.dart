import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/rounded_button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/dividers/divider_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/headers/header_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/medium_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/small_spacer_widget.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(
            16.0,
          ),
          child: Center(
            child: Column(
              children: [
                const HeaderWidget(
                  data: 'T&Cs',
                ),
                const DividerWidget(
                  height: 4.0,
                  width: 256.0,
                ),
                const SmallSpacerWidget(),
                Container(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.65,
                    child: ListView(
                      children: const [
                        // T&Cs need to be reviewed before they are added in
                        // For now leave it as placeholder text until we are
                        // sure that the T&Cs are correct
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                          'Praesent at erat metus. Morbi congue orci ut pellentesque aliquet. '
                          'Mauris bibendum dolor ultricies aliquet egestas. '
                          'Donec pulvinar eu nulla non pretium. '
                          'Duis sed nulla nec turpis pulvinar vehicula. '
                          'Mauris vehicula quam sit amet purus pharetra vehicula. '
                          'Morbi eu eros pharetra, dictum dolor ac, sollicitudin sem. '
                          'Nulla condimentum id massa sit amet tempus.',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        SmallSpacerWidget(),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                          'Praesent at erat metus. Morbi congue orci ut pellentesque aliquet. '
                          'Mauris bibendum dolor ultricies aliquet egestas. '
                          'Donec pulvinar eu nulla non pretium. '
                          'Duis sed nulla nec turpis pulvinar vehicula. '
                          'Mauris vehicula quam sit amet purus pharetra vehicula. '
                          'Morbi eu eros pharetra, dictum dolor ac, sollicitudin sem. '
                          'Nulla condimentum id massa sit amet tempus.',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        SmallSpacerWidget(),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                          'Praesent at erat metus. Morbi congue orci ut pellentesque aliquet. '
                          'Mauris bibendum dolor ultricies aliquet egestas. '
                          'Donec pulvinar eu nulla non pretium. '
                          'Duis sed nulla nec turpis pulvinar vehicula. '
                          'Mauris vehicula quam sit amet purus pharetra vehicula. '
                          'Morbi eu eros pharetra, dictum dolor ac, sollicitudin sem. '
                          'Nulla condimentum id massa sit amet tempus.',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        SmallSpacerWidget(),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                          'Praesent at erat metus. Morbi congue orci ut pellentesque aliquet. '
                          'Mauris bibendum dolor ultricies aliquet egestas. '
                          'Donec pulvinar eu nulla non pretium. '
                          'Duis sed nulla nec turpis pulvinar vehicula. '
                          'Mauris vehicula quam sit amet purus pharetra vehicula. '
                          'Morbi eu eros pharetra, dictum dolor ac, sollicitudin sem. '
                          'Nulla condimentum id massa sit amet tempus.',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        SmallSpacerWidget(),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                          'Praesent at erat metus. Morbi congue orci ut pellentesque aliquet. '
                          'Mauris bibendum dolor ultricies aliquet egestas. '
                          'Donec pulvinar eu nulla non pretium. '
                          'Duis sed nulla nec turpis pulvinar vehicula. '
                          'Mauris vehicula quam sit amet purus pharetra vehicula. '
                          'Morbi eu eros pharetra, dictum dolor ac, sollicitudin sem. '
                          'Nulla condimentum id massa sit amet tempus.',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                  padding: const EdgeInsets.all(
                    16.0,
                  ),
                ),
                const MediumSpacerWidget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundedButtonWidget(
                      data: 'DECLINE',
                      // There should be some kind of popup to ask the user if
                      // they really wish to decline the T&Cs
                      onPressed: () => Navigator.pushNamedAndRemoveUntil(
                        context,
                        RouteManager.signInRegisterPage,
                        (_) => false,
                      ),
                      reduceSize: true,
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    RoundedButtonWidget(
                      data: 'ACCEPT',
                      // Should actually be the OTP page but since it does not
                      // work on virtual devices, we have to leave it out for
                      // now
                      onPressed: () => Navigator.pushNamed(
                        context,
                        RouteManager.registrationSuccessPage,
                      ),
                      reduceSize: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
