/// Imports
import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/location_constants.dart';
import 'package:help_for_hire_flutter_app/helpers/connection_helper.dart';
import 'package:help_for_hire_flutter_app/helpers/delay_helper.dart';
import 'package:help_for_hire_flutter_app/helpers/snack_bar_helper.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/services/location_service.dart';
import 'package:help_for_hire_flutter_app/services/user_service.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/rounded_button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/dividers/divider_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/gradients/blue_gradient_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/headers/header_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/medium_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/small_spacer_widget.dart';
import 'package:provider/provider.dart';

/// This page allows a user to choose their location
/// They need to choose the Province and City
class LocationPage extends StatefulWidget {
  /// Constructor
  const LocationPage();

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  /// The _key variable is used to validate form fields
  final _key = GlobalKey<FormState>();

  /// Variables
  String? _city;

  /// Build the widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BlueGradientWidget(),
          SafeArea(
            /// Single child scroll view is used to prevent overflow and makes
            /// the page scrollable
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(
                16.0,
              ),
              child: Center(
                child: Column(
                  children: [
                    const HeaderWidget(
                      data: 'Location',
                    ),
                    const SmallSpacerWidget(),
                    const DividerWidget(
                      height: 4.0,
                      width: 256.0,
                    ),
                    const SmallSpacerWidget(),
                    const Text(
                      'Please select your location',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const MediumSpacerWidget(),
                    Padding(
                      padding: const EdgeInsets.all(
                        16.0,
                      ),
                      child: Form(
                        key: _key,
                        child: Column(
                          children: [
                            Container(
                              child: DropdownButtonFormField<String>(
                                decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  labelText: 'Select Province',
                                  errorStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                iconSize: 28.0,

                                /// Get the locations from the class LocationConstants
                                /// and convert it into a drop down menu item
                                items: LocationConstants.provinces
                                    .map(
                                      (value) => DropdownMenuItem(
                                        value: value,
                                        child: Text(
                                          value,
                                        ),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (province) async {
                                  DelayHelper.showLoadingIndicator(
                                      context: context);

                                  /// Ones a location has been selected the
                                  /// City drop down will display and get all the cities
                                  /// that is in the selected province
                                  await context
                                      .read<LocationService>()
                                      .getCitiesInProvince(
                                        province: province.toString(),
                                      );

                                  DelayHelper.hideLoadingIndicator(
                                      context: context);
                                },
                                validator: (value) => value == null
                                    ? 'Please select a province'
                                    : null,
                              ),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    8.0,
                                  ),
                                ),
                                color: Colors.white,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 8.0,
                              ),
                            ),
                            const MediumSpacerWidget(),
                            Consumer<LocationService>(
                              builder: (_, service, __) {
                                // For first page load
                                return service.locations.isEmpty
                                    ? Container()
                                    : Container(
                                        /// Select City drop down
                                        child: DropdownButtonFormField(
                                          decoration: const InputDecoration(
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.white,
                                              ),
                                            ),
                                            labelText: 'Select City',
                                            errorStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                          iconSize: 28.0,
                                          items: service.locations
                                              .map(
                                                (value) => DropdownMenuItem(
                                                  // Need this otherwise it breaks
                                                  value: value.city,
                                                  child: Text(
                                                    value.city,
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                          onChanged: (city) {
                                            _city = city.toString();
                                          },
                                          // Just need to make sure that there is
                                          // now a city in each province
                                          value: service.locations.first.city,
                                          validator: (value) => value == null
                                              ? 'Please select a city'
                                              : null,
                                        ),
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                              8.0,
                                            ),
                                          ),
                                          color: Colors.white,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0,
                                          vertical: 8.0,
                                        ),
                                      );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const MediumSpacerWidget(),
                    RoundedButtonWidget(
                      data: 'SUBMIT',
                      onPressed: () async {
                        if (_key.currentState!.validate()) {
                          if (await ConnectionHelper.hasConnection()) {
                            context.read<UserService>().currentUser.locationId =
                                context
                                    .read<LocationService>()
                                    .locations
                                    .firstWhere(
                                      (location) => location.city == _city,
                                    )
                                    .locationId;

                            /// Navigate to the Account Type Page
                            Navigator.pushNamed(
                              context,
                              RouteManager.accountTypePage,
                            );
                          } else {
                            SnackBarHelper.showSnackBar(
                              context: context,
                              data: 'No internet connection',
                            );
                          }
                        } else {
                          SnackBarHelper.showSnackBar(
                            context: context,
                            data: 'Please select a province and city',
                          );
                        }
                      },
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
