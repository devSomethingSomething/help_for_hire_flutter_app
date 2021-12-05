import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/helpers/delay_helper.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/services/firebase_service.dart';
import 'package:help_for_hire_flutter_app/services/user_service.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/rounded_button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/dividers/divider_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/gradients/blue_gradient_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/headers/header_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/medium_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/small_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text/white_heading_text_widget.dart';
import 'package:provider/provider.dart';

class TermsAndConditionsPage extends StatelessWidget {
  final _termsAndConditions = const [
    'THESE TERMS OF USE WERE UPDATED IN OCTOBER 2021.',
    'THESE TERMS OF USE APPLY TO THE USE OF THE (HELP FOR HIRE) MOBILE APPLICATION.',
    'AND THE (HELP FOR HIRE) SERVICES. '
        'PLEASE READ THESE TERMS OF USE CAREFULLY. '
        'BY USING THE (HELP FOR HIRE) MOBILE APPLICATION YOU INDICATE YOUR UNDERSTANDING AND ACCEPTANCE OF THESE TERMS OF USE. '
        'IF YOU DO NOT AGREE TO THESE TERMS OF USE, YOU MUST NOT USE THE (HELP FOR HIRE) MOBILE APPLICATION.',
    'PRIVACY POLICY',
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
        'AS A RESULT, ALL SECTIONS OF THIS PRIVACY POLICY MUST BE INTERPRETED WITH CAUTION, TO THE EXTENT NECESSARY, TO ENSURE THAT THE CPA, ECTA, AND POPI ARE FOLLOWED.',
  ];

  const TermsAndConditionsPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    const SmallSpacerWidget(),
                    const DividerWidget(
                      height: 4.0,
                      width: 256.0,
                    ),
                    const SmallSpacerWidget(),
                    const WhiteHeadingTextWidget(
                      data: 'Please read the T&Cs carefully',
                    ),
                    const SmallSpacerWidget(),
                    Container(
                      child: ListView.separated(
                        itemBuilder: (_, index) {
                          return Text(
                            _termsAndConditions[index],
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.justify,
                          );
                        },
                        separatorBuilder: (_, __) {
                          return const SmallSpacerWidget();
                        },
                        itemCount: _termsAndConditions.length,
                        padding: const EdgeInsets.all(
                          16.0,
                        ),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      height: MediaQuery.of(context).size.height * 0.60,
                    ),
                    const MediumSpacerWidget(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundedButtonWidget(
                          data: 'DECLINE',
                          onPressed: () => showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                actions: [
                                  TextButton(
                                    child: const Text(
                                      'NO',
                                    ),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                  TextButton(
                                    child: const Text(
                                      'YES',
                                    ),
                                    onPressed: () async {
                                      DelayHelper.showLoadingIndicator(
                                        context: context,
                                      );

                                      await FirebaseService.deleteUser(
                                        id: context
                                            .read<UserService>()
                                            .currentUser
                                            .userId,
                                      );

                                      DelayHelper.hideLoadingIndicator(
                                        context: context,
                                      );

                                      Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        RouteManager.signInRegisterPage,
                                        (_) => false,
                                      );
                                    },
                                  ),
                                ],
                                content: const Text(
                                  'This will cancel your registration with Help for Hire',
                                ),
                                title: const Text(
                                  'Decline T&Cs?',
                                ),
                              );
                            },
                          ),
                          reduceSize: true,
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                        RoundedButtonWidget(
                          data: 'ACCEPT',
                          onPressed: () async {
                            DelayHelper.showLoadingIndicator(context: context);

                            // Register the new user
                            await context.read<UserService>().registerUser(
                                  context: context,
                                );

                            DelayHelper.hideLoadingIndicator(context: context);

                            Navigator.pushNamed(
                              context,
                              RouteManager.registrationSuccessPage,
                            );

                            // await FirebaseService.handleOtp(
                            //   context: context,
                            //   phoneNumber: context
                            //       .read<UserService>()
                            //       .currentUser
                            //       .phoneNumber,
                            //   routeName: RouteManager.registrationSuccessPage,
                            // );
                          },
                          reduceSize: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
