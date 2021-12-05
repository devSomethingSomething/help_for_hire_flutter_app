import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/color_constants.dart';
import 'package:help_for_hire_flutter_app/constants/image_constants.dart';
import 'package:help_for_hire_flutter_app/models/employer_model.dart';
import 'package:help_for_hire_flutter_app/models/user_model.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/services/employer_service.dart';
import 'package:help_for_hire_flutter_app/services/location_service.dart';
import 'package:help_for_hire_flutter_app/services/user_service.dart';
import 'package:help_for_hire_flutter_app/widgets/drawers/drawer_widget.dart';
import 'package:provider/provider.dart';
import 'package:side_sheet/side_sheet.dart';
import 'package:help_for_hire_flutter_app/widgets/text_form_fields/text_form_field_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/small_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/medium_spacer_widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/rounded_button_widget.dart';
import 'package:help_for_hire_flutter_app/constants/location_constants.dart';
import 'package:help_for_hire_flutter_app/helpers/snack_bar_helper.dart';
import 'package:help_for_hire_flutter_app/helpers/connection_helper.dart';

class EmployerProfilePage extends StatefulWidget {
  const EmployerProfilePage({Key? key}) : super(key: key);

  @override
  _EmployerProfilePageState createState() => _EmployerProfilePageState();
}

class _EmployerProfilePageState extends State<EmployerProfilePage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();
    TextEditingController _surnameController = TextEditingController();
    TextEditingController _phoneController = TextEditingController();
    TextEditingController _companyNameController = TextEditingController();
    TextEditingController _addressController = TextEditingController();
    TextEditingController _suburbController = TextEditingController();

    var _key = GlobalKey<FormState>();

    String? _province;
    String? _city;

    return Consumer2<UserService, LocationService>(
        builder: (context, user, location, child) {
      context
          .read<LocationService>()
          .getLocation(id: user.currentUser.locationId);
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Profile',
          ),
          backgroundColor: ColorConstants.blue,
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              tooltip: 'Search',
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  RouteManager.profileDiscoveryPage,
                );
              },
            ),
            IconButton(
              onPressed: () {
                SideSheet.right(
                  body: Consumer<UserService>(
                    builder: (context, value, child) {
                      return const DrawerWidget();
                    },
                  ),
                  context: context,
                );
              },
              icon: const Icon(Icons.menu),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: double.infinity,
                height: 250,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30, bottom: 10),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                        backgroundImage: AssetImage(ImageConstants.placeholder),
                        radius: 80,
                      ),
                    ),
                    Text(
                      '${user.currentUser.name} ${user.currentUser.surname}',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              //textWidget('Company Name', '${(user.currentUser as EmployerModel).}'),
              textWidget('Province', '${location.location?.province}'),
              textWidget('City', '${location.location?.city}'),
              textWidget('Suburb', 'suburb'),
              textWidget('Address', 'address'),
              textWidget('Phone Number', user.currentUser.phoneNumber),
              Padding(
                padding: const EdgeInsets.only(
                    top: 30, bottom: 20, left: 20, right: 20),
                child: RoundedButtonWidget(
                  data: 'Edit Details',
                  onPressed: () {
                    //setting default values for edit profile

                    _nameController.text = user.currentUser.name;
                    _surnameController.text = user.currentUser.surname;
                    _phoneController.text = user.currentUser.phoneNumber;
                    //_companyNameController.text = '${location.location.province}';
                    _addressController.text = 'current address';
                    _suburbController.text = 'current suburb';

                    _province = location.location?.province;
                    _city = location.location?.city;

                    showMaterialModalBottomSheet(
                      context: context,
                      expand: true,
                      builder: (context) => SingleChildScrollView(
                        controller: ModalScrollController.of(context),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                  height: 100,
                                  decoration: const BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.vertical(
                                        bottom: Radius.elliptical(300, 80),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black, blurRadius: 4),
                                      ]),
                                  child: const Center(
                                    child: Text(
                                      'Edit Profile Info',
                                      style: TextStyle(
                                          fontSize: 25,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Container(
                                  height: 650,
                                  child: ListView(
                                    children: [
                                      TextFormFieldWidget(
                                          lightMode: true,
                                          controller: _nameController,
                                          labelText: 'name',
                                          icon: Icons.text_format,
                                          keyboardType: TextInputType.name),
                                      const SmallSpacerWidget(),
                                      TextFormFieldWidget(
                                          lightMode: true,
                                          controller: _surnameController,
                                          labelText: 'surname',
                                          icon: Icons.text_fields,
                                          keyboardType: TextInputType.name),
                                      const SmallSpacerWidget(),
                                      TextFormFieldWidget(
                                          lightMode: true,
                                          controller: _phoneController,
                                          labelText: 'phone NO',
                                          icon: Icons.phone,
                                          keyboardType: TextInputType.name),
                                      const SmallSpacerWidget(),
                                      TextFormFieldWidget(
                                          lightMode: true,
                                          controller: _companyNameController,
                                          labelText: 'company name (optional)',
                                          icon: Icons.business_sharp,
                                          keyboardType: TextInputType.name),
                                      const MediumSpacerWidget(),
                                      Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: ColorConstants.blue,
                                              width: 1),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(
                                              8.0,
                                            ),
                                          ),
                                          color: Colors.white,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0,
                                        ),
                                        child: DropdownButtonFormField<String>(
                                          decoration: const InputDecoration(
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.white,
                                              ),
                                            ),
                                            labelText: 'Province',
                                            errorStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                          iconSize: 28.0,
                                          value: _province,
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
                                          onChanged: (province) {
                                            _province = province;
                                            context
                                                .read<LocationService>()
                                                .getCitiesInProvince(
                                                  province: province.toString(),
                                                );
                                          },
                                          validator: (value) => value == null
                                              ? 'Please select a province'
                                              : null,
                                        ),
                                      ),
                                      const MediumSpacerWidget(),
                                      Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: ColorConstants.blue,
                                              width: 1),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(
                                              8.0,
                                            ),
                                          ),
                                          color: Colors.white,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0,
                                        ),
                                        child: DropdownButtonFormField(
                                          decoration: const InputDecoration(
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.white,
                                              ),
                                            ),
                                            labelText: 'City',
                                            errorStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                          iconSize: 28.0,
                                          items: location.locations
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
                                          value: location.location?.province ==
                                                  _province
                                              ? _city
                                              : location.locations.first.city,
                                          validator: (value) => value == null
                                              ? 'Please select a city'
                                              : null,
                                        ),
                                      ),
                                      const SmallSpacerWidget(),
                                      TextFormFieldWidget(
                                          lightMode: true,
                                          controller: _addressController,
                                          labelText: 'address',
                                          icon: Icons.home,
                                          keyboardType: TextInputType.name),
                                      const SmallSpacerWidget(),
                                      TextFormFieldWidget(
                                          lightMode: true,
                                          controller: _suburbController,
                                          labelText: 'suburb',
                                          icon: Icons.home,
                                          keyboardType: TextInputType.name),
                                      const SmallSpacerWidget(),
                                      RoundedButtonWidget(
                                        invertColors: true,
                                        data: 'Submit',
                                        onPressed: () async {
                                          if (_key.currentState!.validate()) {
                                            if (await ConnectionHelper
                                                .hasConnection()) {
                                              context
                                                  .read<EmployerService>()
                                                  .putEmployer(
                                                    id: user.currentUser.userId,
                                                    employer: EmployerModel(
                                                      companyName: '',
                                                      address: '',
                                                      suburb: '',
                                                      user: UserModel(
                                                        userId: user
                                                            .currentUser.userId,
                                                        name: _nameController
                                                            .text,
                                                        surname:
                                                            _surnameController
                                                                .text,
                                                        phoneNumber:
                                                            _phoneController
                                                                .text,
                                                        locationId: context
                                                            .read<
                                                                LocationService>()
                                                            .locations
                                                            .firstWhere(
                                                              (location) =>
                                                                  location
                                                                      .city ==
                                                                  _city,
                                                            )
                                                            .locationId,
                                                      ),
                                                    ),
                                                  );

                                              Navigator.pop(context);
                                              setState(() {});
                                            } else {
                                              SnackBarHelper.showSnackBar(
                                                context: context,
                                                data: 'No internet connection',
                                              );
                                            }
                                          } else {
                                            SnackBarHelper.showSnackBar(
                                              context: context,
                                              data:
                                                  'Please complete all fields',
                                            );
                                          }
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
                    );
                  },
                  invertColors: true,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

Padding textWidget(String title, String content) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: Container(
      height: 55,
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          text(title),
          text(content),
        ],
      ),
    ),
  );
}

Text text(String txt) {
  return Text(
    txt,
    style: const TextStyle(
        color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
  );
}
