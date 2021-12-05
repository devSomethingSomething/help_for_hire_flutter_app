import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/color_constants.dart';
import 'package:help_for_hire_flutter_app/models/employer_model.dart';
import 'package:help_for_hire_flutter_app/models/location_model.dart';
import 'package:help_for_hire_flutter_app/models/user_model.dart';
import 'package:help_for_hire_flutter_app/services/employer_service.dart';
import 'package:help_for_hire_flutter_app/services/location_service.dart';
import 'package:help_for_hire_flutter_app/widgets/app_bars/app_bar_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/small_spacer_widget.dart';
import 'package:provider/provider.dart';

class SelectedEmployerProfilePage extends StatelessWidget {
  const SelectedEmployerProfilePage();

  @override
  Widget build(BuildContext context) {
    // ------------------------------------
    // Remove this testing code later
    // ------------------------------------
    // context.read<EmployerService>().employer = EmployerModel(
    //   companyName: 'Shaw Inc.',
    //   address: 'Somewhere in the Andromeda Galaxy',
    //   suburb: 'Sulaco',
    //   user: UserModel(
    //     userId: '1234567890123',
    //     name: 'Kaden',
    //     surname: 'Shaw',
    //     phoneNumber: '1234567890',
    //     locationId: '123',
    //   ),
    // );
    // ------------------------------------

    context.read<LocationService>().getLocation(
          id: context.read<EmployerService>().employer?.locationId ?? '',
        );

    return Scaffold(
      appBar: AppBarWidget(
        // Will need to add checks to ensure that the selected profile gets the
        // info from either the employer service or the user service as we have
        // the data in two places
        // This could be done by checking if a single value is empty for a
        // service and then just assigning the values or not
        data: '${context.read<EmployerService>().employer?.name} '
            '${context.read<EmployerService>().employer?.surname}',
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    child: Card(
                      child: Padding(
                        child: SizedBox(
                          child: Column(
                            children: [
                              const SizedBox(),
                              const Spacer(
                                flex: 3,
                              ),
                              Text(
                                '${context.read<EmployerService>().employer?.name} '
                                '${context.read<EmployerService>().employer?.surname}',
                                style: const TextStyle(
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SmallSpacerWidget(),
                              const Text(
                                'Shaw Inc.',
                                style: TextStyle(
                                  fontSize: 24.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const Spacer(),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                          ),
                          height: 175.0,
                        ),
                        padding: const EdgeInsets.all(
                          16.0,
                        ),
                      ),
                      elevation: 4.0,
                    ),
                    padding: const EdgeInsets.only(
                      top: 75.0,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: CircleAvatar(
                      backgroundColor: ColorConstants.darkBlue,
                      child: CircleAvatar(
                        backgroundColor: ColorConstants.white,
                        child: Icon(
                          Icons.person,
                          color: ColorConstants.darkBlue,
                          size: 128.0,
                        ),
                        radius: 70.0,
                      ),
                      radius: 75.0,
                    ),
                  ),
                ],
              ),
              Card(
                child: Padding(
                  child: SizedBox(
                    child: Column(
                      children: [
                        const Text(
                          'Other Details',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const Divider(
                          thickness: 2.0,
                        ),
                        const SmallSpacerWidget(),
                        Row(
                          children: [
                            const Text(
                              'Province:',
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                            Consumer<LocationService>(
                              builder: (_, service, __) {
                                return Text(
                                  service.location?.province ?? 'Province',
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                  ),
                                );
                              },
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                        const Divider(),
                        const SmallSpacerWidget(),
                        Row(
                          children: [
                            const Text(
                              'City:',
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                            Consumer<LocationService>(
                              builder: (_, service, __) {
                                return Text(
                                  service.location?.city ?? 'City',
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                  ),
                                );
                              },
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                        const Divider(),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                    ),
                    height: 175.0,
                  ),
                  padding: const EdgeInsets.all(
                    16.0,
                  ),
                ),
                elevation: 4.0,
              ),
            ],
          ),
        ),
        padding: const EdgeInsets.all(
          16.0,
        ),
      ),
    );
  }
}
