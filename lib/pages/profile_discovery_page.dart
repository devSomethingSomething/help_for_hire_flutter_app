/// Imports
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/helpers/delay_helper.dart';
import 'package:help_for_hire_flutter_app/helpers/validation_helper.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/services/job_service.dart';
import 'package:help_for_hire_flutter_app/services/user_service.dart';
import 'package:help_for_hire_flutter_app/widgets/drawers/drawer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/placeholders/empty_placeholder_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/small_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/services/worker_service.dart';
import 'package:provider/provider.dart';

/// This page is used by the Employers to view potential workers
class ProfileDiscoveryPage extends StatelessWidget {
  /// Constructor
  const ProfileDiscoveryPage();

  @override
  Widget build(BuildContext context) {
    // Read in the background, the list is listening for changes and will update
    context.read<WorkerService>().getWorkersInCity(
          locationId: context.read<UserService>().currentUser.locationId,
        );

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.refresh,
            ),
            onPressed: () {
              // Check the connection first to prevent infinite loading
              // Also prevents the list of workers from being deleted, meaning
              // that the user can still look at what has already loaded
              ValidationHelper.checkConnection(
                context: context,
                function: () async {
                  // Since this is an action that the user takes, they expect some
                  // kind of feedback to see that they have done something
                  // Here it is better to display a loading indicator, the call to
                  // the service above does it in the background, but this one is
                  // triggered by the user
                  DelayHelper.showLoadingIndicator(context: context);

                  await context.read<WorkerService>().getWorkersInCity(
                        locationId:
                            context.read<UserService>().currentUser.locationId,
                      );

                  DelayHelper.hideLoadingIndicator(context: context);
                },
              );
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.filter_alt,
            ),
            onPressed: () {
              ValidationHelper.checkConnection(
                context: context,
                function: () async {
                  showDialog(
                    builder: (_) {
                      // Load the list of jobs
                      context.read<JobService>().getJobs();

                      var selectedJobIds = <String>[];

                      return AlertDialog(
                        actions: [
                          TextButton(
                            child: const Text(
                              'CLOSE',
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                          TextButton(
                            child: const Text(
                              'SUBMIT',
                            ),
                            onPressed: () async {
                              if (selectedJobIds.isNotEmpty) {
                                DelayHelper.showLoadingIndicator(
                                    context: context);

                                await context
                                    .read<WorkerService>()
                                    .getWorkersWithSkills(
                                      locationId: context
                                          .read<UserService>()
                                          .currentUser
                                          .locationId,
                                      jobIds: selectedJobIds,
                                    );

                                DelayHelper.hideLoadingIndicator(
                                    context: context);
                              }

                              Navigator.pop(context);
                            },
                          ),
                        ],
                        content: Consumer<JobService>(
                          builder: (_, service, __) {
                            // First check if the map length is zero and there is no error
                            return service.jobs.isEmpty
                                ? Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.blue[900],
                                    ),
                                  )
                                : SingleChildScrollView(
                                    child: Column(
                                      /// This will be used to sort the workers
                                      /// by different selected jobs
                                      children: service.jobs.map(
                                        (job) {
                                          var selected = false;

                                          return StatefulBuilder(
                                            builder: (_, setState) {
                                              return CheckboxListTile(
                                                onChanged: (value) {
                                                  setState(
                                                    () {
                                                      selected = value!;

                                                      value
                                                          ? selectedJobIds
                                                              .add(job.jobId)
                                                          : selectedJobIds
                                                              .remove(
                                                                  job.jobId);
                                                    },
                                                  );
                                                },
                                                title: Text(
                                                  job.title,
                                                ),
                                                value: selected,
                                              );
                                            },
                                          );
                                        },
                                      ).toList(),
                                      mainAxisSize: MainAxisSize.min,
                                    ),
                                  );
                          },
                        ),
                        title: const Text(
                          'Filter Jobs',
                        ),
                      );
                    },
                    context: context,
                  );
                },
              );
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.sort,
            ),
            onPressed: () {
              var groupValue1 = 'Name';

              var groupValue2 = true;

              /// This showDialog will allow the Employer to sort the workers by
              /// Name, Surname or Rating
              showDialog(
                builder: (_) {
                  return AlertDialog(
                    actions: [
                      TextButton(
                        child: const Text(
                          'CLOSE',
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                      TextButton(
                        child: const Text(
                          'SUBMIT',
                        ),
                        onPressed: () async {
                          groupValue1 == 'Name'
                              ? context.read<WorkerService>().sortByName(
                                    alphabetical: groupValue2,
                                  )
                              : groupValue1 == 'Surname'
                                  ? context.read<WorkerService>().sortBySurname(
                                        alphabetical: groupValue2,
                                      )
                                  : context.read<WorkerService>().sortByRatings(
                                        ascending: groupValue2,
                                      );

                          Navigator.pop(context);
                        },
                      ),
                    ],
                    content: StatefulBuilder(
                      builder: (_, setState) {
                        return Column(
                          children: [
                            const Text(
                              'Sort By',
                            ),
                            const SmallSpacerWidget(),
                            RadioListTile<String>(
                              groupValue: groupValue1,
                              onChanged: (value) => setState(
                                () => groupValue1 = value.toString(),
                              ),
                              title: const Text(
                                'Name',
                              ),
                              value: 'Name',
                            ),
                            RadioListTile<String>(
                              groupValue: groupValue1,
                              onChanged: (value) => setState(
                                () => groupValue1 = value.toString(),
                              ),
                              title: const Text(
                                'Surname',
                              ),
                              value: 'Surname',
                            ),
                            RadioListTile<String>(
                              groupValue: groupValue1,
                              onChanged: (value) => setState(
                                () => groupValue1 = value.toString(),
                              ),
                              title: const Text(
                                'Rating',
                              ),
                              value: 'Rating',
                            ),
                            const SmallSpacerWidget(),
                            const Text('Sort Order'),
                            const SmallSpacerWidget(),

                            /// With the Radio List Tile the Employer can sort
                            /// the workers by ascending or descending order
                            RadioListTile<bool>(
                              groupValue: groupValue2,
                              onChanged: (value) => setState(
                                () => groupValue2 = value!,
                              ),
                              title: const Text(
                                'Ascending',
                              ),
                              value: true,
                            ),
                            RadioListTile<bool>(
                              groupValue: groupValue2,
                              onChanged: (value) => setState(
                                () => groupValue2 = value!,
                              ),
                              title: const Text(
                                'Descending',
                              ),
                              value: false,
                            ),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                        );
                      },
                    ),
                    title: const Text(
                      'Sort Profiles',
                    ),
                  );
                },
                context: context,
              );
            },
          ),
        ],
        backgroundColor: Colors.blue[900],
        title: const Text(
          'Profile Discovery',
        ),
      ),
      body: Center(
        child: Consumer<WorkerService>(
          builder: (_, service, __) {
            // First check if the map length is zero and there is no error
            return service.workers.isEmpty
                ? const EmptyPlaceholderWidget(
                    /// Return text if their is no data
                    data: 'No profiles to display',
                  )

                /// Show the history when the data has been loaded
                : ListView.builder(
                    /// List view will lenght of the number of workers
                    itemCount: service.workers.length,
                    itemBuilder: (_, index) {
                      return Card(
                        child: Padding(
                          child: Row(
                            children: [
                              Icon(
                                Icons.person,
                                color: Colors.primaries[Random().nextInt(
                                  Colors.primaries.length,
                                )],
                                size: 48.0,
                              ),
                              const SizedBox(
                                width: 8.0,
                              ),

                              /// Display the Workers name and surname
                              Text(
                                '${service.workers[index].name} ${service.workers[index].surname}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              Row(
                                children: List.generate(
                                  5,
                                  (i) {
                                    /// Display the workers average star rating
                                    return i <
                                            service.workers[index].averageRating
                                        ? const Icon(
                                            Icons.star,
                                            color: Colors.orange,
                                          )
                                        : const Icon(
                                            Icons.star,
                                          );
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 8.0,
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.exit_to_app,
                                ),
                                onPressed: () {
                                  // Set the selected worker in worker service
                                  // This call is important later on for things
                                  // like invites or reports
                                  context.read<WorkerService>().worker =
                                      service.workers[index];

                                  // Navigate to the selected profile page
                                  // Also allows the user to return to this page
                                  // without having to scroll through the whole
                                  // list again, keeps the place
                                  Navigator.pushNamed(
                                    context,
                                    RouteManager.selectedWorkerProfilePage,
                                  );
                                },
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 16.0,
                          ),
                        ),
                        elevation: 4.0,
                      );
                    },
                  );
          },
        ),
      ),
      drawer: const DrawerWidget(),
      drawerEnableOpenDragGesture: false,
    );
  }
}
