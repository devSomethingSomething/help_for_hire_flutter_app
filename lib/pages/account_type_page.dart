import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/models/employer_model.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/services/user_service.dart';
import 'package:help_for_hire_flutter_app/widgets/cards/account_type_card_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/dividers/divider_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/headers/header_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/large_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/small_spacer_widget.dart';
import 'package:provider/provider.dart';

class AccountTypePage extends StatelessWidget {
  const AccountTypePage();

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
                  data: 'Account Type',
                ),
                const SmallSpacerWidget(),
                const DividerWidget(
                  height: 4.0,
                  width: 256.0,
                ),
                const SmallSpacerWidget(),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Select\nan account type',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32.0,
                    ),
                  ),
                ),
                const LargeSpacerWidget(),
                // Need an image here
                AccountTypeCardWidget(
                  data: 'Employer',
                  onTap: () {
                    // Since the employer account type does not have a register
                    // page this code is needed
                    // Ensures that when the account is created, it is the
                    // correct type
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
                const DividerWidget(
                  height: 4.0,
                  width: 192.0,
                ),
                const SmallSpacerWidget(),
                // Need an image here
                AccountTypeCardWidget(
                  data: 'Worker',
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
    );
  }
}
