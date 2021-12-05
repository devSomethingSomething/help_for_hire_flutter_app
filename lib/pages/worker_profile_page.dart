import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/color_constants.dart';
import 'package:help_for_hire_flutter_app/constants/image_constants.dart';
import 'package:help_for_hire_flutter_app/helpers/validation_helper.dart';
import 'package:help_for_hire_flutter_app/models/user_model.dart';
import 'package:help_for_hire_flutter_app/models/worker_model.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/services/location_service.dart';
import 'package:help_for_hire_flutter_app/services/user_service.dart';
import 'package:help_for_hire_flutter_app/widgets/drawers/drawer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/small_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/services/worker_service.dart';
import 'package:provider/provider.dart';
import 'package:side_sheet/side_sheet.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/rounded_button_widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:help_for_hire_flutter_app/widgets/text_form_fields/text_form_field_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text_fields/description_text_field.dart';
import 'package:help_for_hire_flutter_app/widgets/amount_time_checkbox_widget.dart';
import 'package:help_for_hire_flutter_app/constants/location_constants.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/medium_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/services/job_service.dart';
import 'package:help_for_hire_flutter_app/widgets/jobs_dropdown_widget.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:help_for_hire_flutter_app/models/job_model.dart';
import 'package:help_for_hire_flutter_app/helpers/connection_helper.dart';
import 'package:help_for_hire_flutter_app/helpers/snack_bar_helper.dart';

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

    var _key = GlobalKey<FormState>();
    String? _province;
    String? _city;
    String _jobs = '';
    bool _fullTime = false;
    bool _partTime = false;
    //setting default values for edit profile
    _nameController.text = 'current name';
    _surnameController.text = 'current surname';
    _feeController.text = 'current min fee';
    _phoneController.text = 'current cell NO';
    _descriptionController.text = 'current description';

    //the logic for the checkbox can be added on the check box widget.

    return Consumer3<UserService, LocationService, JobService>(
        builder: (context, user, location, job, child) {
      context
          .read<LocationService>()
          .getLocation(id: user.currentUser.locationId);
      context
          .read<JobService>()
          .getSelectedJobs(ids: (user.currentUser as WorkerModel).jobIds);
      _jobs = job.selectedJobs.length < 2
          ? job.selectedJobs[0].title
          : job.selectedJobs.length > 2
              ? '${job.selectedJobs[0].title}, ${job.selectedJobs[1].title}'
              : '${job.selectedJobs[0].title}, ${job.selectedJobs[1].title}, ect...';

      return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          backgroundColor: ColorConstants.darkBlue,
          actions: [
            IconButton(
              icon: Icon(Icons.search),
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
                    const Padding(
                      padding: EdgeInsets.only(top: 30, bottom: 10),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                        backgroundImage: AssetImage(ImageConstants.placeholder),
                        radius: 80,
                      ),
                    ),
                    Text(
                      '${user.currentUser.name} ${user.currentUser.surname}',
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 30,
                ),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text((user.currentUser as WorkerModel).description),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              textWidget('Jobs', ''),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text(_jobs),
              ),
              textWidget('Province', '${location.location?.province}'),
              textWidget('City', '${location.location?.city}'),
              textWidget('Min Fee',
                  '${(user.currentUser as WorkerModel).minimumFee}'), //please have a look here
              textWidget('Phone Number', user.currentUser.phoneNumber),
              Padding(
                padding: const EdgeInsets.only(
                    top: 30, bottom: 20, left: 20, right: 20),
                child: RoundedButtonWidget(
                  data: 'Edit Details',
                  onPressed: () {
                    _nameController.text = user.currentUser.name;
                    _surnameController.text = user.currentUser.surname;
                    _feeController.text =
                        '${(user.currentUser as WorkerModel).minimumFee}';
                    _phoneController.text = user.currentUser.phoneNumber;
                    _descriptionController.text =
                        (user.currentUser as WorkerModel).description;

                    _province = location.location?.province;
                    _city = location.location?.city;

                    _fullTime = (user.currentUser as WorkerModel).fullTime;
                    _partTime = (user.currentUser as WorkerModel).partTime;

                    //the logic for default location must be added

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
                                          labelText: 'Name',
                                          icon: Icons.text_format,
                                          keyboardType: TextInputType.name),
                                      const SmallSpacerWidget(),
                                      TextFormFieldWidget(
                                          lightMode: true,
                                          controller: _surnameController,
                                          labelText: 'Surname',
                                          icon: Icons.text_fields,
                                          keyboardType: TextInputType.name),
                                      const SmallSpacerWidget(),
                                      TextFormFieldWidget(
                                          lightMode: true,
                                          controller: _phoneController,
                                          labelText: 'Phone Number',
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
                                      //please have a look at this code
                                      Consumer<JobService>(
                                        builder: (_, service, __) {
                                          return JobsDropdownWidget(
                                            jobsList: service.jobs
                                                .map((job) =>
                                                    MultiSelectItem<JobModel>(
                                                        job, job.title))
                                                .toList(),
                                            globalKey: _key,
                                          );
                                        },
                                      ),
                                      TextFormFieldWidget(
                                          lightMode: true,
                                          controller: _feeController,
                                          labelText: 'Min Fee',
                                          icon: Icons.attach_money,
                                          keyboardType: TextInputType.name),
                                      const SmallSpacerWidget(),

                                      Column(
                                        children: [
                                          AmountTimeCheckBox(
                                            color: ColorConstants.darkBlue,
                                            data: 'Full Time',

                                            time: _fullTime,

                                            onChanged: (value) {
                                              _fullTime = value!;
                                            },
                                          ),
                                          AmountTimeCheckBox(
                                            color: ColorConstants.darkBlue,
                                            data: 'Part Time',
                                            time: _partTime,

                                            onChanged: (value) {
                                              _partTime = value!;
                                            },
                                          ),
                                        ],
                                      ),

                                    Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: ColorConstants.darkBlue,
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
                                    ),
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
                                      RoundedButtonWidget(
                                        invertColors: true,
                                        data: 'Submit',
                                        onPressed: () async {
                                          if (_key.currentState!.validate()) {
                                            if (await ConnectionHelper.hasConnection()) {
                                              context.read<WorkerService>().putWorker(
                                                id: user.currentUser.userId,
                                                    worker: WorkerModel(
                                                      description:
                                                          _descriptionController.text,
                                                      minimumFee: int.parse(_feeController.text),
                                                      fullTime: _fullTime,
                                                      partTime: _partTime,
                                                      jobIds: context
                                                          .read<JobService>()
                                                          .selectedJobs
                                                          .map(
                                                            (job) => job.jobId,
                                                          )
                                                          .toList(),
                                                      user: UserModel(
                                                        userId: user.currentUser.userId,
                                                        locationId: context
                                                            .read<LocationService>()
                                                            .locations
                                                            .firstWhere(
                                                              (location) => location.city == _city,
                                                        )
                                                            .locationId,
                                                        name: _nameController.text,
                                                        surname: _surnameController.text,
                                                        phoneNumber: _phoneController.text,
                                                      )
                                                    ),
                                                  );

                                              // collapse bottom sheet

                                              Navigator.pop(context);
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
    });
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
            text('$content'),
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
}
