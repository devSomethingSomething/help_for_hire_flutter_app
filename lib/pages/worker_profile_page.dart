import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/color_constants.dart';
import 'package:help_for_hire_flutter_app/constants/image_constants.dart';
import 'package:help_for_hire_flutter_app/helpers/validation_helper.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/services/user_service.dart';
import 'package:help_for_hire_flutter_app/widgets/drawers/drawer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/small_spacer_widget.dart';
import 'package:provider/provider.dart';
import 'package:side_sheet/side_sheet.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/rounded_button_widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:help_for_hire_flutter_app/widgets/text_form_fields/text_form_field_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text_fields/description_text_field.dart';
import 'package:help_for_hire_flutter_app/widgets/amount_time_checkbox_widget.dart';
import 'package:help_for_hire_flutter_app/helpers/check_box_helper.dart';
import 'package:help_for_hire_flutter_app/services/job_service.dart';
import 'package:help_for_hire_flutter_app/widgets/jobs_dropdown_widget.dart';

class WorkerProfilePage extends StatefulWidget {
  const WorkerProfilePage({Key? key}) : super(key: key);

  @override
  _WorkerProfilePageState createState() => _WorkerProfilePageState();
}

class _WorkerProfilePageState extends State<WorkerProfilePage> {

  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();
    TextEditingController _surnameController = TextEditingController();
    TextEditingController _feeController = TextEditingController();
    TextEditingController _phoneController = TextEditingController();
    TextEditingController _descriptionController = TextEditingController();

    //setting default values for edit profile
    _nameController.text='current name';
    _surnameController.text='current surname';
    _feeController.text='current min fee';
    _phoneController.text='current cell NO';
    _descriptionController.text='current description';

    //the logic for the checkbox can be added on the check box widget.

    //the logic for default location must be added


    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: ColorConstants.blue,
        actions: [
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search',
            onPressed: () {
              Navigator.pushNamed(context, RouteManager.profileDiscoveryPage);
            },
          ),
          IconButton(
            onPressed: () {
              SideSheet.right(
                body: Consumer<UserService>(builder: (context, value, child) {
                  return DrawerWidget();
                }),
                context: context,
              );
            },
            icon: Icon(Icons.menu),
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
                    'name surname',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 30,
              ),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('discription'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            textWidget('Jobs', ''),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Text('painting, gardening, ext...'),
            ),
            textWidget('Province', 'province'),
            textWidget('City', 'city'),
            textWidget('Min Fee', 'R ??'),
            textWidget('Phone Number', '000 000 0000'),
            Padding(
              padding:
                  EdgeInsets.only(top: 30, bottom: 20, left: 20, right: 20),
              child: RoundedButtonWidget(
                data: 'edit details',
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
                                    SizedBox(
                                      height: 100,
                                      child: DescriptionTextbox(
                                        color: ColorConstants.blue,
                                        descriptionController:
                                            _descriptionController,
                                        data: 'Description',
                                        keyboardType: TextInputType.text,
                                        maxLines: 3,
                                        validator: ValidationHelper
                                            .validateDescription,
                                      ),
                                    ),
                                    const SmallSpacerWidget(),
                                    //please make this one work. remove this comment after the code has been implemented.
                                    /* Consumer<JobService>(
                                      builder: (_, service, __) {
                                        return JobsDropdownWidget(
                                          jobsList: service.jobs
                                              .map(
                                                (job) => MultiSelectItem<JobModel>(
                                              job,
                                              job.title,
                                            ),
                                          )
                                              .toList(),
                                          globalKey: GlobalKey<FormState>(),
                                        );
                                      },
                                    ),*/
                                    TextFormFieldWidget(
                                        lightMode: true,
                                        controller: _feeController,
                                        labelText: 'min fee',
                                        icon: Icons.attach_money,
                                        keyboardType: TextInputType.name),
                                    const SmallSpacerWidget(),

                                    Consumer<CheckBoxHelper>(builder:
                                        (context, currentState, child) {
                                      return Column(
                                        children: [
                                          AmountTimeCheckBox(
                                            color: ColorConstants.blue,
                                            data: 'Full Time',
                                            time: currentState.fullTime,//current state for Part Time
                                            onChanged: (value) {
                                              currentState.fullTime = value!;
                                            },
                                          ),
                                          AmountTimeCheckBox(
                                            color: ColorConstants.blue,
                                            data: 'Part Time',
                                            time: currentState.partTime,//current state for Part Time
                                            onChanged: (value) {
                                              currentState.partTime = value!;
                                            },
                                          ),
                                        ],
                                      );
                                    }),
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
                                    const SmallSpacerWidget(),
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
                                    RoundedButtonWidget(
                                      invertColors: true,
                                      data: 'Submit',
                                      onPressed: () {},
                                    ),
                                    const SmallSpacerWidget(),
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
}
