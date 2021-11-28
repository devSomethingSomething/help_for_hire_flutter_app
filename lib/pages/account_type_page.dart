import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/models/employer_model.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/services/user_service.dart';
import 'package:help_for_hire_flutter_app/widgets/cards/account_type_card_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/dividers/divider_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/gradients/blue_gradient_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/headers/header_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/large_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/small_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text/white_heading_text_widget.dart';
import 'package:provider/provider.dart';

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
                      detailsDescriptionText:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                          'Quisque suscipit dictum quam id lobortis. '
                          'Sed rhoncus ante in felis cursus porta. '
                          'Nulla gravida posuere venenatis. '
                          'Curabitur vitae risus at turpis tincidunt cursus. '
                          'Aenean ac leo vel dolor elementum lobortis non ac elit. '
                          'Sed convallis ex ac sapien tincidunt, cursus ullamcorper ipsum tempor. '
                          'Morbi eget interdum sapien. '
                          'Aenean sed enim lacinia, posuere lacus ac, gravida enim. '
                          'Aliquam massa quam, posuere ac mattis non, blandit ac dui. '
                          'Suspendisse vehicula quis arcu nec pharetra. '
                          'Maecenas vel placerat magna. '
                          'Aliquam vestibulum porta arcu, vel efficitur dolor dictum ultricies. '
                          'Vestibulum efficitur imperdiet purus vel efficitur.',
                      onTap: () {
                        context.read<UserService>().currentUser = EmployerModel(
                          user: context.read<UserService>().currentUser,
                        );

                        Navigator.pushNamed(
                          context,
                          RouteManager.termsAndConditionsPage,
                        );
                      },
                    ),
                    const SmallSpacerWidget(),
                    AccountTypeCardWidget(
                      leadingIcon: Icons.emoji_people_rounded,
                      headingText: 'Worker',
                      descriptionText: 'Can take on jobs',
                      detailsHeadingText: 'Worker Details',
                      detailsDescriptionText:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                          'Quisque suscipit dictum quam id lobortis. '
                          'Sed rhoncus ante in felis cursus porta. '
                          'Nulla gravida posuere venenatis. '
                          'Curabitur vitae risus at turpis tincidunt cursus. '
                          'Aenean ac leo vel dolor elementum lobortis non ac elit. '
                          'Sed convallis ex ac sapien tincidunt, cursus ullamcorper ipsum tempor. '
                          'Morbi eget interdum sapien. '
                          'Aenean sed enim lacinia, posuere lacus ac, gravida enim. '
                          'Aliquam massa quam, posuere ac mattis non, blandit ac dui. '
                          'Suspendisse vehicula quis arcu nec pharetra. '
                          'Maecenas vel placerat magna. '
                          'Aliquam vestibulum porta arcu, vel efficitur dolor dictum ultricies. '
                          'Vestibulum efficitur imperdiet purus vel efficitur.',
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
