/// Imports
import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/color_constants.dart';
import 'package:help_for_hire_flutter_app/helpers/delay_helper.dart';
import 'package:help_for_hire_flutter_app/helpers/info_helper.dart';
import 'package:help_for_hire_flutter_app/models/user_model.dart';
import 'package:help_for_hire_flutter_app/models/worker_model.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/services/location_service.dart';
import 'package:help_for_hire_flutter_app/services/user_service.dart';
import 'package:help_for_hire_flutter_app/widgets/app_bars/app_bar_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/drawers/drawer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/small_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/services/worker_service.dart';
import 'package:provider/provider.dart';
import 'package:help_for_hire_flutter_app/widgets/text_form_fields/text_form_field_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/medium_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/services/job_service.dart';

/// Shows the profile page for a worker account type
class WorkerProfilePage extends StatefulWidget {
  /// Constructor
  const WorkerProfilePage();

  /// Creates the state for this page
  @override
  _WorkerProfilePageState createState() => _WorkerProfilePageState();
}

/// The state for the worker profile page
class _WorkerProfilePageState extends State<WorkerProfilePage> {
  /// Cleans up any unneeded objects or resources
  @override
  void dispose() {
    _phoneController.dispose();
    _descriptionController.dispose();
    _partController.dispose();
    _feeController.dispose();
    _fullController.dispose();

    super.dispose();
  }

  /// Controllers
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _feeController = TextEditingController();
  final _phoneController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _fullController = TextEditingController();
  final _partController = TextEditingController();
  var _editMode = false;

  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    String? _city;
    bool _fullTime = false;
    bool _partTime = false;

    _nameController.text = 'current name';
    _surnameController.text = 'current surname';
    _feeController.text = 'current min fee';
    _phoneController.text = 'current cell NO';
    _descriptionController.text = 'current description';

    context.read<JobService>().getSelectedJobs(
          jobIds:
              (context.read<UserService>().currentUser as WorkerModel).jobIds,
        );

    return Consumer2<UserService, LocationService>(
        builder: (context, user, location, child) {
      context
          .read<LocationService>()
          .getLocation(id: user.currentUser.locationId);

      return Scaffold(
        appBar: AppBarWidget(
          actions: [
            IconButton(
              icon: const Icon(
                Icons.password,
              ),
              onPressed: () => Navigator.pushNamed(
                context,
                RouteManager.changePasswordPage,
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.info_outline_rounded,
              ),
              onPressed: () => InfoHelper.showInfoDialog(
                context: context,
                content: 'This page shows your details',
                title: 'Profile Details',
              ),
            ),
          ],
          data: 'Profile',
        ),
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
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 100,
                    width: 350,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
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
                const SmallSpacerWidget(),
                _editMode
                    ? TextFormFieldWidget(
                        controller: _phoneController,
                        labelText: 'Phone Number',
                        keyboardType: TextInputType.text,
                        lightMode: true,
                        icon: Icons.phone,
                      )
                    : _underlinedTextWidget(
                        leftData: 'Phone Number',
                        rightData: context
                            .read<UserService>()
                            .currentUser
                            .phoneNumber),
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
                  'Worker',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SmallSpacerWidget(),
                Consumer<JobService>(
                  builder: (context, value, child) {
                    String jobList = '';

                    context
                        .read<JobService>()
                        .jobs
                        .forEach((job) => jobList += '${job.title} \n');

                    return _underlinedTextWidget(
                      leftData: 'Jobs',
                      rightData: jobList,
                    );
                  },
                ),
                const SmallSpacerWidget(),
                _editMode
                    ? TextFormFieldWidget(
                        controller: _feeController,
                        labelText: 'Min Fee',
                        keyboardType: TextInputType.text,
                        lightMode: true,
                        icon: Icons.money,
                      )
                    : _underlinedTextWidget(
                        leftData: 'Min Fee',
                        rightData:
                            '${(context.read<UserService>().currentUser as WorkerModel).minimumFee}'),
                const SmallSpacerWidget(),
                _editMode
                    ? TextFormFieldWidget(
                        controller: _fullController,
                        labelText: 'Full Time',
                        keyboardType: TextInputType.text,
                        lightMode: true,
                        icon: Icons.work,
                      )
                    : _underlinedTextWidget(
                        leftData: 'Full Time',
                        rightData:
                            '${(context.read<UserService>().currentUser as WorkerModel).fullTime}'),
                const SmallSpacerWidget(),
                _editMode
                    ? TextFormFieldWidget(
                        controller: _partController,
                        labelText: 'Part Time',
                        keyboardType: TextInputType.text,
                        lightMode: true,
                        icon: Icons.work,
                      )
                    : _underlinedTextWidget(
                        leftData: 'Part Time',
                        rightData:
                            '${(context.read<UserService>().currentUser as WorkerModel).partTime}'),
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
          onPressed: () async {
            if (_editMode) {
              DelayHelper.showLoadingIndicator(context: context);

              await context.read<WorkerService>().putWorker(
                    id: context.read<UserService>().currentUser.userId,
                    worker: WorkerModel(
                        description: _descriptionController.text,
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
                        )),
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

  Padding textWidget(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        height: 55,
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.black))),
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
      style: const TextStyle(color: Colors.black, fontSize: 16),
    );
  }
}

Widget _underlinedTextWidget({
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
