import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/location_constants.dart';
import 'package:help_for_hire_flutter_app/models/location_model.dart';
import 'package:help_for_hire_flutter_app/services/location_service.dart';
import 'package:help_for_hire_flutter_app/widgets/dividers/divider_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/gradients/blue_gradient_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/headers/header_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/medium_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/small_spacer_widget.dart';
import 'package:provider/provider.dart';

class LocationPage extends StatefulWidget {
  const LocationPage();

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    context.read<LocationService>().getLocations();
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
                              child: DropdownButtonFormField(
                                decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  labelText: 'Province',
                                ),
                                iconSize: 28.0,
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
                                onChanged: (value) {},
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
                                return Container(
                                  child: DropdownButtonFormField(
                                    decoration: const InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                      labelText: 'City',
                                    ),
                                    iconSize: 28.0,
                                    items: service.locations
                                        .map(
                                          (value) => DropdownMenuItem(
                                            value: value,
                                            child: Text(
                                              value.city,
                                            ),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (value) {},
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
