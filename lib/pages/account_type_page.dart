import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/widgets/cards/account_type_card_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/dividers/divider_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/gradients/blue_gradient_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/headers/header_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/large_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/small_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text/white_heading_text_widget.dart';

class AccountTypePage extends StatelessWidget {
  const AccountTypePage();

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
                      data: 'Account Type',
                    ),
                    const SmallSpacerWidget(),
                    const DividerWidget(
                      height: 4.0,
                      width: 256.0,
                    ),
                    const SmallSpacerWidget(),
                    const Icon(
                      Icons.supervised_user_circle_rounded,
                      color: Colors.white,
                      size: 128.0,
                    ),
                    const SmallSpacerWidget(),
                    const WhiteHeadingTextWidget(
                      data: 'Select an account type',
                    ),
                    const LargeSpacerWidget(),
                    AccountTypeCardWidget(
                      leadingIcon: Icons.hail_rounded,
                      headingText: 'Employer',
                      descriptionText: 'Can hire day workers',
                      detailsHeadingText: 'Employer Details',
                      detailsDescriptionText: 'Employers may browse and select '
                          'profiles. They may also choose to invite worker account '
                          'types to jobs',
                      onTap: () => Navigator.pushNamed(
                        context,
                        RouteManager.employerRegisterPage,
                      ),
                    ),
                    const SmallSpacerWidget(),
                    AccountTypeCardWidget(
                      leadingIcon: Icons.emoji_people_rounded,
                      headingText: 'Worker',
                      descriptionText: 'Can take on jobs',
                      detailsHeadingText: 'Worker Details',
                      detailsDescriptionText: 'Workers may take on jobs from '
                          'employer account types. Workers can accept or decline '
                          'invites',
                      onTap: () => Navigator.pushNamed(
                        context,
                        RouteManager.workerRegisterPage,
                      ),
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
