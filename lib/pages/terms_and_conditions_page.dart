import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/rounded_button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/dividers/divider_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/gradients/blue_gradient_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/headers/header_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/medium_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/small_spacer_widget.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Stack(
        children: [
          const BlueGradientWidget(),
          SafeArea(
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
                            'THESE TERMS OF USE WERE UPDATED IN OCTOBER 2021',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          SmallSpacerWidget(),
                          Text(
                            'THESE TERMS OF USE APPLY TO THE USE OF THE (HELP FOR HIRE) MOBILE APPLICATION.',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          SmallSpacerWidget(),
                          Text(
                            'AND THE (HELP FOR HIRE) SERVICES. '
                            'PLEASE READ THESE TERMS OF USE CAREFULLY. '
                            'BY USING THE (HELP FOR HIRE) MOBILE APPLICATION YOU INDICATE YOUR UNDERSTANDING AND ACCEPTANCE OF THESE TERMS OF USE. '
                            'IF YOU DO NOT AGREE TO THESE TERMS OF USE, YOU MUST NOT USE THE (HELP FOR HIRE) MOBILE APPLICATION.\n',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          SmallSpacerWidget(),
                          Text(
                            'PRIVACY POLICY\n',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          SmallSpacerWidget(),
                          Text(
                            'THE PRIVACY POLICY IS A PART OF THESE TERMS. '
                            'BY ACCEPTING THESE TERMS, YOU ACKNOWLEDGE THAT YOU HAVE READ AND UNDERSTAND THEM. '
                            'IF YOU DO NOT COMPLY WITH ANY OF THE PRIVACY POLICY, THAT WILL BE A BREACH OF THE TERMS. '
                            'UNDER THE PRIVACY POLICY AND THE TERMS, (HELP FOR HIRE) MAY HAVE CLAIMS AND OTHER RIGHTS AGAINST YOU. '
                            'THIS (HELP FOR HIRE) PRIVACY POLICY APPLIES TO HOW WE COLLECT, USE AND PROCESS YOUR PERSONAL INFORMATION WHEN YOU USE THE (HELP FOR HIRE) MOBILE APPLICATION OR THE SERVICES PROVIDED BY (HELP FOR HIRE). '
                            'PLEASE READ THIS PRIVACY POLICY CAREFULLY. '
                            'THIS PRIVACY POLICY FORMS PART OF THE (HELP FOR HIRE) TERMS OF USE. '
                            'BY ACCESSING OR USING THE (HELP FOR HIRE) MOBILE APPLICATION OR THE SERVICES PROVIDED BY (HELP FOR HIRE) YOU ARE AGREEING TO THIS PRIVACY POLICY AND THE TERMS OF USE. '
                            'IF YOU DO NOT COMPLY WITH THE PRIVACY POLICY, THAT WILL ALSO BE A BREACH OF THE TERMS OF USE. '
                            '(HELP FOR HIRE) AND OTHERS WILL HAVE CLAIMS AND OTHER RIGHTS AGAINST YOU UNDER THE PRIVACY POLICY AND THE TERMS OF USE. '
                            'THIS PRIVACY POLICY FORMS PART OF THE (HELP FOR HIRE) TERMS OF USE. '
                            'BY ACCESSING OR USING THE (HELP FOR HIRE) MOBILE APPLICATION OR THE SERVICES PROVIDED BY (HELP FOR HIRE) YOU ARE AGREEING TO THIS PRIVACY POLICY AND THE TERMS OF USE. '
                            'IF YOU DO NOT COMPLY WITH THE PRIVACY POLICY, THAT WILL ALSO BE A BREACH OF THE TERMS OF USE. '
                            '(HELP FOR HIRE) AND OTHERS WILL HAVE CLAIMS AND OTHER RIGHTS AGAINST YOU UNDER THE PRIVACY POLICY AND THE TERMS OF USE. '
                            'IF THIS PRIVACY POLICY IS GOVERNED BY THE CONSUMER PROTECTION ACT, 68 OF 2008 ("CPA"), THE ELECTRONIC COMMUNICATIONS AND TRANSACTIONS ACT, 25 OF 2002 ("ECTA"), OR THE PROTECTION OF PERSONAL INFORMATION ACT, 4 OF 2013, ("POPI"), NO PROVISION OF THIS PRIVACY POLICY IS INTENDED TO BE IN CONFLICT WITH ANY PROVISION OF THE CPA, ECTA, OR POPI. '
                            'AS A RESULT, ALL SECTIONS OF THIS PRIVACY POLICY MUST BE INTERPRETED WITH CAUTION, TO THE EXTENT NECESSARY, TO ENSURE THAT THE CPA, ECTA, AND POPI ARE FOLLOWED.\n',
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
     ]),
    );
  }
}
