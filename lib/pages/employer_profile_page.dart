/// Imports
import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/color_constants.dart';
import 'package:help_for_hire_flutter_app/helpers/delay_helper.dart';
import 'package:help_for_hire_flutter_app/helpers/info_helper.dart';
import 'package:help_for_hire_flutter_app/models/employer_model.dart';
import 'package:help_for_hire_flutter_app/models/user_model.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/services/employer_service.dart';
import 'package:help_for_hire_flutter_app/services/location_service.dart';
import 'package:help_for_hire_flutter_app/services/user_service.dart';
import 'package:help_for_hire_flutter_app/widgets/app_bars/app_bar_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/drawers/drawer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/medium_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/small_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text_form_fields/text_form_field_widget.dart';
import 'package:provider/provider.dart';

/// This page will display an employers details
/// They will also be able to edit their details
class EmployerProfilePage extends StatefulWidget {
  /// Constructor
  const EmployerProfilePage();

  @override
  _EmployerProfilePageState createState() => _EmployerProfilePageState();
}

class _EmployerProfilePageState extends State<EmployerProfilePage> {
  /// The _key variable is used to validate form fields
  final _key = GlobalKey<FormState>();

  /// Variables for the Text editing controllers
  final _phoneNumberController = TextEditingController();
  final _companyNameController = TextEditingController();
  final _addressController = TextEditingController();
  final _suburbController = TextEditingController();

  var _editMode = false;

  /// Method dispose is used to clear any controllers when the page is built
  @override
  void dispose() {
    _phoneNumberController.dispose();
    _companyNameController.dispose();
    _addressController.dispose();
    _suburbController.dispose();

    super.dispose();
  }

  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    /// Read in the background, this is listening for changes and will update
    context.read<LocationService>().getLocation(
          id: context.read<UserService>().currentUser.locationId,
        );

    /// Initialize the controllers
    _phoneNumberController.text =
        context.read<UserService>().currentUser.phoneNumber;
    _companyNameController.text =
        (context.read<UserService>().currentUser as EmployerModel).companyName;
    _addressController.text =
        (context.read<UserService>().currentUser as EmployerModel).address;
    _suburbController.text =
        (context.read<UserService>().currentUser as EmployerModel).suburb;

    return Consumer2<UserService, LocationService>(
        builder: (context, user, location, child) {
      return Scaffold(
        appBar: AppBarWidget(
          actions: [
            IconButton(
              icon: const Icon(
                Icons.password,
              ),

              /// Navigate to the Change Password Page
              onPressed: () => Navigator.pushNamed(
                context,
                RouteManager.changePasswordPage,
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.info_outline_rounded,
              ),

              /// Dialog that displays what the page is for
              onPressed: () => InfoHelper.showInfoDialog(
                context: context,
                content: 'This page shows your details',
                title: 'Profile Details',
              ),
            ),
          ],
          data: 'Profile',
        ),

        /// Single child scroll view is used to prevent overflow and makes
        /// the page scrollable
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                CircleAvatar(
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
                const SmallSpacerWidget(),

                /// Get the name and surname from the User Service class which is
                /// connected to the database
                Text(
                  '${context.read<UserService>().currentUser.name} '
                  '${context.read<UserService>().currentUser.surname}',
                  style: const TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const MediumSpacerWidget(),
                const Text(
                  'Common',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SmallSpacerWidget(),

                /// _editMode variable will check if the user clicked
                /// the edit details button and then if it is true they can
                /// edit their Phone Number and Location
                /// _editMode will be initialized to false by default
                _editMode
                    ? TextFormFieldWidget(
                        controller: _phoneNumberController,
                        labelText: 'Phone Number',
                        keyboardType: TextInputType.text,
                        lightMode: true,
                        icon: Icons.phone,
                      )
                    : _underlinedTextWidget(
                        leftData: 'Phone Number:',
                        rightData:
                            context.read<UserService>().currentUser.phoneNumber,
                      ),
                const MediumSpacerWidget(),
                const Text(
                  'Location',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SmallSpacerWidget(),
                _underlinedTextWidget(
                  leftData: 'Province:',
                  rightData:
                      context.read<LocationService>().location?.province ?? '',
                ),
                const SmallSpacerWidget(),
                _underlinedTextWidget(
                  leftData: 'City:',
                  rightData:
                      context.read<LocationService>().location?.city ?? '',
                ),
                const MediumSpacerWidget(),
                const Text(
                  'Employer',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SmallSpacerWidget(),

                /// _editMode variable will check if the user clicked
                /// the edit details button and then if it is true they can
                /// edit their Company name
                /// _editMode will be initialized to false by default
                _editMode
                    ? TextFormFieldWidget(
                        controller: _companyNameController,
                        labelText: 'Company Name',
                        keyboardType: TextInputType.text,
                        lightMode: true,
                        icon: Icons.location_city,
                      )
                    : _underlinedTextWidget(
                        leftData: 'Company Name:',
                        rightData: (context.read<UserService>().currentUser
                                as EmployerModel)
                            .companyName,
                      ),
                const SmallSpacerWidget(),

                /// _editMode variable will check if the user clicked
                /// the edit details button and then if it is true they can
                /// edit their Address
                /// _editMode will be initialized to false by default
                _editMode
                    ? TextFormFieldWidget(
                        controller: _addressController,
                        labelText: 'Address',
                        keyboardType: TextInputType.text,
                        lightMode: true,
                        icon: Icons.home,
                      )
                    : _underlinedTextWidget(
                        leftData: 'Address:',
                        rightData: (context.read<UserService>().currentUser
                                as EmployerModel)
                            .address,
                      ),
                const SmallSpacerWidget(),

                /// _editMode variable will check if the user clicked
                /// the edit details button and then if it is true they can
                /// edit their Suburb
                /// _editMode will be initialized to false by default
                _editMode
                    ? TextFormFieldWidget(
                        controller: _suburbController,
                        labelText: 'Suburb',
                        keyboardType: TextInputType.text,
                        lightMode: true,
                        icon: Icons.streetview,
                      )
                    : _underlinedTextWidget(
                        leftData: 'Suburb:',
                        rightData: (context.read<UserService>().currentUser
                                as EmployerModel)
                            .suburb,
                      ),
              ],
            ),
          ),
          padding: const EdgeInsets.all(
            32.0,
          ),
        ),
        drawer: const DrawerWidget(),
        drawerEnableOpenDragGesture: false,
        floatingActionButton: FloatingActionButton(
          backgroundColor: ColorConstants.darkBlue,
          child: const Icon(
            Icons.edit,
          ),
          // Clean up here
          /// onPressed function for when a user is done editing their details
          onPressed: () async {
            /// Checks if _editMode variable is true or false
            if (_editMode) {
              DelayHelper.showLoadingIndicator(context: context);

              /// Saves any changes the user made to their profile
              await context.read<EmployerService>().putEmployer(
                    id: context.read<UserService>().currentUser.userId,
                    employer: EmployerModel(
                      companyName: _companyNameController.text,
                      address: _addressController.text,
                      suburb: _suburbController.text,
                      user: UserModel(
                        userId: context.read<UserService>().currentUser.userId,
                        name: context.read<UserService>().currentUser.name,
                        surname:
                            context.read<UserService>().currentUser.surname,
                        phoneNumber: _phoneNumberController.text,
                        locationId:
                            context.read<UserService>().currentUser.locationId,
                      ),
                    ),
                  );

              await context.read<UserService>().loadUser(context: context);

              DelayHelper.hideLoadingIndicator(context: context);
            }

            setState(
              () => _editMode = !_editMode,
            );
          },
        ),
      );
    });
  }

  /// _underLinedTextWidget will be used when the user wants
  /// to edit their details
  Widget _underlinedTextWidget({
    ///required variables
    required String leftData,
    required String rightData,
  }) {
    return Container(
      child: Row(
        children: [
          Text(
            leftData,
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
          Text(
            rightData,
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
