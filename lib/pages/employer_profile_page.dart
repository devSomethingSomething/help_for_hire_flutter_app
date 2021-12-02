import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/color_constants.dart';
import 'package:help_for_hire_flutter_app/constants/image_constants.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/services/user_service.dart';
import 'package:help_for_hire_flutter_app/widgets/drawers/drawer_widget.dart';
import 'package:provider/provider.dart';
import 'package:side_sheet/side_sheet.dart';
import 'package:help_for_hire_flutter_app/widgets/text_form_fields/text_form_field_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/small_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/medium_spacer_widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/rounded_button_widget.dart';


class EmployerProfilePage extends StatelessWidget {
  const EmployerProfilePage();

  @override
  Widget build(BuildContext context) {

    TextEditingController _nameController = TextEditingController();
    TextEditingController _surnameController = TextEditingController();
    TextEditingController _feeController = TextEditingController();
    TextEditingController _phoneController = TextEditingController();
    TextEditingController _companyNameController = TextEditingController();

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
                    padding: const EdgeInsets.only(top: 30, bottom: 10),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      backgroundImage: AssetImage(ImageConstants.placeholder),
                      radius: 80,
                    ),
                  ),
                  Text(
                    'Name Surname',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            textWidget('Company Name', 'name'),
            textWidget('Province', 'province'),
            textWidget('City', 'city'),
            textWidget('Suburb', 'suburb'),
            textWidget('Address', 'address'),
            textWidget('Phone Number', '000 000 0000'),
            Padding(
              padding:
              EdgeInsets.only(top: 30, bottom: 20, left: 20, right: 20),
              child: RoundedButtonWidget(
                data: 'Edit Details',
                onPressed: () {
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
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.vertical(
                                      bottom: Radius.elliptical(300, 80),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black, blurRadius: 4),
                                    ]),
                                child: Center(
                                  child: Text(
                                    'Edit Profile Info',
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                            Padding(
                              padding: EdgeInsets.only(left: 20, right: 20),
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
                                        controller: _feeController,
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
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                            8.0,
                                          ),
                                        ),
                                        color: Colors.white,
                                      ),
                                      padding: EdgeInsets.symmetric(
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
                                        items: [],
                                        //LocationConstants.provinces
                                        //     .map(
                                        //       (value) => DropdownMenuItem(
                                        //     value: value,
                                        //     child: Text(
                                        //       value,
                                        //     ),
                                        //   ),
                                        // )
                                        //     .toList(),
                                        onChanged: (province) {
                                          // context
                                          //     .read<LocationService>()
                                          //     .getCitiesInProvince(
                                          //   province: province.toString(),
                                          // );
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
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                            8.0,
                                          ),
                                        ),
                                        color: Colors.white,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 16.0,
                                      ),
                                      child: DropdownButtonFormField<String>(
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
                                        items: [],
                                        //LocationConstants.provinces
                                        //     .map(
                                        //       (value) => DropdownMenuItem(
                                        //     value: value,
                                        //     child: Text(
                                        //       value,
                                        //     ),
                                        //   ),
                                        // )
                                        //     .toList(),
                                        onChanged: (province) {
                                          // context
                                          //     .read<LocationService>()
                                          //     .getCitiesInProvince(
                                          //   province: province.toString(),
                                          // );
                                        },
                                        validator: (value) => value == null
                                            ? 'Please select a province'
                                            : null,
                                      ),
                                    ),
                                    const SmallSpacerWidget(),
                                    TextFormFieldWidget(
                                        lightMode: true,
                                        controller: _feeController,
                                        labelText: 'address',
                                        icon: Icons.home,
                                        keyboardType: TextInputType.name),
                                    const SmallSpacerWidget(),
                                    TextFormFieldWidget(
                                        lightMode: true,
                                        controller: _feeController,
                                        labelText: 'suburb',
                                        icon: Icons.home,
                                        keyboardType: TextInputType.name),
                                    const SmallSpacerWidget(),
                                    RoundedButtonWidget(
                                      invertColors: true,
                                      data: 'Submit',
                                      onPressed: () {},
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
  }

  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

Padding textWidget(String title, String content) {
  return Padding(
    padding: EdgeInsets.only(left: 20, right: 20),
    child: Container(
      height: 55,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          text(title),
          text('$content'),
        ],
      ),
    ),
  );
}

Text text(String txt) {
  return Text(
    txt,
    style: TextStyle(
        color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
  );
}